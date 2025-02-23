import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/utils/widget_extensions.dart';

import 'apptexts.dart';

class OrBuilder extends StatelessWidget {
  const OrBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: 0.0.sbH),
        Expanded(child: Divider(height: 5.sp,)),
        5.sp.sbW,
        AppText("OR"),
        5.sp.sbW,
        Expanded(child: Divider(height: 5.sp,)),
        Expanded(child: 0.0.sbH),
      ],
    );
  }
}