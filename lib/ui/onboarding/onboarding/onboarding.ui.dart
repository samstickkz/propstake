import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        resizeToAvoidBottomInset: false,
        body: PageView.builder(
          itemCount: model.onboardingData.length,
          controller: model.controller,
          onPageChanged: model.onPageChanged,
          itemBuilder: (_,i){
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(model.onboardingData[i].image),
                  fit: BoxFit.fill,
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.black45,
                appBar: AppBar(
                  title: Text(
                    LocaleData.exploreProperties.convertString(),
                    style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                        color: Colors.white
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
                  centerTitle: false,
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                ),
                body: Column(
                  children: [
                    10.sp.sbH,
                    Padding(
                      padding: 16.sp.padH,
                      child: Indicators(
                        total: model.onboardingData.length,
                        current: model.currentIndex,
                        onChange: model.changePage,
                        withFullWidth: true,
                        activeColor: Colors.white,
                        inactiveColor: Color(0x808F8F8F),
                      ),
                    ),
                    10.sp.sbH,
                    Expanded(child: Padding(
                      padding: 16.sp.padA,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: 100.sp.padR,
                            child: AppText(
                              model.onboardingData[i].title,
                              isTitle: true,
                              size: 32.sp,
                              align: TextAlign.start,
                              color: Colors.white,
                            ),
                          ),
                          16.sp.sbH,
                          Spacer(),
                          16.sp.sbH,
                          ButtonWidget(
                            toLogin: model.goToAuth,
                          ),
                          16.sp.sbH

                        ],
                      ),
                    )),
                  ],
                ),
              ),
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
          backgroundColor: fadeBackground(isAppDark(context)),
          text: LocaleData.signIn.convertString(),
          textColor: stateColor12(isAppDark(context)),
          height: 65.h,
        ),
      ],
    );
  }
}
