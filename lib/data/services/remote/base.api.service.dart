import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_logger.dart';
import '../../cache/config.dart';
import '../../../utils/constants.dart';
import '../../cache/database_keys.dart';
import '../../model/default.model.dart';

String? newToken;


connect({bool? useFormData}) {
  BaseOptions options = BaseOptions(
      baseUrl: Config.baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      responseType: ResponseType.plain);
  Dio dio = Dio(options);
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {


        String? value = await  storageService.read(key: StorageKey.tokenTableKey);
        AppLogger.debug("ACCESS::: $value");
        if (value != null && value.isNotEmpty) {
          options.headers['Authorization'] = "Bearer $value";
          if(useFormData == true){
            options.headers['Content-Type'] = "multipart/form-data";
          }else{
            options.headers['Content-Type'] = "application/json";
          }
        }else{
          if(useFormData == true){
            options.headers['Content-Type'] = "multipart/form-data";
          }else{
            options.headers['Content-Type'] = "application/json";
          }
        }

        log("Request Data::: ${jsonEncode(options.data)}");
        log("Request Path::: ${jsonEncode(options.uri.path)}");
        log("Request Path::: ${jsonEncode(options.headers)}");
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        AppLogger.debug("SERVER RESPONSE::: ${response.data}");
        return handler.next(response);
      },
      onError: errorHandler,
    ),
  );

  return dio;
}

bool isJson(String str) {
  try {
    json.decode(str);
    return true;
  } catch (e) {
    return false;
  }
}


Future _retry(RequestOptions requestOptions) async {

  final options = Options(
      method: requestOptions.method,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $newToken'});

  return connect().request(requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options);
}

refresh() {
  BaseOptions options = BaseOptions(
      baseUrl: Config.baseUrl,
      connectTimeout: const Duration(milliseconds: 100000),
      receiveTimeout: const Duration(milliseconds: 100000),
      responseType: ResponseType.plain);
  Dio dio = Dio(options);
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        AppLogger.debug(options.uri.path);
        AppLogger.debug(options.data.toString());

        String? value = await storageService.read(key: StorageKey.refreshTokenKey);
        AppLogger.debug("REFRESH TOKEN::: $value");
        if (value != null && value.isNotEmpty) {
          options.headers['x-refresh-token'] = value;
        }
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        log("SERVER RESPONSE::: ${response.data}");
        return handler.next(response);
      },
      onError: errorHandler,
    ),
  );

  return dio;
}

Future<bool> refreshAuthToken() async {
  try {
    Response response = await refresh().post('auth/refresh');

    if (response.statusCode == 201 || response.statusCode == 200) {
      log('refresh token went through');
      log("result : ${response.data}");
      // RefreshResponse res = RefreshResponse.fromJson(jsonDecode(response.data));
      // newToken = res.accessToken;
      // LoginResponse responseData = LoginResponse(
      //     refreshToken: res.refreshToken,
      //     accessToken: res.accessToken
      // );
      // userService.storeToken(responseData);
      return true;
    } else if (response.statusCode == 401) {
      log('refreshAuthToken');
      return false;
    } else {

      log('refresh token is wrong');
      storageService.deleteItem(key: StorageKey.refreshTokenKey);
      storageService.deleteItem(key: StorageKey.tokenTableKey);
      userService.logout();

      return false;
    }
  } catch (e) {
    return false;
  }
}

errorHandler(DioException e,  ErrorInterceptorHandler handler) async {
  AppLogger.debug("STATUS CODE::: ${e.response?.statusCode}");
  switch (e.type) {
    case DioExceptionType.connectionError:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionTimeout:
      return handler.next(DioException(response: Response(data: {"message": "Your internet connection is unstable"},
          requestOptions: e.requestOptions), requestOptions:  e.requestOptions)
      );
    case DioExceptionType.cancel:
      return handler.next(DioException(response: Response(data: {"message": "Request cancelled"},
          requestOptions: e.requestOptions), requestOptions:  e.requestOptions)
      );

    case DioExceptionType.unknown:
      return handler.next(DioException(response: Response(data: {"message": "An unknown error occurred"},
          requestOptions: e.requestOptions), requestOptions:  e.requestOptions)
      );

    case DioExceptionType.badResponse:
      if (e.response == null) {
        return handler.next(DioException(response: Response(data: {"message": "An unknown error occurred"},
            requestOptions: e.requestOptions), requestOptions:  e.requestOptions)
        );
      }
      switch (e.response!.statusCode) {
        case 409:
          return handler.next(DioException(response: Response(data: {"message": _getErrorMessage(e)},
              requestOptions: e.requestOptions), requestOptions:  e.requestOptions)
          );
        case 400:
          return handler.next(DioException(response: Response(data: {"message": _getErrorMessage(e)},
              requestOptions: e.requestOptions), requestOptions:  e.requestOptions)
          );
        case 401:
          return handler.next(DioException(response: Response(data: {"message": "Authorization error"},
              requestOptions: e.requestOptions), requestOptions:  e.requestOptions)
          );

        case 404:
          return handler.next(DioException(response: Response(data: {"message": "Resource not found"},
              requestOptions: e.requestOptions), requestOptions:  e.requestOptions)
          );
        case 411:
          return handler.next(DioException(response: Response(data: {"message": _getErrorMessage(e)},
              requestOptions: e.requestOptions), requestOptions:  e.requestOptions)
          );
        case 500:
          return handler.next(DioException(response: Response(data:{"message": _getErrorMessage(e)},
              requestOptions: e.requestOptions), requestOptions:  e.requestOptions)
          );
        default:
          return handler.next(DioException(response: Response(data: {"message": "Oops something went wrong"},
              requestOptions: e.requestOptions), requestOptions:  e.requestOptions)
          );
      }

    default:
      return handler.next(DioException(response: Response(data: {"message": "An unknown error occurred"},
          requestOptions: e.requestOptions), requestOptions:  e.requestOptions)
      );
  }
}

String _getErrorMessage(DioException exception) {

  AppLogger.debug("error: ${exception.response?.data}");
  String? message;

  try {
    dynamic responseData = exception.response?.data;

    // Decode the response data if it's a JSON string
    if (responseData is String && isJson(responseData)) {
      responseData = jsonDecode(responseData);
    }

    // Check if the response data is a map
    if (responseData is Map<String, dynamic>) {
      final errorMap = ResModel.fromJson(responseData);

      if (errorMap.data == null) {
        message = errorMap.message;
      } else  if(errorMap.data.runtimeType == String){
        message = errorMap.data;
      }else {
        message = errorMap.data["error"];
      }
    } else {
      message = "Unexpected error format";
    }

    AppLogger.debug("Message: $message");
  } catch (e) {
    // Log the error for debugging
    AppLogger.debug("Error parsing server response: $e");
    message = "An error occurred while processing the error response";
  }
  return message ?? "Unknown error occurred";
}