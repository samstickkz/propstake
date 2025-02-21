import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

import '../utils/widget_extensions.dart';
import '../widget/apptexts.dart';


Widget toast(String message, {bool success = false, String? title}) {
  return Align(
      alignment: Alignment.topCenter,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: 16.sp.padH,
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 14.sp),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0.00, -1.00),
                  end: const Alignment(0, 1),
                  colors: success? [const Color(0xFF177D0D), const Color(0xFF29AF1D)] : [Colors.red, const Color(0xFFF50000)],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x19122210),
                    blurRadius: 20,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x19112210),
                    blurRadius: 20,
                    offset: Offset(1, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                children: [
                  // SvgPicture.asset(success? AppImages.successIcon: AppImages.errorIcon,
                  //   height: 35.sp,
                  //   width: 35.sp,
                  // ),
                  // 10.0.sbW,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        title != null? AppText(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700
                          ),
                        ):0.0.sbW,
                        title != null? 2.sp.sbH :0.0.sbW,
                        AppText(
                          message,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
}

// styled! ?:

showCustomToast(String message, {bool success = false, num? time, String? title}) {

  // toast message
  showToastWidget(
    toast(message, success: success, title: title),
    duration: const Duration(seconds: 4),
    onDismiss: () {},
  );
}