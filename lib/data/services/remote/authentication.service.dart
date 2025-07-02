import 'dart:convert';
import 'dart:io';

import 'package:aws_s3_upload_lite/aws_s3_upload_lite.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:propstake/utils/constants.dart';
import 'package:path/path.dart' as path;
import 'package:propstake/utils/dartz.x.dart';

import '../../../utils/app_logger.dart';
import '../../model/default.model.dart';
import '../../model/get_user_model.dart';
import '../../model/login_auth_model.dart';
import '../../model/on_boarding_check_model.dart';
import '../../model/update_user_model.dart';
import 'base.api.service.dart';
import 'dio_client_wrapper.dart';

class AuthenticationService {

  AuthenticationService();

  Future<Either<ResModel, ResModel>> signUp({
    required String email,
    required String password,
    String? referralCode,
    required String confirmPassword,
  }) async {
    try {
      Response response = await connect().post("User/signup", data: {
        "email": email,
        "password": password,
        "confirmPassword": password,
        "referral": referralCode,
        "acceptpolicy": true
      });
      ResModel signUpResponse = ResModel.fromJson(jsonDecode(response.data));
      return Right(signUpResponse);
    } on DioException catch (e) {
      return Left(ResModel.fromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }

  Future<Either<ResModel, ResModel>> confirmEmail({
    required String email,
    required String code,
  }) async {
    try {
      Response response = await connect().get("ConfirmEmail?Code=$code&Email=$email");
      ResModel signUpResponse = ResModel.fromJson(jsonDecode(response.data));
      if(signUpResponse.successful == true) {
        return Right(signUpResponse);
      }
      return Left(signUpResponse);
    } on DioException catch (e) {
      return Left(ResModel.fromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }

  Future<Either<ResModel, ResModel>> resentConfirmEmail({
    required String email
  }) async {
    try {
      Response response = await connect().get("Auth/resend-confirmation-email?email=$email");
      ResModel signUpResponse = ResModel.fromJson(jsonDecode(response.data));
      if(signUpResponse.successful == true) {
        return Right(signUpResponse);
      }
      return Left(signUpResponse);
    } on DioException catch (e) {
      return Left(ResModel.fromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }

  Future<Either<ResModel, ResModel>> setNewPassword({
    required String email,
    required String code,
    required String password,
  }) async {
    try {
      Response response = await connect().post("ResetPassword", data: {
        "email": email,
        "password": password,
        "confirmPassword": password,
        "code": code
      });
      ResModel signUpResponse = ResModel.fromJson(jsonDecode(response.data));
      if(signUpResponse.successful == true) {
        return Right(signUpResponse);
      }
      return Left(signUpResponse);
    } on DioException catch (e) {
      return Left(ResModel.fromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }

  Future<Either<ResModel, ResModel>> verifyUser({
    required String email,
    required String code,
  }) async {
    try {
      Response response = await connect().get("User/verify-user-account?email=$email&code=$code");
      ResModel signUpResponse = ResModel.fromJson(jsonDecode(response.data));
      if(signUpResponse.successful == true) {
        return Right(signUpResponse);
      }
      return Left(signUpResponse);
    } on DioException catch (e) {
      return Left(ResModel.fromJson(e.response?.data));
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
      return Left(ResModel.fromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }

  Future<Either<ResModel, LoginAuthModel>> getReferralCode() async {
    try {
      Response response = await connect().get("User/user-referral-code");
      ResModel defaultRes = ResModel.fromJson(jsonDecode(response.data));
      LoginAuthModel signUpResponse = LoginAuthModel.fromJson(jsonDecode(response.data));
      if(defaultRes.successful == true){
        await userService.saveReferralCode(signUpResponse);
        return Right(signUpResponse);
      }
      return Left(defaultRes);
    } on DioException catch (e) {
      return Left(ResModel.fromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }

  Future<Either<ResModel, GetUserModel>> getUser() async {
    try {
      Response response = await connect().get("User/userdetails");
      GetUserModel userResponse = GetUserModel.fromJson(jsonDecode(response.data));
      if(userResponse.successful == true){
        await userService.storeUser(users: userResponse.data);
        return Right(userResponse);
      }else{
        return Left(ResModel.fromJson(jsonDecode(response.data)));
      }
    } on DioException catch (e) {
      return Left(ResModel.fromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }

  Future<String?> uploadS32(File file) async {

    try{
      var result = await AwsS3.uploadFile(
        accessKey: dotenv.env['ACCESSKEY']!,
        secretKey: dotenv.env['SECRETKEY']!,
        file: file,
        bucket: dotenv.env['BUCKET']!,
        region: dotenv.env['REGION']!,
        destDir: dotenv.env['DESINATION']!,
        filename:
        '${DateTime.now().millisecondsSinceEpoch.toString()}${path.extension(file.path)}',
      );
      AppLogger.debug(result);
      return result;
    } catch (e){
      AppLogger.debug("AWS Error: $e");
      return null;
    }

  }

  Future<Either<ResModel, OnboardingCheckModel>> onboardChecker() async {
    try {
      Response response = await connect().get("User/OnboardChecker");
      OnboardingCheckModel resModel = OnboardingCheckModel.fromJson(jsonDecode(response.data));
      if(resModel.successful == true) {
        return Right(resModel);
      }
      return Left(ResModel.fromJson(jsonDecode(response.data)));
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
      return Right(loginResponse);
    } on DioException catch (e) {
      return Left(resModelFromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }

  Future<Either<ResModel, UpdateUserModel>> setUserProfile({
    required String firstName,
    required String lastName,
    String? organisation,
    required String dob,
    required File? imageUrl,
  }) async {
    try {

      String? img;

      if(imageUrl != null){
        var res = await uploadImage(image: imageUrl!);
        if(res.isRight()){
          img = res.asRight();
        }
      }

      FormData formData = FormData();

      formData.fields.add(MapEntry("user_id", userService.userId??""));

      formData.fields.add(MapEntry("FirstName", firstName));
      formData.fields.add(MapEntry("LastName", lastName));
      if(organisation!= null){
        formData.fields.add(MapEntry("OrganisationName", organisation));
      }
      formData.fields.add(MapEntry("Dob", dob));

      if(img != null){
        formData.fields.add(MapEntry("ImageUrl", img));
      }


      Response response = await connect(useFormData: userService.user.lname != null? true: false).post(
          userService.user.lname == null? "Profiles/Establish-Profile": "Profiles/Update-Profile",
          data: userService.user.lname == null? {
            "firstName": firstName,
            "lastName": lastName,
            "organisationName": organisation,
            "dob": dob,
          }:formData
      );
      UpdateUserModel loginResponse = UpdateUserModel.fromJson(jsonDecode(response.data));
      return Right(loginResponse);
    } on DioException catch (e) {
      return Left(resModelFromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }

  Future<Either<String?, String>> uploadImage({
    required File image,
  }) async {
    try {

      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(image.path),
      });

      Response response = await connect(useFormData: true).post(
          "Profiles/Upload-image",
          data: formData
      );
      ResModel loginResponse = ResModel.fromJson(jsonDecode(response.data));
      if(loginResponse.successful == true) {
        return Right(loginResponse.data.toString());
      }
      return Left(null);
    } on DioException catch (e) {
      return Left(null);
    } catch (e) {
      return Left(null);
    }
  }

}