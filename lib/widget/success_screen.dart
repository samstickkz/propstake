import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/utils/string_extensions.dart';
import '/utils/widget_extensions.dart';
import '../localization/locales.dart';
import 'app_button.dart';
import 'apptexts.dart';

class SuccessScreen extends StatelessWidget {
  final VoidCallback onTap;
  final String? title;
  final String? body;
  final String? image;
  final String? buttonText;
  final Widget? icon;
  const SuccessScreen({
    super.key,
    required this.onTap,
    this.title,
    this.body,
    this.image,
    this.icon,
    this.buttonText
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 25.sp),
        child: Column(
          children: [
            54.sp.sbH,
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SvgPicture.asset(
                //   AppImages.checkMark,
                //   width: 50.sp,
                //   height: 40.sp,
                // ),
                60.sp.sbH,
                AppText(
                  title??"",
                  size: 25.sp,
                  weight: FontWeight.w700,
                  align: TextAlign.center,
                ),
                5.sp.sbH,
                AppText(
                  body??"",
                  size: 20.sp,
                  weight: FontWeight.w400,
                  align: TextAlign.center,
                ),

              ],
            )),
            AppButton(
              isLoading: false,
              text: buttonText?? LocaleData.continues.convertString(),
              onTap: onTap,
            )
          ],
        ),
      ),
    );
  }
}
