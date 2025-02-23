import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../auth/auth.ui.dart';
import '../../base/base-vm.dart';

class SplashScreenViewModel extends BaseViewModel {

  late final AnimationController _controller;

  init(TickerProvider vsync)async {

    _controller = AnimationController(vsync: vsync, duration: const Duration(seconds: 4))
      ..forward()
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          // HANDLE NAVIGATION AFTER SPLASH SCREEN
          appRelaunch();
        }
      });
  }


  Future<Object> appRelaunch() async {

    if(userService.isUserLoggedIn){
      return navigationService.navigateToAndRemoveUntilWidget(const Scaffold());
    }else{
      // return navigationService.navigateToAndRemoveUntilWidget(const AppBottomNavScreen());
      return navigationService.navigateToAndRemoveUntilWidget(const AuthHomeScreen());
    }
  }

}