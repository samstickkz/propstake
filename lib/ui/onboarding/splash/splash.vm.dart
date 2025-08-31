import 'package:flutter/material.dart';
import 'package:propstake/gen/assets.gen.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';

import '../../../utils/constants.dart';
import '../../auth/auth.ui.dart';
import '../../base/base-vm.dart';
import '../../home/bottom_nav.ui.dart';
import '../onboarding/onboarding.ui.dart';
import 'dart:async';

class SplashScreenViewModel extends BaseViewModel {
  late final AnimationController _controller;
  Timer? _timer;
  init(TickerProvider vsync) async {
    _controller = AnimationController(vsync: vsync, duration: const Duration(seconds: 4))
      ..forward()
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          appRelaunch();
        }
      });

  }

  changeLanguage(String? val) {
    if (val == null) return;
    localeService.saveLocale(val);
    notifyListeners();
  }

  Future<Object> appRelaunch() async {
    if (userService.isUserLoggedIn) {
      return navigationService.navigateToAndRemoveUntilWidget(const BottomNavigationScreen());
    } else {
      return navigationService.navigateToAndRemoveUntilWidget(const OnBoardingScreen());
    }
  }

  goToAuth(bool isSignIn) {
    return navigationService.navigateToAndRemoveUntilWidget(AuthHomeScreen(isSignIn: isSignIn));
  }

  int currentIndex = 0;

  onPageChanged(int val) {
    currentIndex = val;
    notifyListeners();
  }

  List<OnboardingClass> onboardingData = [
    OnboardingClass(
      assetPath: Assets.png.onboardOne.path,
      title: LocaleData.smartRealEstateInvesting.convertString(),
      subTitle: LocaleData.ownAPieceOfRealEstate.convertString(),
    ),
    OnboardingClass(
      assetPath: "assets/videos/dubai.mp4", //
      title: "Earn Globally",
      subTitle: "Earn rental income from global real estate market",
    ),
    OnboardingClass(
      assetPath: Assets.png.onboardTwo.path,
      title: LocaleData.passiveIncomeMadeSimple.convertString(),
      subTitle: LocaleData.earnConsistentReturns.convertString(),
    ),
    OnboardingClass(
      assetPath: Assets.png.onboardThree.path,
      title: LocaleData.startWithJust100.convertString(),
      subTitle: LocaleData.noLargeDownPayments.convertString(),
    ),
  ];

  PageController controller = PageController();

  changePage(int index) {
    controller.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.linear);
    notifyListeners();
  }
}

class OnboardingClass {
  final String assetPath;
  final String title;
  final String subTitle;

  OnboardingClass({
    required this.assetPath,
    required this.title,
    required this.subTitle,
    // required String image,
  });

  bool get isVideo => assetPath.toLowerCase().endsWith(".mp4");
}
