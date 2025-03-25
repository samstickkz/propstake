import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:propstake/ui/auth/auth.ui.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/ui/home/bottom_nav.ui.dart';
import 'package:propstake/utils/app_buttom_sheet.dart';
import 'package:propstake/utils/constants.dart';
import 'package:propstake/utils/dartz.x.dart';

import '../../../utils/snack_message.dart';
import '../forget_password/update_password.ui.dart';
import '../local_authentication/local_authentication.ui.dart';
import '../widgets/success_auth_verification.dart';
import 'verify.ui.dart';

class VerifyUserViewModel extends BaseViewModel {
  LocalAuthentication localAuth = LocalAuthentication();
  BiometricType? bioType;

  onChanged(String? val)async {
    formKey.currentState!.validate();
    notifyListeners();
  }

  VerificationReason? reason;
  String email = "";

  confirmEmail()async{
    startLoader();
    try{
      var res = await authenticationService.confirmEmail(
        email: email,
        code: codeController.text.trim()
      );
      if(res.isRight()){
        stopLoader();
        showCustomToast(res.asRight().message??"", success: res.isRight());
        if(res.asRight().successful == true){
          navigationService.navigateToRoute(UpdatePasswordScreen(
            code: codeController.text.trim(),
            email: email,
          ));
        }
      } else {
        showCustomToast(res.asLeft().message??"");
        stopLoader();
      }
    }catch(err){
      stopLoader();
    }
  }

  resentConfirmEmail()async{
    startLoader();
    try{
      var res = await authenticationService.resentConfirmEmail(
        email: email,
      );
      if(res.isRight()){
        stopLoader();
        showCustomToast(res.asRight().message??"", success: res.isRight());
      } else {
        showCustomToast(res.asLeft().message??"");
        stopLoader();
      }
    }catch(err){
      stopLoader();
    }
  }

  verifyUser()async{
    startLoader();
    try{
      var res = await authenticationService.confirmEmail(
          email: email,
          code: codeController.text.trim()
      );
      if(res.isRight()){
        stopLoader();
        showCustomToast(res.asRight().message??"", success: res.isRight());
        if(res.asRight().successful == true){
          bottomSheets(
            barrierDismissible: false,
            noHeader: true,
            child: SuccessAuthVerification(
              onTap: ()=> navigationService.navigateToAndRemoveUntilWidget(bioType== null? AuthHomeScreen(isSignIn: true,): LocalAuthScreen()),
            )
          );
        }
      } else {
        showCustomToast(res.asLeft().message??"");
        stopLoader();
      }
    }catch(err){
      stopLoader();
    }
  }

  checkBiometricType({required VerificationReason reasons, required String emails}) async {
    reason = reasons;
    email = emails;
    notifyListeners();
    final availB = await localAuth.getAvailableBiometrics();
    if (availB.contains(BiometricType.face)) {
      bioType = BiometricType.face;
    } else if (availB.contains(BiometricType.fingerprint)) {
      bioType = BiometricType.fingerprint;
    } else {
      notifyListeners();
    }
    if(reasons == VerificationReason.reValidate){
      await resentConfirmEmail();
    }
    notifyListeners();
  }

  TextEditingController codeController = TextEditingController();

  confirm() async {
    if(reason == VerificationReason.login){
      verifyUser();
    }else if(reason == VerificationReason.forgetPassword){
      confirmEmail();
    }
  }


}