import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:propstake/data/model/get_user_model.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/utils/constants.dart';
import 'package:propstake/utils/dartz.x.dart';
import 'package:propstake/utils/snack_message.dart';
import 'package:propstake/utils/widget_extensions.dart';

import '../../../../app_theme/palette.dart';
import '../../../../utils/app_logger.dart';


class MyAccountViewModel extends BaseViewModel {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  User user = User();

  init(){
    user = userService.user;
    AppLogger.debug("Org:: ${user.org}");
    if(user.fname != null){
      nameController.text = "${user.fname??""} ${user.lname??""}";
    }
    if(user.org != null){
      addressController.text = user.org;
    }
    if(user.dob != null){
      DateTime don = user.dob ?? DateTime.now().subtract(Duration(days: 6570));
      dateOfBirthController.text = formatDate(don);
      dob = don;
      dateOfBirth = don;
    }
    notifyListeners();
    Future.delayed(Duration(milliseconds: 200), ()=> onChange(""));
  }

  updateProfile() async {
    startLoader();
    try {

      var res = await authenticationService.setUserProfile(
        firstName: nameController.text.trim().split(" ").first,
        lastName: nameController.text.trim().split(" ").last,
        organisation: addressController.text.trim(),
        dob: dob.toString().trim(),
        imageUrl: image
      );
      if(res.isRight()) {
        if(res.asRight().successful == true) {
          await authenticationService.getUser();
          user = userService.user;
          showCustomToast(res.asRight().message??"", success: true);
        }else{
          showCustomToast(res.asRight().message??"");
        }
      }else{
        showCustomToast(res.asLeft().message??"");
      }
      stopLoader();
    }catch (e) {
      AppLogger.debug('Error updating profile: $e');
      stopLoader();
    }
  }

  getText(String val, ProfileEdited value) async {
    switch(value){
      case ProfileEdited.name:
        nameController.text = val;
        break;
      case ProfileEdited.phone:
        phoneController.text = val;
        break;
      case ProfileEdited.address:
        addressController.text = val;
        break;
    }
    notifyListeners();
  }

  File? image;
  String? imageUrl;

  Future<void> takePicture({ImageSource source = ImageSource.gallery}) async {
    try {
      XFile? picture = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(picture != null) {
        AppLogger.debug("Image is:: ${picture.path}");
        String? path = await pickCroppedImage(File(picture.path));
        if(path!= null) {
          image = File(path);
          notifyListeners();
        }
      }
    } catch (e) {
      AppLogger.debug('Error taking picture: $e');
    }
  }

  bool isReadOnly = true;

  void toggleReadOnly() {
    isReadOnly =!isReadOnly;
    notifyListeners();
  }




  String formatDate(DateTime dateTime) {
    // Extract date components
    int day = dateTime.day;
    int month = dateTime.month;
    int year = dateTime.year % 100; // Get last two digits of the year

    // Format date components with leading zeros if necessary
    String formattedDay = day.toString().padLeft(2, '0');
    String formattedMonth = month.toString().padLeft(2, '0');
    String formattedYear = year.toString().padLeft(2, '0');

    // Concatenate formatted components with slashes
    return '$formattedMonth / $formattedDay / $formattedYear';
  }

  DateTime dob = DateTime.now();
  DateTime? dateOfBirth;


  Future<DateTime?> pickDateTime(
      DateTime initialDate, {
        required bool pickDate,
        required BuildContext context,
        DateTime? firstDate,
      }) async {
    if (pickDate) {
      final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now().subtract(Duration(days: 6570)),
          firstDate: DateTime(1900),
          lastDate: DateTime.now().subtract(Duration(days: 6570)),
          builder: (_, child){
            return Theme(
              data: ThemeData(
                primaryColor: primaryColor,
                colorScheme: ColorScheme.dark(
                  primary: primaryColor,
                  onPrimary: stateColor4(isAppDark(context)), // Example color
                  surface: stateColor1(isAppDark(context)), // Example color
                  onSurface: stateColor12(isAppDark(context)), // Example color
                ),
              ),
              child: child!,
            );
          }
      );
      if (date == null) return null;

      final time =
      Duration(hours: initialDate.hour, minutes: initialDate.minute);

      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
          context: context, initialTime: TimeOfDay.fromDateTime(initialDate));
      if (timeOfDay == null) return null;
      final date =
      DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      return date.add(time);
    }
  }

  Future pickToDateTime({required bool picDate, required BuildContext context}) async {
    final date = await pickDateTime(
      dob,
      pickDate: picDate, context: context,
    );
    if (date == null) return null;
    dob = date;
    dateOfBirth = date;
    FocusManager.instance.primaryFocus?.unfocus();

    notifyListeners();
    dateOfBirthController.text = formatDate(dob);
    await onChange("");
    toggleReadOnly();
  }

  onChange(String? val){
    formKey.currentState?.validate();
    notifyListeners();
  }

}

enum ProfileEdited {
  name, address, phone
}