import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/appbar_widget.dart';

import '../../../../app_theme/palette.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widget/app_card.dart';
import '../../../base/base-ui.dart';
import '../my_account/my_account.ui.dart';
import '../profile_home.ui.dart';
import 'security.vm.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SecurityViewModel>(
      builder: (model, child)=> Scaffold(
        appBar: AppBars(
          text: LocaleData.securityPrivacyPolicy.convertString(),
        ),
        body: ListView(
          padding: 16.sp.padA,
          children: [
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
                  text: LocaleData.biometricAuthentication.convertString(),
                  svg: Assets.svg.notification,
                  trailing: Transform.scale(
                    scale: 0.6,
                    child: CupertinoSwitch(
                      value: model.isActive,
                      onChanged: model.changeValue,
                      activeColor: primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            SingleOptionCard(
              onTap: model.goToSocial,
              text: LocaleData.socialLogin.convertString(),
              svg: Assets.svg.socialLogin,
            ),
            SingleOptionCard(
              onTap: (){},
              text: LocaleData.privacyPolicy.convertString(),
              svg: Assets.svg.privacyPolicy,
            ),
          ],
        ),
      ),
    );
  }
}
