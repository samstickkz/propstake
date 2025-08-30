import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/ui/base/base-ui.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/widget/custom_pinfield.dart';

import '../../../utils/widget_extensions.dart';
import '../../../widget/app_button.dart';
import '../../../widget/apptexts.dart';
import '../../../widget/auth_appbar.dart';
import 'verify.vm.dart';

class VerifyUserScreen extends StatelessWidget {
  final VerificationReason reason;
  final String email;
  const VerifyUserScreen({
    super.key,
    required this.reason,
    required this.email
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<VerifyUserViewModel>(
      onModelReady: (model)=> model.checkBiometricType(
        reasons: reason,
        emails: email
      ),
      builder: (model, theme)=> Scaffold(
        appBar: AppAppBar(),
        body: Padding(
          padding: 16.sp.padA,
          child: Form(
            key: model.formKey,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    40.sp.sbH,
                    FadeIn(child: AppText(LocaleData.verifyCode.convertString(), size: 24.sp, isTitle: true,)),
                    20.sp.sbH,
                    AppText(LocaleData.enterCodeSentToEmail.convertString(), size: 14.68.sp),
                    60.sp.sbH,
                    SlideInLeft(
                      child: CustomPinTextField(
                        title: LocaleData.verificationCode.convertString(),
                        onChanged: model.onChanged,
                        controller: model.codeController,
                        validator: (val){
                          if(model.codeController.text.trim().length != 6) return "";
                          return null;
                        },
                      ),
                    ),
                    40.sp.sbH,
                    SlideInRight(
                      child: AppButton.fullWidth(
                        isLoading: model.isLoading,
                        onTap: model.formKey.currentState?.validate() ==true? model.confirm: null,
                        text: LocaleData.confirm.convertString(),
                      ),
                    ),
                    40.sp.sbH,
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${LocaleData.didntReceiveCode.convertString()} ",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextSpan(
                              text: LocaleData.resend.convertString(),
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w700
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = model.resentConfirmEmail
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum VerificationReason {
  login,
  forgetPassword,
  reValidate,
}