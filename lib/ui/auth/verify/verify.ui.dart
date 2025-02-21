import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/ui/base/base-ui.dart';
import 'package:propstake/utils/constants.dart';
import 'package:propstake/utils/validator.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/widget_extensions.dart';
import '../../../widget/app_button.dart';
import '../../../widget/apptexts.dart';
import '../../../widget/auth_appbar.dart';
import '../../../widget/svg_builder.dart';
import '../../../widget/text_field.dart';
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
                    80.sp.sbH,
                    AppText("Verify Code", size: 24.sp, isTitle: true,),
                    20.sp.sbH,
                    AppText("Enter the verification code sent to your email.", size: 14.68.sp),
                    60.sp.sbH,
                    AppTextField(
                      controller: model.codeController,
                      validator: emptyValidator,
                      hintText: "Verification Code",
                      hint: "Enter Verification Code",
                      keyboardType: TextInputType.number,
                      onChanged: model.onChanged,
                    ),
                    40.sp.sbH,
                    AppButton.fullWidth(
                      isLoading: model.isLoading,
                      onTap: model.formKey.currentState?.validate() ==true? ()=> model.confirm(reason): null,
                      text: "Confirm",
                    ),
                    40.sp.sbH,
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Didn’t receive code? ",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextSpan(
                              text: "Resend",
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w700
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = model.resendCode
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
}