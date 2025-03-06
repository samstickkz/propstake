import 'package:flutter/material.dart';
import 'package:propstake/gen/assets.gen.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/ui/base/base-vm.dart';
import 'package:propstake/utils/string_extensions.dart';

import 'profile/profile_home.ui.dart';
import 'properties/properies.ui.dart';

class BottomNavigationViewModel extends BaseViewModel {


  List<NavType> navs = [
    NavType(
      name: LocaleData.properties.convertString(),
      activeIcon: Assets.svg.propertiesActive,
      inActiveIcon: Assets.svg.properties
    ),
    NavType(
      name: LocaleData.wallet.convertString(),
      activeIcon: Assets.svg.walletActive,
      inActiveIcon: Assets.svg.wallet
    ),
    NavType(
      name: LocaleData.myInvestment.convertString(),
      activeIcon: Assets.svg.myInvestmentActive,
      inActiveIcon: Assets.svg.myInvestment
    ),
    NavType(
      name: LocaleData.reward.convertString(),
      activeIcon: Assets.svg.rewardActive,
      inActiveIcon: Assets.svg.reward
    ),
    NavType(
      name: LocaleData.profile.convertString(),
      activeIcon: Assets.svg.profileActive,
      inActiveIcon: Assets.svg.profile
    ),
  ];

  int index = 0;

  changeIndex(int val){
    index = val;
    notifyListeners();
  }

  init(int startIndex){
    index = startIndex;
    notifyListeners();
  }

  List<Widget> screens = [
    PropertiesHomeScreen(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    ProfileHomeScreen(),
  ];

}


class NavType {
  String name;
  String activeIcon;
  String inActiveIcon;

  NavType({required this.name, required this.activeIcon, required this.inActiveIcon});
}