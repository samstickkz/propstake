import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/widget/svg_builder.dart';

import '../gen/assets.gen.dart';
import '/utils/string_extensions.dart';
import '/utils/widget_extensions.dart';
import 'app_button.dart';
import 'appbar_widget.dart';
import 'apptexts.dart';

class SuccessScreen extends StatelessWidget {
  final VoidCallback onTap;
  final String? title;
  final String body;
  final String? svg;
  final String? buttonText;
  final Widget? icon;
  const SuccessScreen({
    super.key,
    required this.onTap,
    this.title,
    required this.body,
    this.svg,
    this.icon,
    this.buttonText
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 25.sp),
        child: Column(
          children: [
            54.sp.sbH,
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgBuilder(svg?? Assets.svg.celebrateGrace, size: 227.sp,),
                40.sp.sbH,
                if(title != null)...[
                  AppText(
                    title??"",
                    size: 25.sp,
                    weight: FontWeight.w500,
                    align: TextAlign.center,
                    isTitle: true,
                  ),
                  5.sp.sbH,
                ],
                if(body.isNotEmpty)
                Padding(
                  padding: 40.sp.padH,
                  child: AppText(
                    body,
                    size: 16.sp,
                    weight: FontWeight.w400,
                    align: TextAlign.center,
                  ),
                ),

              ],
            )),
            30.sp.sbH,
            AppButton.fullWidth(
              isLoading: false,
              text: buttonText?? LocaleData.done.convertString(),
              onTap: onTap,
            ),
            30.sp.sbH,
          ],
        ),
      ),
    );
  }
}
