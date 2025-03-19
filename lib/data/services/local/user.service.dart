import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:propstake/data/model/wallet_response_model.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/locator.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/utils/app_logger.dart';
import 'package:propstake/utils/dartz.x.dart';
import 'package:propstake/utils/snack_message.dart';
import 'package:propstake/utils/string_extensions.dart';

import '../../../ui/auth/auth.ui.dart';
import '../../../ui/home/properties/properies.vm.dart';
import '../../../utils/constants.dart';
import '../../cache/database_keys.dart';
import '../../model/get_user_model.dart';
import '../../model/login_auth_model.dart';


class UserService extends ChangeNotifier {
  User user = User();
  bool isUserLoggedIn = false;
  bool isDoctor = false;
  bool rememberMe = false;
  String userId = "";
  String? referralCode;
  num price = 10000;
  num? userBalance;
  List<TempProperties> bookMarks = [];
  List<TempCart> cartItems = [];

  removeFromCart(TempCart cart){
    cartItems.removeWhere((test)=> test.id == cart.id);
    notifyListeners();
  }

  saveCart(TempCart cart){
    if(cartItems.any((test)=> test.product.id == cart.product.id)){
      showCustomToast(LocaleData.propertyAlreadyInCart.convertString());
    }else{
      cartItems.add(cart);
      showCustomToast(LocaleData.propertyAddedToCart.convertString(), success: true);
    }
    notifyListeners();
  }

  update(List<TempCart> carts){
    cartItems = carts;
    notifyListeners();
  }

  saveUnSaveBookMark(TempProperties property){
    if(bookMarks.any((test)=> test.id == property.id)){
      bookMarks.removeWhere((test)=> test.id == property.id);
    }else{
      bookMarks.add(property);
    }
    notifyListeners();
  }


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
      await getSavedBValance();
      await getSavedReferralCode();
      locator<BaseViewModel>().getWallet();
    }
    log("ACCESS TOKEN (AUTH)::: $userToken");
    log("Is User Logged In:::: $isUserLoggedIn");

    notifyListeners();
  }

  saveWalletBalance(BalanceResponse balance) async {
    if(balance.data != null){
      var res = await storageService.storeItem(key: StorageKey.walletBalance, value: jsonEncode(balance));
      if(res){
        userBalance = balance.data ?? userBalance;
      }
    }
    notifyListeners();
  }

  saveReferralCode(LoginAuthModel balance) async {
    try{
      if(balance.data != null){
        var res = await storageService.storeItem(key: StorageKey.referralCode, value: balance.data);
        if(res){
          referralCode = balance.data ?? referralCode;
        }
      }
    }catch(err){
      AppLogger.debug("Error ::: $err");
    }

    notifyListeners();
  }

  Future<num?> getSavedBValance() async {
    String? res = await storageService.read(key: StorageKey.walletBalance);
    if(res != null){
      userBalance = BalanceResponse.fromJson(jsonDecode(res)).data ?? userBalance;
    }else {
      await walletService.getWallet();
    }
    notifyListeners();
    return userBalance;
  }

  Future<String?> getSavedReferralCode() async {
    String? res = await storageService.read(key: StorageKey.referralCode);
    if(res != null){
      referralCode = res;
    } else {
      await authenticationService.getReferralCode();
    }
    notifyListeners();
    return referralCode;
  }


  /// LOGOUT FUNCTION
  logout() async {
    await storageService.deleteItem(key: StorageKey.userTableKey);
    await storageService.deleteItem(key: StorageKey.refreshTokenKey);
    await storageService.deleteItem(key: StorageKey.tokenTableKey);
    await storageService.deleteItem(key: StorageKey.walletBalance);
    await storageService.deleteItem(key: StorageKey.referralCode);
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
