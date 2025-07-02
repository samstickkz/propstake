import 'package:flutter/material.dart';
import 'package:propstake/ui/auth/forget_password/forget_password.ui.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/utils/app_logger.dart';
import 'package:propstake/utils/constants.dart';
import 'package:propstake/utils/dartz.x.dart';
import 'package:propstake/utils/snack_message.dart';

import '../home/bottom_nav.ui.dart';
import 'auth.ui.dart';
import 'verify/verify.ui.dart';

class AuthViewModel extends BaseViewModel {

  onInit(bool? isSignIn, String? email){
    if(email!=null){
      if(isSignIn == true){
        inEmailController.text = email;
      }else {
        upEmailController.text = email;
      }
    }
    changeScreen(isSignIn == true? screens[1]: screens[0]);
    notifyListeners();
  }

  String screen = "Sign Up";

  List<String> screens = [
    "Sign Up",
    "Sign In",
  ];

  final formKey2 = GlobalKey<FormState>();

  changeScreen(String val){
    screen = val;
    notifyListeners();
  }

  TextEditingController upEmailController = TextEditingController();
  TextEditingController upPasswordController = TextEditingController();
  TextEditingController upReferralController = TextEditingController();
  TextEditingController upConfirmPasswordController = TextEditingController();

  TextEditingController inEmailController = TextEditingController();
  TextEditingController inPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  onChangedUp(String? val)async {
    formKey.currentState!.validate();
    notifyListeners();
  }

  onChangedIn(String? val)async {
    formKey2.currentState!.validate();
    notifyListeners();
  }

  createAccount(){
    navigationService.navigateToRoute(VerifyUserScreen(
      reason: VerificationReason.login,
      email: upEmailController.text.trim(),
    ));
  }

  signInWithGoogle() async {
    try{
      var res = await socialService.signInWithGoogle();
    }catch(err){
      notifyListeners();
      AppLogger.debug("Error :: $err");
    }
  }

  goHome({required bool goToSetUpProfile}){
    navigationService.navigateToAndRemoveUntilWidget(BottomNavigationScreen(initialIndex: goToSetUpProfile? 4 : 0, goToProfile: goToSetUpProfile,));
  }

  login() async {
    startLoader();
    try{
      var res = await authenticationService.login(
          email: inEmailController.text.trim(),
          password: inPasswordController.text.trim(),
      );
      if(res.isRight()){
        stopLoader();

        if(res.asRight().successful == true){
          await userService.storeToken(accessToken: res.asRight().data);
          bool goToEdit = await getUsers(
              res.asRight().message??""
          );
          goHome(goToSetUpProfile: !goToEdit);
        }else{
          showCustomToast(res.asRight().message??"");
        }
      } else {
        stopLoader();
      }
    }catch(err){
      stopLoader();
    }
  }

  Future<bool> onboardChecker() async {
    startLoader();
    try{
      var res = await authenticationService.onboardChecker();
      if(res.isRight()){
        stopLoader();

        if(res.asRight().successful == true){
          if(res.asRight().data?.onboardingLevel == 1){
            return true;
          }
        }
      }
      return false;
    }catch(err){
      stopLoader();
      return false;
    }
  }

  Future<bool> getUsers(
      String message
      ) async {
    startLoader();
    try{
      var res = await authenticationService.getUser();
      if(res.isRight()){
        stopLoader();
        if(res.asRight().successful == true){
          showCustomToast(message, success: true);
          return true;
        }
      }
      return false;
    }catch(err){
      stopLoader();
      return false;
    }
  }

  submitNewPassword(String email, String code)async{
    startLoader();
    try{
      var res = await authenticationService.setNewPassword(
        email: email,
        code: code,
        password: newPasswordController.text.trim()
      );
      if(res.isRight()){
        stopLoader();
        if(res.asRight().successful == true){
          showCustomToast(res.asRight().message??"", success: true);
          return navigationService.navigateToAndRemoveUntilWidget(AuthHomeScreen(isSignIn: true, email: email,));
        }else{
          showCustomToast(res.asRight().message??"");
        }
      } else {
        showCustomToast(res.asLeft().message??"");
        stopLoader();
      }
    }catch(err){
      stopLoader();
    }
  }

  forgotPasswordApi()async{
    startLoader();
    try{
      var res = await authenticationService.forgotPassword(
          email: upEmailController.text.trim(),
      );
      if(res.isRight()){
        stopLoader();

        if(res.asRight().successful == true){
          showCustomToast(res.asRight().message??"", success: true);
          startChangePassword();
        }else{
          showCustomToast(res.asRight().message??"");
        }
      } else {
        stopLoader();
      }
    }catch(err){
      stopLoader();
    }
  }

  startChangePassword(){
    navigationService.navigateToRoute(VerifyUserScreen(
      reason: VerificationReason.forgetPassword,
      email: upEmailController.text.trim(),
    ));
  }

  forgotPassword(){
    navigationService.navigateToRoute(ForgotPasswordScreen());
  }

  signUp()async{
    startLoader();
    try{
      var res = await authenticationService.signUp(
        email: upEmailController.text.trim(),
        password: upPasswordController.text.trim(),
        confirmPassword: upConfirmPasswordController.text.trim(),
        referralCode: upReferralController.text.trim()
      );
      if(res.isRight()){
        stopLoader();
        showCustomToast(res.asRight().message??"", success: res.isRight());
        if(res.asRight().successful == true){
          createAccount();
        }
      } else {
        showCustomToast(res.asLeft().message??"",);
        stopLoader();
      }
    }catch(err){
      stopLoader();
    }
  }

}