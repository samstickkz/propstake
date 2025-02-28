import 'package:flutter/material.dart';
import 'package:propstake/ui/auth/forget_password/forget_password.ui.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/utils/constants.dart';
import 'package:propstake/utils/dartz.x.dart';
import 'package:propstake/utils/snack_message.dart';

import '../home/bottom_nav.ui.dart';
import 'auth.ui.dart';
import 'verify/verify.ui.dart';

class AuthViewModel extends BaseViewModel {

  onInit(bool? isSignIn){
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

  goHome(){
    navigationService.navigateToAndRemoveUntilWidget(BottomNavigationScreen());
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
          showCustomToast(res.asRight().message??"", success: true);
          goHome();
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

  submitNewPassword(){
    return navigationService.navigateToAndRemoveUntilWidget(const AuthHomeScreen());
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
        confirmPassword: upConfirmPasswordController.text.trim()
      );
      if(res.isRight()){
        stopLoader();
        showCustomToast(res.asRight().message??"");
        createAccount();
      } else {
        stopLoader();
      }
    }catch(err){
      stopLoader();
    }
  }

}