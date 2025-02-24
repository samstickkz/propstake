import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/ui/home/bottom_nav.ui.dart';
import 'package:propstake/utils/app_buttom_sheet.dart';
import 'package:propstake/utils/constants.dart';

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

  checkBiometricType() async {
    final availB = await localAuth.getAvailableBiometrics();
    if (availB.contains(BiometricType.face)) {
      bioType = BiometricType.face;
    } else if (availB.contains(BiometricType.fingerprint)) {
      bioType = BiometricType.fingerprint;
    } else {
      notifyListeners();
    }
    notifyListeners();
  }

  TextEditingController codeController = TextEditingController();

  confirm(VerificationReason reason) async {
    if(reason == VerificationReason.login){
      bottomSheets(
        barrierDismissible: false,
        noHeader: true,
        child: SuccessAuthVerification(
          onTap: ()=> navigationService.navigateToAndRemoveUntilWidget(bioType== null? BottomNavigationScreen(): LocalAuthScreen()),
        )
      );
    }else if(reason == VerificationReason.forgetPassword){
      navigationService.navigateToRoute(UpdatePasswordScreen());
    }
  }

  resendCode() async {

  }

}