import 'package:flutter/material.dart';
import 'package:propstake/ui/auth/forget_password/forget_password.ui.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/utils/constants.dart';

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

  login(){
    goHome();
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

}