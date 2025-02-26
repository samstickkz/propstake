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


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                  child: AppText("Trouble Logging In?", size: 24.sp, isTitle: true,)
                ),
                20.sp.sbH,
                AppText(
                  "Enter your email address and we’ll send you a \nlink to help you get back into your account",
                  size: 14.68.sp,
                  align: TextAlign.center,
                ),
                40.sp.sbH,
                SlideInDown(
                  child: AppTextField(
                    controller: model.upEmailController,
                    validator: emailValidator,
                    hintText: "Email",
                    hint: "Enter Email Address",
                    onChanged: model.onChangedUp,
                  ),
                ),
                40.sp.sbH,
                SlideInUp(
                  child: AppButton.fullWidth(
                    isLoading: model.isLoading,
                    onTap: model.formKey.currentState?.validate() ==true? model.startChangePassword: null,
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





