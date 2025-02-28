import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/appbar_widget.dart';
import 'package:propstake/widget/apptexts.dart';
import 'package:propstake/widget/svg_builder.dart';

import '../../../../../app_theme/palette.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../base/base-ui.dart';
import '../security.vm.dart';



class SocialLoginScreen extends StatelessWidget {
  const SocialLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SecurityViewModel>(
      builder: (model, child)=> Scaffold(
        appBar: AppBars(
          text: LocaleData.socialLogin.convertString(),
        ),
        body: SizedBox(
          width: width(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120.sp,
                width: 120.sp,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: stateColor4(isAppDark(context))
                ),
                child: SvgBuilder(
                  Assets.svg.socialLogin,
                  size: 70.sp,
                ),
              ),
              30.sp.sbH,
              AppText(
                LocaleData.noActiveSocialLogin.convertString(),
                size: 20.sp,
                align: TextAlign.center,
                weight: FontWeight.w700,
                isTitle: true,
              )
            ],
          ),
        )
      ),
    );
  }
}
