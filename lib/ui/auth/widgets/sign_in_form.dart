import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/utils/widget_extensions.dart';

import '../../../utils/validator.dart';
import '../../../widget/app_button.dart';
import '../../../widget/apptexts.dart';
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
                onTap: model.forgotPassword,
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