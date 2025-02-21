import 'package:flutter/material.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/utils/app_buttom_sheet.dart';

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
        child: Container(height: 600,)
      );
    }
  }

  resendCode() async {

  }

}