import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/app_theme/palette.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/appbar_widget.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../widget/app_card.dart';
import '../../../base/base-ui.dart';
import '../profile_home.ui.dart';
import 'settings.vm.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      builder: (model, child) =>Scaffold(
        appBar: AppBars(
          text: LocaleData.settings.convertString(),
        ),
        body: ListView(
          padding: 16.sp.padA,
          children: [
            AppCard(
              margin: 20.sp.padB,
              padding: EdgeInsets.symmetric(
                  vertical: 5.sp, horizontal: 16.sp
              ),
              radius: 8.r,
              child: Column(
                children: [
                  ProfileOptionCard(
                    isLast: true,
                    onTap: (){},
                    text: LocaleData.appLanguage.convertString(),
                    svg: Assets.svg.language,
                  ),
                ],
              ),
            ),
            AppCard(
              margin: 20.sp.padB,
              padding: EdgeInsets.symmetric(
                  vertical: 5.sp, horizontal: 16.sp
              ),
              radius: 8.r,
              child: Column(
                children: [
                  ProfileOptionCard(
                    isLast: true,
                    onTap: (){},
                    text: LocaleData.currency.convertString(),
                    svg: Assets.svg.currency,
                  ),
                ],
              ),
            ),
            AppCard(
              margin: 20.sp.padB,
              padding: EdgeInsets.symmetric(
                  vertical: 5.sp, horizontal: 16.sp
              ),
              radius: 8.r,
              child: Column(
                children: [
                  ProfileOptionCard(
                    isLast: true,
                    onTap: (){},
                    text: LocaleData.notificationSettings.convertString(),
                    svg: Assets.svg.notification,
                  ),
                ],
              ),
            ),
            AppCard(
              margin: 20.sp.padB,
              padding: EdgeInsets.symmetric(
                  vertical: 0.sp,
              ),
              radius: 8.r,
              child: Padding(
                padding: 16.sp.padL,
                child: ProfileOptionCard(
                  isLast: true,
                  endIcon: false,
                  // onTap: (){},
                  text: LocaleData.pushNotification.convertString(),
                  svg: Assets.svg.notification,
                  trailing: Transform.scale(
                    scale: 0.6,
                    child: CupertinoSwitch(
                      value: model.isActive,
                      onChanged: model.changeValue,
                      activeColor: primaryColor,
                      // inactiveTrackColor: isAppDark(context)? Colors.black: Color(0xFFF6F6F6),
                      // inactiveThumbColor: iconColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
