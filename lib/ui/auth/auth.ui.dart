import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/utils/validator.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_button.dart';
import 'package:propstake/widget/apptexts.dart';
import 'package:propstake/widget/auth_appbar.dart';
import 'package:propstake/widget/or_builder.dart';
import 'package:propstake/widget/svg_builder.dart';
import 'package:propstake/widget/text_field.dart';

import '../../app_theme/palette.dart';
import '../../gen/assets.gen.dart';
import '../base/base-ui.dart';
import 'auth.vm.dart';
import 'widgets/sign_up_choice_widget.dart';

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
              AppText("Join Realify", size: 24.sp, isTitle: true,),
              20.sp.sbH,
              SignUpChoiceWidget(
                tabs: model.screens,
                activeScreen: model.screen,
                changeScreen: model.changeScreen,
              ),
              20.sp.sbH,
              Expanded(
                child: model.screens[0] == model.screen?
                SignUpForm(model: model):
                SignInForm(model: model,)
              ),
              40.sp.sbH,
              OrBuilder(),
              40.sp.sbH,
              Row(
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
              80.sp.sbH,
            ],
          ),
        ),
      ),
    );
  }
}


class SignUpForm extends StatelessWidget {
  final AuthViewModel model;
  const SignUpForm({
    super.key,
    required this.model
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: model.formKey,
      child: ListView(
        children: [
          20.sp.sbH,
          AppTextField(
            controller: model.upEmailController,
            validator: emailValidator,
            hintText: "Email",
            hint: "Enter Email Address",
            onChanged: model.onChangedUp,
          ),
          20.sp.sbH,
          AppTextField(
            controller: model.upPasswordController,
            validator: passwordValidator,
            isPassword: true,
            hintText: "Password",
            hint: "Enter Password",
            onChanged: model.onChangedUp,
          ),
          30.sp.sbH,
          AppButton.fullWidth(
            isLoading: model.isLoading,
            onTap: model.formKey.currentState?.validate() ==true? model.createAccount: null,
            text: "Create Account",
          )
        ],

      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  final AuthViewModel model;
  const SignInForm({
    super.key,
    required this.model
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: model.formKey2,
      child: ListView(
        children: [
          20.sp.sbH,
          AppTextField(
            controller: model.inEmailController,
            validator: emailValidator,
            hintText: "Email",
            hint: "Enter Email Address",
            onChanged: model.onChangedIn,
          ),
          20.sp.sbH,
          AppTextField(
            controller: model.inPasswordController,
            validator: passwordValidator,
            isPassword: true,
            hintText: "Password",
            hint: "Enter Password",
            onChanged: model.onChangedIn,
          ),
          16.sp.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: (){},
                child: AppText(
                  "Forgot Password?",
                  decoration: TextDecoration.underline,

                ),
              ),
            ],
          ),
          30.sp.sbH,
          AppButton.fullWidth(
            isLoading: model.isLoading,
            onTap: model.formKey2.currentState?.validate() ==true? model.login: null,
            text: "Log in",
          )
        ],
      ),
    );
  }
}
