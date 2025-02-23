import 'package:flutter/material.dart';
import 'package:propstake/ui/auth/auth.ui.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/utils/app_buttom_sheet.dart';
import 'package:propstake/utils/constants.dart';

import '../forget_password/update_password.ui.dart';
import '../widgets/success_auth_verification.dart';
import 'verify.ui.dart';

class VerifyUserViewModel extends BaseViewModel {

  onChanged(String? val)async {
    formKey.currentState!.validate();
    notifyListeners();
  }

  TextEditingController codeController = TextEditingController();

  confirm(VerificationReason reason) async {
    if(reason == VerificationReason.login){
      bottomSheets(
        barrierDismissible: false,
        noHeader: true,
        child: SuccessAuthVerification(
          onTap:()=> navigationService.navigateToAndRemoveUntilWidget(AuthHomeScreen()),
        )
      );
    }else if(reason == VerificationReason.forgetPassword){
      navigationService.navigateToRoute(UpdatePasswordScreen());
    }
  }

  resendCode() async {

  }

}