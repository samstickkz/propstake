import 'package:flutter/material.dart';
import 'package:propstake/gen/assets.gen.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';

import '../../../utils/constants.dart';
import '../../auth/auth.ui.dart';
import '../../base/base-vm.dart';
import '../onboarding/onboarding.ui.dart';

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

  changeLanguage(String? val){
    if(val==null) return;
    localeService.saveLocale(val);
    notifyListeners();
  }


  Future<Object> appRelaunch() async {

    if(userService.isUserLoggedIn){
      return navigationService.navigateToAndRemoveUntilWidget(const Scaffold());
    }else{
      // return navigationService.navigateToAndRemoveUntilWidget(const AppBottomNavScreen());
      return navigationService.navigateToAndRemoveUntilWidget(const OnBoardingScreen());
    }
  }

  goToAuth(bool isSignIn){
    return navigationService.navigateToAndRemoveUntilWidget(AuthHomeScreen(isSignIn: isSignIn,));
  }

  int currentIndex = 0;

  onPageChanged(int val){
    currentIndex = val;
    notifyListeners();
  }
  
  List<OnboardingClass> onboardingData = [
    OnboardingClass(image: Assets.png.onboardOne.path, title: LocaleData.smartRealEstateInvesting.convertString(), subTitle: LocaleData.ownAPieceOfRealEstate.convertString()),
    OnboardingClass(image: Assets.png.onboardTwo.path, title: LocaleData.passiveIncomeMadeSimple.convertString(), subTitle: LocaleData.earnConsistentReturns.convertString()),
    OnboardingClass(image: Assets.png.onboardThree.path, title: LocaleData.startWithJust100.convertString(), subTitle: LocaleData.noLargeDownPayments.convertString()),
  ];

  PageController controller = PageController();

  changePage(int index){
    controller.animateToPage(index, duration: Duration(microseconds: 200), curve: Curves.linear);
    notifyListeners();
  }

}

class OnboardingClass {
  String image;
  String title;
  String subTitle;

  OnboardingClass({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}