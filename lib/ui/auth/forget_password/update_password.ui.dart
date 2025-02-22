import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      builder: (model, theme)=> Scaffold(
        appBar: AppAppBar(
          leading: InkWell(
            onTap: navigationService.canPop() ? navigationService.goBack: null,
            child: SvgBuilder(
              isAppDark(context)? Assets.svg.tempLogo: Assets.svg.tempLogoLight,
              width: 81.w, height: 27.h,
            ),
          ),
        ),
        body: Form(
          key: model.formKey,
          child: Padding(
            padding: 16.sp.padA,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                40.sp.sbH,
                FadeIn(
                  child: AppText("Update password", size: 24.sp, isTitle: true,)
                ),
                40.sp.sbH,
                SlideInRight(
                  child: AppTextField(
                    controller: model.newPasswordController,
                    validator: passwordValidator,
                    hintText: "New Password",
                    hint: "Enter New Password",
                    isPassword: true,
                    onChanged: model.onChangedUp,
                  ),
                ),
                20.sp.sbH,
                SlideInLeft(
                  child: AppTextField(
                    controller: model.confirmPasswordController,
                    validator: (val)=> confirmPasswordValidator(model.newPasswordController, model.confirmPasswordController),
                    hintText: "Confirm Password",
                    hint: "Enter New Password Again",
                    isPassword: true,
                    onChanged: model.onChangedUp,
                  ),
                ),
                40.sp.sbH,
                SlideInUp(
                  child: AppButton.fullWidth(
                    isLoading: model.isLoading,
                    onTap: model.formKey.currentState?.validate() ==true? model.submitNewPassword: null,
                    text: "Confirm",
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





