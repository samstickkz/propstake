import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/utils/widget_extensions.dart';

import '../../../utils/validator.dart';
import '../../../widget/app_button.dart';
import '../../../widget/apptexts.dart';
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