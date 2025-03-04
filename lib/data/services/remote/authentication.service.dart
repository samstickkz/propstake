import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:propstake/utils/constants.dart';

import '../../../utils/app_logger.dart';
import '../../model/default.model.dart';
import '../../model/login_auth_model.dart';
import 'base.api.service.dart';
import 'dio_client_wrapper.dart';

class AuthenticationService {

  AuthenticationService();

  Future<Either<ResModel, ResModel>> signUp({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      Response response = await connect().post("User/signup", data: {
        "email": email,
        "password": password,
        "confirmPassword": password,
        "returnUrl": "",
        "acceptpolicy": true
      });
      ResModel signUpResponse = ResModel.fromJson(jsonDecode(response.data));
      return Right(signUpResponse);
    } on DioException catch (e) {
      return Left(resModelFromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }

  Future<Either<ResModel, ResModel>> forgotPassword({
    required String email
  }) async {
    try {
      Response response = await connect().post("ForgotPassword", data: {
        "email": email
      });
      ResModel signUpResponse = ResModel.fromJson(jsonDecode(response.data));
      return Right(signUpResponse);
    } on DioException catch (e) {
      return Left(resModelFromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }

  Future<Either<ResModel, LoginAuthModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await connect().post("Auth/login", data: {
        "UserName": email,
        "password": password
      });
      LoginAuthModel loginResponse = LoginAuthModel.fromJson(jsonDecode(response.data));
      if(loginResponse.data != null && (loginResponse.data??"").isNotEmpty){
        await userService.storeToken(accessToken: loginResponse.data);
      }
      return Right(loginResponse);
    } on DioException catch (e) {
      return Left(resModelFromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }

}