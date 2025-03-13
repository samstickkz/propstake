import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/app_theme/palette.dart';
import 'package:propstake/ui/base/base-ui.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_card.dart';
import 'package:propstake/widget/apptexts.dart';
import 'package:propstake/widget/svg_builder.dart';

import 'bottom_nav.vm.dart';
import 'profile/profile_home.ui.dart';

class BottomNavigationScreen extends StatelessWidget {
  final int initialIndex;
  final bool goToProfile;
  const BottomNavigationScreen({super.key, this.initialIndex = 0, this.goToProfile = false});

  @override
  Widget build(BuildContext context) {
    return BaseView<BottomNavigationViewModel>(
      onModelReady: (m)=> m.init(initialIndex),
      builder: (model, theme)=> Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: height(context),
              width: width(context),
              child: model.index == 4? ProfileHomeScreen(goToEdit: goToProfile,): model.screens[model.index],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                top: false,
                bottom: true,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 10.sp),
                  child: AppCard(
                    heights: 66.sp,
                    radius: 12.sp,
                    padding: 8.sp.padA,
                    color: isAppDark(context)?
                    Color(0xFF181818) :
                    Color(0xFFF6F6F6),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: List.generate(
                              model.navs.length,
                              (index){
                                return BottomNavView(
                                  index: index,
                                  currentIndex: model.index,
                                  onTap: model.changeIndex,
                                  navType: model.navs[index],
                                );
                              }
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class BottomNavView extends StatelessWidget {
  final int index;
  final int currentIndex;
  final Function(int) onTap;
  final NavType navType;
  const BottomNavView({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    required this.navType
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: ()=> onTap(index),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgBuilder(index == currentIndex? navType.activeIcon : navType.inActiveIcon),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 14.sp,
                        child: AppText(
                          navType.name,
                          maxLine: 1,
                          size: 10.27.sp,
                          weight: FontWeight.w700,
                          color: index == currentIndex? primaryColor: null,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
