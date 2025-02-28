import 'package:flutter/material.dart';
import 'package:propstake/ui/base/base-vm.dart';

import '../../../../utils/constants.dart';

class ContactUsViewModel extends BaseViewModel {

  TextEditingController nameController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  init(){
    nameController.text = "${userService.user.firstName??""} ${userService.user.lastName??""}";
    notifyListeners();
  }

  onChanged(String? val){
    formKey.currentState!.validate();
    notifyListeners();
  }

}