import 'package:flutter/material.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/ui/home/bottom_nav.ui.dart';
import 'package:propstake/utils/constants.dart';

import '../../../../widget/success_screen.dart';

class WithdrawViewModel extends BaseViewModel{

  TextEditingController nameController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();

  onChanged(String? val){
    formKey.currentState!.validate();
    notifyListeners();
  }

  submit(){
    navigationService.navigateToRoute(
      SuccessScreen(
        onTap:()=> navigationService.navigateToAndRemoveUntilWidget(BottomNavigationScreen(initialIndex: 1,)),
        title: "Payment made",
        body: "Funds will appear in your bank account in a minutes",
      )
    );
  }
}