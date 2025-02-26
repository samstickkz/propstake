import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_auth/local_auth.dart';
import 'package:propstake/ui/base/base-ui.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/auth_appbar.dart';
import 'package:propstake/widget/svg_builder.dart';

import '../../../app_theme/palette.dart';
import '../../../gen/assets.gen.dart';
import '../../../localization/locales.dart';
import '../../../widget/app_button.dart';
import '../../../widget/apptexts.dart';
import 'local_authentication.vm.dart';

class LocalAuthScreen extends StatelessWidget {
  const LocalAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LocalAuthViewModel>(
      onModelReady: (m)=> m.init(),
      builder: (model, theme)=> Scaffold(
        appBar: AppAppBar(),
        body: Padding(
          padding: 16.sp.padH,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              40.sp.sbH,
              FadeIn(child: AppText(LocaleData.biometricVerificationSetup.convertString(), size: 24.sp, isTitle: true,)),
              20.sp.sbH,
              Padding(
                padding: 50.sp.padH,
                child: AppText(LocaleData.enableBiometricVerification.convertString(), size: 14.68.sp),
              ),
              Spacer(),
              SvgBuilder(
                model.bioType == BiometricType.face? Assets.svg.faceId : Assets.svg.fingerprint,
                size: 110.sp,
              ),
              Spacer(),
              Column(
                children: [
                  AppButton.fullWidth(
                    isLoading: false,
                    onTap: ()=> model.saveBioType(true),
                    text: LocaleData.setUp.convertString(),
                    height: 65.h,
                  ),
                  16.sp.sbH,
                  AppButton.fullWidth(
                    isLoading: false,
                    onTap: model.goHome,
                    backgroundColor: fadeBackground(),
                    text: LocaleData.notNow.convertString(),
                    textColor: stateColor12(),
                    height: 65.h,
                  ),
                ],
              ),
              40.sp.sbH,
            ],
          ),
        ),
      ),
    );
  }
}
