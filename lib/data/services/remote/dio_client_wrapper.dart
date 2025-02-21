import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:propstake/locator.dart';

import '../../../utils/app_logger.dart';
import '../../../utils/constants.dart';
import '../../cache/config.dart';
import '../../cache/database_keys.dart';
import '../local/storage_service/auth_storage_service.dart';

typedef ProgressCallback = void Function(int count, int total);

class DioClientWrapper {
  DioClientWrapper();

  Dio? _dioClient;

  Dio get dioClient => _dioClient ??= Dio(_baseOptions);
  // Dio get _dioClient => Dio(_baseOptions);

  BaseOptions get _baseOptions {
    return BaseOptions(
      baseUrl: Config.baseUrl,
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      contentType: 'application/json',
    );
  }

  /// Initialize the Dio client with the stored token
  Future<void> initializeClient() async {
    String? token = await locator<AuthStorageService>().read(key: StorageKey.tokenTableKey);
    debugPrint("user token is $token");
    _baseOptions.headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      if (token != null && token.isNotEmpty) HttpHeaders.authorizationHeader: 'Bearer $token',
    };
    _dioClient = Dio(_baseOptions);
  }

  Future<Response<dynamic>> get(url, {Options? options, dynamic data}) async {
    AppLogger.debug("Making GET request to ${dioClient.options.baseUrl}$url");
    await initializeClient();
    return _makeRequest(
        () => dioClient.get(url, options: options, data: data));
  }

  Future<Response<dynamic>> delete(url,
      {Options? options, dynamic data, Map<String, dynamic>? queryParameters}) async {
    AppLogger.debug("Making DELETE request to ${dioClient.options.baseUrl}$url");
    await initializeClient();
    return _makeRequest(() => dioClient.delete(url,
        options: options, data: data, queryParameters: queryParameters));
  }

  Future<String> get externalDocumentPath async {
    Directory directory;
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory(); // for iOS
    } else {
      directory = Directory('/storage/emulated/0/Download/'); // for android
      if (!await directory.exists()) directory = (await getExternalStorageDirectory())!;
    }

    final exPath = directory.path;
    AppLogger.debug("Saved Path: $exPath");
    await Directory(exPath).create(recursive: true);
    return exPath;
  }

  Future<(File?, String)> downloadFileToDirectory(String fileUrl,
      {required String fileNameExtension}) async {
    final response = await get(fileUrl,
        options: Options(responseType: ResponseType.bytes));
    final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());

    final path = await externalDocumentPath;

    AppLogger.debug("response is ${response.data}");

    String fileName =
        "$fileNameExtension-$timestamp-${fileUrl.split('/').last}.pdf";
    AppLogger.debug("file name is $fileName");

    File file = File('$path/$fileName');

    return ((await file.writeAsBytes(response.data)), fileName);
  }

  Future<File?> downloadFile(String fileUrl) async {
    try {
      // Send a GET request to the image URL
      final response = await dioClient.get(fileUrl,
          options: Options(responseType: ResponseType.bytes));

      // Get the directory for storing files
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      // Extract file name from the image URL
      String fileName = fileUrl.split('/').last;

      // Create a new file in the app directory
      File localFile = File('$appDocPath/$fileName');

      // Write the image data to the local file
      await localFile.writeAsBytes(response.data);

      // Return the downloaded file
      return localFile;
    } catch (e, stackTrace) {
      AppLogger.error('Error downloading image: $e', stackTrace);
      return null;
    }
  }

  Future<Response<dynamic>> post(
    url,
    data, {
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    AppLogger.debug("Making POST request to ${dioClient.options.baseUrl}$url ||Data: $data");
    await initializeClient();
    return _makeRequest(() => dioClient.post(url,
        data: data,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress));
  }

  Future<Response<dynamic>> put(url, data, {Options? options}) async {
    AppLogger.debug("Making PUT request to ${dioClient.options.baseUrl}$url");
    await initializeClient();
    return _makeRequest(
        () => dioClient.put(url, data: data, options: options));
  }

  Future<Response<dynamic>> patch(url, {Options? options, dynamic data}) async {
    AppLogger.debug("Making PATCH request to ${dioClient.options.baseUrl}$url");
    await initializeClient();
    return _makeRequest(
        () => dioClient.patch(url, options: options, data: data));
  }

  void _redirectUserBackToLoginScreen() async {
    userService.logout();
  }

  // String _getErrorMessage(DioException exception) {
  //   final errorMap = exception.response!.data;
  //   String? message;
  //   if (errorMap["error"] == null) {
  //     message = errorMap["message"];
  //   } else {
  //     message = errorMap["error"];
  //   }
  //   AppLogger.debug("server error is ${exception.response!.data}");
  //   return message ?? "Unknown error occur";
  // }

  String _getErrorMessage(DioException exception) {
    try {
      final errorData = exception.response?.data;
      if (errorData is Map<String, dynamic>) {
        if (errorData.containsKey('error') && errorData['error'] is Map) {
          return errorData['error']['message'] ?? "Unknown error occurred";
        }
      }
      return "An unexpected error occurred";
    } catch (e) {
      return "Error parsing error response";
    }
  }

  Future<Response<dynamic>> _makeRequest(
      Future<Response<dynamic>> Function() dioRequest) async {
    try {
      return await dioRequest.call();
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionTimeout:
          throw AppException("Your internet connection is unstable");

        case DioExceptionType.cancel:
          throw AppException("Request cancelled");

        case DioExceptionType.unknown:
          throw AppException("An unknown error occurred");

        case DioExceptionType.badResponse:
          if (e.response == null) {
            throw AppException("An unknown error occurred",
                stackTrace: e.stackTrace);
          }
          switch (e.response!.statusCode) {
            case 302:
              return throw AppException(_getErrorMessage(e),
                  statusCode: 302, stackTrace: e.stackTrace);
            case 409:
              return throw AppException(_getErrorMessage(e),
                  statusCode: 409, stackTrace: e.stackTrace);
            case 400:
              AppLogger.debug("server error is ${e.response!.data}");
              return throw AppException(_getErrorMessage(e),
                  stackTrace: e.stackTrace, statusCode: 400);
            case 401:
              _redirectUserBackToLoginScreen();
              return throw AppException("Authorization error",
                  statusCode: 401, stackTrace: e.stackTrace);
            case 403:
              throw AppException(_getErrorMessage(e),
                  stackTrace: e.stackTrace, statusCode: 403);
            case 404:
              throw AppException("Resource not found",
                  stackTrace: e.stackTrace, statusCode: 404);
            // case 413:
            //   return throw AppException(
            //     navigationService.context.localized.theUploadedFileSizeIsTooLarge,
            //     stackTrace: e.stackTrace,
            //     statusCode: 413,
            //   );
            // case 410:
            //   throw AppException(
            //     navigationService.context.localized.yourAccountHasBeenDeleted,
            //     stackTrace: e.stackTrace,
            //     statusCode: 410,
            //   );
            case 411:
              throw AppException(
                _getErrorMessage(e),
                stackTrace: e.stackTrace,
                statusCode: 411,
              );
            case 500:
              AppLogger.debug("server error is ${e.response!.data}");
              final errorMap = e.response!.data;
              String message;
              if (errorMap["error"] == null) {
                message = errorMap["message"];
              } else {
                message = errorMap["message"];
              }
              return throw AppException(message,
                  stackTrace: e.stackTrace, statusCode: 500);
            default:
              throw AppException("Oops something went wrong",
                  stackTrace: e.stackTrace);
          }

        default:
          throw AppException("An unknown error occurred");
      }
    } catch (e) {
      AppLogger.debug(e.toString());
      throw AppException("An unknown error occurred");
    }
  }
}

class AppException implements Exception {
  final String errorMessage;
  final dynamic stackTrace;
  final int? statusCode;

  AppException(this.errorMessage, {this.stackTrace, this.statusCode});

  @override
  String toString() {
    return 'AppException{errorMessage: $errorMessage, stackTrace: $stackTrace, statusCode: $statusCode}';
  }
}
