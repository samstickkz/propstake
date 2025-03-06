import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:propstake/utils/app_logger.dart';
import 'package:propstake/utils/dartz.x.dart';

import '../../../ui/auth/auth.ui.dart';
import '../../../utils/constants.dart';
import '../../cache/database_keys.dart';
import '../../model/get_user_model.dart';


class UserService extends ChangeNotifier {
  User user = User();
  bool isUserLoggedIn = false;
  bool isDoctor = false;
  bool rememberMe = false;
  String userId = "";
  num price = 10000;


  changeUserType(bool doctor){
    isDoctor = doctor;
    notifyListeners();
  }

  storeToken({required String? accessToken, String? refreshToken}) async {
    await storageService.storeItem(key: StorageKey.tokenTableKey, value: accessToken);
    if(refreshToken!=null){
      await storageService.storeItem(key: StorageKey.refreshTokenKey, value: refreshToken);
    }
    isUserLoggedIn = true;
    user = User();
    notifyListeners();
  }


  storeUser({required User? users}) async {
    if(users!=null){
      var res = await storageService.storeItem(key: StorageKey.userTableKey, value: jsonEncode(users));
      if(res){
        user = users;
        AppLogger.debug("Name: ${user.email}");
      }
    }
    notifyListeners();
  }

  initializer() async {
    String? userToken = await storageService.read(key: StorageKey.tokenTableKey);
    if(userToken==null){
      user = User();
      isUserLoggedIn = false;
    }else{
      isUserLoggedIn = true;
      await getStoreUser();
    }
    log("ACCESS TOKEN (AUTH)::: $userToken");
    log("Is User Logged In:::: $isUserLoggedIn");

    notifyListeners();
  }


  /// LOGOUT FUNCTION
  logout() async {
    await storageService.deleteItem(key: StorageKey.userTableKey);
    await storageService.deleteItem(key: StorageKey.refreshTokenKey);
    await storageService.deleteItem(key: StorageKey.tokenTableKey);
    isUserLoggedIn = false;
    user = User();
    notifyListeners();
    navigationService.navigateToAndRemoveUntilWidget(const AuthHomeScreen(isSignIn: true,));
  }


  Future<User?> getStoreUser()  async {
    String? data = await storageService.readItem(key: StorageKey.userTableKey);
    if(data==null){
      var response = await authenticationService.getUser();
      if(response.isRight()){
        notifyListeners();
        return user;
      }else{
        user = User();
        notifyListeners();
        return null;
      }
    }else{
      AppLogger.debug("User Data: $data");
      User userResponse = User.fromJson(jsonDecode(data));
      user = userResponse;
      notifyListeners();
      authenticationService.getUser();
      return user;
    }
  }

}
