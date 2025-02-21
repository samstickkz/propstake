import 'package:flutter/material.dart';
import 'package:propstake/ui/base/base-vm.dart';

class AuthViewModel extends BaseViewModel {

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

  TextEditingController inEmailController = TextEditingController();
  TextEditingController inPasswordController = TextEditingController();

  onChangedUp(String? val)async {
    formKey.currentState!.validate();
    notifyListeners();
  }

  onChangedIn(String? val)async {
    formKey2.currentState!.validate();
    notifyListeners();
  }

  createAccount(){

  }

  login(){

  }

  forgotPassword(){

  }

}