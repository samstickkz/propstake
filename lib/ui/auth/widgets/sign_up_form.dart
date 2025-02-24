import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/app_theme/palette.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/validator.dart';
import '../../../widget/app_button.dart';
import '../../../widget/apptexts.dart';
import '../../../widget/or_builder.dart';
import '../../../widget/text_field.dart';
import '../auth.vm.dart';

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
          // 20.sp.sbH,
          FadeIn(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: LocaleData.join.convertString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextSpan(
                      text: LocaleData.propertyStake.convertString(),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                      ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          20.sp.sbH,
          AppTextField(
            controller: model.upEmailController,
            validator: emailValidator,
            hintText: LocaleData.email.convertString(),
            hint: LocaleData.enterEmailAddress.convertString(),
            onChanged: model.onChangedUp,
          ),
          20.sp.sbH,
          AppTextField(
            controller: model.upPasswordController,
            validator: passwordValidator,
            isPassword: true,
            hintText: LocaleData.password.convertString(),
            hint: LocaleData.enterPassword.convertString(),
            onChanged: model.onChangedUp,
          ),
          30.sp.sbH,
          AppButton.fullWidth(
            isLoading: model.isLoading,
            onTap: model.formKey.currentState?.validate() ==true? model.createAccount: null,
            text: LocaleData.createAccount.convertString(),
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
                      color: stateColor11(),
                    ),
                  ),
                  TextSpan(
                    text: LocaleData.termsOfService.convertString(),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: stateColor12(),
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp
                    ),
                  ),
                  TextSpan(
                    text: " ${LocaleData.and.convertString()}",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 12.sp,
                        color: stateColor11(),
                    ),
                  ),
                  TextSpan(
                    text: LocaleData.privacyPolicy.convertString(),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: stateColor12(),
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