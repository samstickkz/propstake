import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_logger.dart';
import '../../cache/config.dart';
import '../../../utils/constants.dart';
import '../../cache/database_keys.dart';

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
      onError: (DioException e, handler) async {
        AppLogger.error("Error Response::: ${jsonDecode(jsonEncode(e.response?.data))}", "");
        return handler.next(e);
      },
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
      onError: (DioException e, handler) async {
        AppLogger.error("${e.response?.statusCode.toString()}", "");
        AppLogger.error("${e.response?.data.toString()}", "");
        AppLogger.error("${e.response?.statusMessage}", "");

        if(e.response!.statusMessage.toString().toUpperCase().contains("unauthorized")){
          await userService.logout();
        }

        return handler.next(e);
      },
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