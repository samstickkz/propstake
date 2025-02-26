import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../cache/database_keys.dart';


class UserService extends ChangeNotifier {
  User user = User(firstName: "Emmanuel", lastName: "Ekpenyong", profilePictureUrl: "https://i.pravatar.cc/150?img=33",);
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
    notifyListeners();
  }


  storeUser({required User? users}) async {
    if(users!=null){
      var res = await storageService.storeItem(key: StorageKey.userTableKey, value: jsonEncode(users));
      if(res){
        user = users;
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


    //REMOVE AFTER
    user = User(firstName: "Emmanuel", lastName: "Ekpenyong", profilePictureUrl: "https://i.pravatar.cc/150?img=33",);
    notifyListeners();
  }


  /// LOGOUT FUNCTION
  logout() async {

    await storageService.deleteAllItems();
    isUserLoggedIn = false;
    user = User();
    notifyListeners();
    // navigationService.navigateToAndRemoveUntilWidget(const LoginScreen());
  }


  Future<User?> getStoreUser()  async {
    String? data = await storageService.readItem(key: StorageKey.userTableKey);
    if(data==null){
      // var response = await authenticationService.getUser();
      // if(response.isRight()){
      //   user = response.asRight();
      //   notifyListeners();
      //   return user;
      // }else{
      //   user = User();
      //   await logout();
      //   notifyListeners();
      //   return null;
      // }
      // notifyListeners();
      // return null;
    }else{
      // User userResponse = User.fromJson(jsonDecode(data));
      // user = userResponse;
      // authenticationService.getUser();
      notifyListeners();
      return user;
    }
  }

}


class User{
  String? firstName;
  String? lastName;
  String? profilePictureUrl;

  User({this.firstName, this.lastName, this.profilePictureUrl});
}