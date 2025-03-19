import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/app_button.dart';
import 'package:propstake/widget/svg_builder.dart';

import '../../../gen/assets.gen.dart';
import '../../../widget/apptexts.dart';

class SuccessAuthVerification extends StatelessWidget {
  final VoidCallback onTap;
  const SuccessAuthVerification({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650.sp,
      width: width(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgBuilder(Assets.svg.celebrateGrace, size: 227.sp,),
          30.sp.sbH,
          BounceIn(child: AppText("Hurray!!", size: 24.sp, isTitle: true, weight: FontWeight.w500,)),
          20.sp.sbH,
          AppText("Account created successfully", size: 16.sp),
          30.sp.sbH,
          AppButton.fullWidth(
            isLoading: false,
            text: "Go to Dashboard",
            onTap: onTap,
          )
        ],
      ),
    );
  }
}
