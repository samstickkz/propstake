import 'package:flutter/material.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/utils/constants.dart';

class MyAccountViewModel extends BaseViewModel {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  init(){
    nameController.text = "${userService.user.firstName??""} ${userService.user.lastName??""}";
    phoneController.text = "+2347012584949";
    addressController.text = "+23 Abak road, uyo";
    notifyListeners();
  }

  getText(String val, ProfileEdited value) async {

  }

}

enum ProfileEdited {
  name, address, phone
}