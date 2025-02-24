import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/gen/assets.gen.dart';

import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_button.dart';
import 'package:propstake/widget/apptexts.dart';
import 'package:propstake/widget/inidicator.dart';

import '../../../app_theme/palette.dart';
import '../../../localization/locales.dart';
import '../../../widget/text_field.dart';
import '../../base/base-ui.dart';
import '../splash/splash.vm.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashScreenViewModel>(
      builder: (model ,theme)=> Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleData.exploreProperties.convertString(),
            style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
              color: primaryColor
            ),
          ),
          actions: [
            Row(
              children: [
                SizedBox(
                  width: 120.sp,
                  child: LanguageDropDown(
                    onChanged: model.changeLanguage,
                    contentPadding: 5.sp.padA,
                  ),
                ),
                16.sp.sbW
              ],
            )
          ],
        ),
        body: PageView.builder(
          itemCount: model.onboardingData.length,
          controller: model.controller,
          onPageChanged: model.onPageChanged,
          itemBuilder: (_,i){
            return Column(
              children: [
                Container(
                  height: 403.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        model.onboardingData[i].image
                      )
                    )
                  ),
                ),
                28.sp.sbH,
                Indicators(total: model.onboardingData.length, current: model.currentIndex, onChange: model.changePage,),
                10.sp.sbH,
                Expanded(child: Padding(
                  padding: 16.sp.padA,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                        model.onboardingData[i].title,
                        isTitle: true,
                        size: 20.sp,
                        align: TextAlign.center
                      ),
                      16.sp.sbH,
                      Padding(
                        padding: 25.sp.padH,
                        child: AppText(
                          model.onboardingData[i].subTitle,
                          size: 16.sp,
                          align: TextAlign.center,
                          color: stateColor12(isDark: isAppDark(context)),
                        ),
                      ),
                      16.sp.sbH,
                      ButtonWidget(
                        toLogin: model.goToAuth,
                      )

                    ],
                  ),
                )),
              ],
            );
          }
        ),
      ),
    );
  }
}


class ButtonWidget extends StatelessWidget {
  final Function(bool) toLogin;
  const ButtonWidget({super.key, required this.toLogin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton.fullWidth(
          isLoading: false,
          onTap: ()=> toLogin(false),
          text: LocaleData.signUp.convertString(),
          height: 65.h,
        ),
        16.sp.sbH,
        AppButton.fullWidth(
          isLoading: false,
          onTap: ()=> toLogin(true),
          backgroundColor: fadeBackground(isDark: isAppDark(context)),
          text: LocaleData.signIn.convertString(),
          textColor: stateColor12(isDark: isAppDark(context)),
          height: 65.h,
        ),
      ],
    );
  }
}
