import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';

import '../../../app_theme/palette.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/validator.dart';
import '../../../widget/app_button.dart';
import '../../../widget/apptexts.dart';
import '../../../widget/or_builder.dart';
import '../../../widget/text_field.dart';
import '../auth.vm.dart';

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
          AppText(
            LocaleData.welcomeBack.convertString(),
            isTitle: true,
            align: TextAlign.center,
            size: 24.sp,
          ),
          20.sp.sbH,
          AppTextField(
            controller: model.inEmailController,
            validator: emailValidator,
            hintText: LocaleData.email.convertString(),
            hint: LocaleData.enterEmailAddress.convertString(),
            onChanged: model.onChangedIn,
          ),
          20.sp.sbH,
          AppTextField(
            controller: model.inPasswordController,
            validator: passwordValidator,
            isPassword: true,
            hintText: LocaleData.password.convertString(),
            hint: LocaleData.enterPassword.convertString(),
            onChanged: model.onChangedIn,
          ),
          16.sp.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: model.forgotPassword,
                child: AppText(
                  LocaleData.forgetPassword.convertString(),
                  decoration: TextDecoration.underline,

                ),
              ),
            ],
          ),
          30.sp.sbH,
          AppButton.fullWidth(
            isLoading: model.isLoading,
            onTap: model.formKey2.currentState?.validate() ==true? model.login: null,
            text: LocaleData.accessMyAccount.convertString(),
          ),
          20.sp.sbH,
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
          40.sp.sbH,
          Padding(
            padding: 35.sp.padH,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: LocaleData.byClicking.convertString(),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 12.sp,
                      color: stateColor11(isAppDark(context)),
                    ),
                  ),
                  TextSpan(
                    text: LocaleData.termsOfService.convertString(),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: stateColor12(isAppDark(context)),
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp
                    ),
                  ),
                  TextSpan(
                    text: " ${LocaleData.and.convertString()}",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 12.sp,
                      color: stateColor11(isAppDark(context)),
                    ),
                  ),
                  TextSpan(
                    text: LocaleData.privacyPolicy.convertString(),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: stateColor12(isAppDark(context)),
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}