import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/validator.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_button.dart';
import 'package:propstake/widget/apptexts.dart';
import 'package:propstake/widget/auth_appbar.dart';
import 'package:propstake/widget/svg_builder.dart';
import 'package:animate_do/animate_do.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/constants.dart';
import '../../../widget/text_field.dart';
import '../../base/base-ui.dart';
import '../auth.vm.dart';


class UpdatePasswordScreen extends StatelessWidget {
  final String code;
  final String email;
  const UpdatePasswordScreen({super.key, required this.code, required this.email});

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      builder: (model, theme)=> Scaffold(
        appBar: AppAppBar(),
        body: Form(
          key: model.formKey,
          child: Padding(
            padding: 16.sp.padA,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                40.sp.sbH,
                FadeIn(
                  child: AppText(LocaleData.updatePassword.convertString(), size: 24.sp, isTitle: true,)
                ),
                40.sp.sbH,
                SlideInRight(
                  child: AppTextField(
                    controller: model.newPasswordController,
                    validator: passwordValidator,
                    hintText: LocaleData.newPassword.convertString(),
                    hint: LocaleData.enterNewPassword.convertString(),
                    isPassword: true,
                    onChanged: model.onChangedUp,
                  ),
                ),
                20.sp.sbH,
                SlideInLeft(
                  child: AppTextField(
                    controller: model.confirmPasswordController,
                    validator: (val)=> confirmPasswordValidator(model.newPasswordController, model.confirmPasswordController),
                    hintText: LocaleData.confirmPassword.convertString(),
                    hint: LocaleData.enterNewPassword.convertString(),
                    isPassword: true,
                    onChanged: model.onChangedUp,
                  ),
                ),
                40.sp.sbH,
                SlideInUp(
                  child: AppButton.fullWidth(
                    isLoading: model.isLoading,
                    onTap: model.formKey.currentState?.validate() == true? ()=> model.submitNewPassword(email, code): null,
                    text: LocaleData.confirm.convertString(),
                  ),
                ),
                80.sp.sbH,
              ],
            ),
          ),
        ),
      ),
    );
  }
}





