import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/gen/assets.gen.dart';
import 'package:propstake/utils/widget_extensions.dart';

import '../app_theme/palette.dart';
import 'apptexts.dart';
import 'svg_builder.dart';

class ValidationDetailView extends StatelessWidget {
  final bool value;
  final String text;
  final bool? isValid;
  const ValidationDetailView({
    super.key, required this.value, required this.text, required this.isValid
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 8.sp.padB,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgBuilder(
              value? Assets.svg.check: Assets.svg.closeCircle
          ),
          10.sp.sbW,
          Expanded(
            child: AppText(
              text,
              weight: FontWeight.w500,
              size: 13.33.sp,
              color: isValid == null? stateColor10(isDark: isAppDark(context)): (value? green9(isDark: isAppDark(context)): red10(isDark: isAppDark(context))),
            ),
          )
        ],
      ),
    );
  }
}