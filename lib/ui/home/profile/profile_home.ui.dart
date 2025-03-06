import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/app_theme/palette.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/constants.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_card.dart';
import 'package:propstake/widget/apptexts.dart';
import 'package:propstake/widget/default_profile_pic.dart';
import 'package:propstake/widget/svg_builder.dart';

import '../../../gen/assets.gen.dart';
import '../../../widget/appbar_widget.dart';
import '../../base/base-ui.dart';
import 'my_account/my_account.ui.dart';
import 'profile_home.vm.dart';

class ProfileHomeScreen extends StatelessWidget {
  final bool goToEdit;
  const ProfileHomeScreen({super.key, this.goToEdit = false});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileHomeViewModel>(
      onModelReady: (m)=> m.init(),
      onMount: (m)=> goToEdit? m.delayFirst(): null,
      builder: (model, theme)=> Scaffold(
        appBar: AppBars(
          text: LocaleData.profile.convertString(),
          noLeading: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 100.sp,
              left: 16.sp,
              right: 16.sp,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: "image",
                  child: SizedBox(
                    height: 137.sp,
                    width: 137.sp,
                    child: Stack(
                      children: [
                        ProfilePic(
                          user: userService.user,
                          size: 137.sp,
                        ),
                        // Align(
                        //   alignment: Alignment.bottomRight,
                        //   child: Padding(
                        //     padding: 5.sp.padA,
                        //     child: SvgBuilder(
                        //       Assets.svg.camera
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
                40.sp.sbH,
                AppCard(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.sp, horizontal: 16.sp
                  ),
                  radius: 8.r,
                  child: Column(
                    children: [
                      ProfileOptionCard(
                        isLast: false,
                        onTap: model.goToMyAccount,
                        text: LocaleData.myAccount.convertString(),
                        svg: Assets.svg.profile,
                      ),
                      ProfileOptionCard(
                        isLast: false,
                        onTap: model.goToSettings,
                        text: LocaleData.settings.convertString(),
                        svg: Assets.svg.setting,
                      ),
                      ProfileOptionCard(
                        isLast: true,
                        onTap: model.goToSecurity,
                        text: LocaleData.securityPrivacyPolicy.convertString(),
                        svg: Assets.svg.security,
                      ),
                    ],
                  ),
                ),
                30.sp.sbH,
                AppCard(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.sp, horizontal: 16.sp
                  ),
                  radius: 8.r,
                  child: Column(
                    children: [
                      ProfileOptionCard(
                        isLast: false,
                        onTap: model.goToAboutUs,
                        text: LocaleData.aboutUs.convertString(),
                        svg: Assets.svg.aboutUs,
                      ),
                      ProfileOptionCard(
                        isLast: false,
                        onTap: model.goToTermsAndCondition,
                        text: LocaleData.termsConditions.convertString(),
                        svg: Assets.svg.security,
                      ),
                      ProfileOptionCard(
                        isLast: false,
                        onTap: model.goToContactUs,
                        text: LocaleData.contactUs.convertString(),
                        svg: Assets.svg.call,
                      ),
                      ProfileOptionCard(
                        isLast: true,
                        onTap: model.goToFAQ,
                        text: LocaleData.faq.convertString(),
                        svg: Assets.svg.faq,
                      ),
                    ],
                  ),
                ),
                30.sp.sbH,
                SingleOptionCard(
                  onTap: model.popLogout,
                  text: LocaleData.logout.convertString(),
                  svg: Assets.svg.logout,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ProfileOptionCard extends StatelessWidget {
  final String text;
  final String? svg;
  final bool endIcon;
  final bool isLast;
  final Widget? title;
  final Widget? trailing;
  final VoidCallback? onTap;
  const ProfileOptionCard({
    super.key,
    this.text ="",
    this.svg,
    this.endIcon = true,
    this.title,
    required this.isLast, 
    this.onTap,
    this.trailing
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: 16.sp.padV,
        decoration: BoxDecoration(
          border: Border(
            bottom: isLast? BorderSide.none : BorderSide(
              color: stateColor4(isAppDark(context)),
              width: 1.sp,
            ),
          )
        ),
        child: Row(
          children: [
            if(svg != null)...[
              SvgBuilder(svg!, size: 21.sp, color: primaryColor,),
              20.sp.sbW
            ],
            Expanded(
              child: title ?? AppText(
                text,
                size: 16.sp,
                color: stateColor12(isAppDark(context)),
              )
            ),
            if(trailing != null)...[
              20.sp.sbW,
              trailing!
            ],
            if(endIcon)...[
              20.sp.sbW,
              SvgBuilder(Assets.svg.arrowRight, size: 21.sp,)
            ],
          ],
        ),
      ),
    );
  }
}
