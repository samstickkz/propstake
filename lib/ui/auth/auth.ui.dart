import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_button.dart';
import 'package:propstake/widget/apptexts.dart';
import 'package:propstake/widget/auth_appbar.dart';
import 'package:propstake/widget/or_builder.dart';
import 'package:propstake/widget/svg_builder.dart';
import 'package:animate_do/animate_do.dart';

import '../../gen/assets.gen.dart';
import '../base/base-ui.dart';
import 'auth.vm.dart';
import 'widgets/sign_in_form.dart';
import 'widgets/sign_up_choice_widget.dart';
import 'widgets/sign_up_form.dart';

class AuthHomeScreen extends StatelessWidget {
  const AuthHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      builder: (model, theme)=> Scaffold(
        appBar: AppAppBar(
          leading: SvgBuilder(
            isAppDark(context)? Assets.svg.tempLogo: Assets.svg.tempLogoLight,
            width: 81.w, height: 27.h,
          ),
        ),
        body: Padding(
          padding: 16.sp.padA,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              40.sp.sbH,
              FadeIn(child: AppText("Join Realify", size: 24.sp, isTitle: true,)),
              20.sp.sbH,
              SignUpChoiceWidget(
                tabs: model.screens,
                activeScreen: model.screen,
                changeScreen: model.changeScreen,
              ),
              20.sp.sbH,
              Expanded(
                child: model.screens[0] == model.screen?
                SlideInDown(child: SignUpForm(model: model)):
                SlideInUp(child: SignInForm(model: model,))
              ),
              40.sp.sbH,
              OrBuilder(),
              40.sp.sbH,
              SlideInUp(
                child: Row(
                  spacing: 20.sp,
                  children: [
                    Expanded(
                      child: AppButton.outline(
                        svgImage: Assets.svg.google,
                        onTap: (){},
                      ),
                    ),
                    Expanded(
                      child: AppButton.outline(
                        svgImage: isAppDark(context)? Assets.svg.appleWhite: Assets.svg.appleBlack,
                        onTap: (){},
                      ),
                    ),
                    Expanded(
                      child: AppButton.outline(
                        svgImage: Assets.svg.microsoft,
                        onTap: (){},
                      ),
                    ),

                  ],
                ),
              ),
              80.sp.sbH,
            ],
          ),
        ),
      ),
    );
  }
}





