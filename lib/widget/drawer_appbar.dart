import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/utils/widget_extensions.dart';

import '../app_theme/palette.dart';
import '../gen/assets.gen.dart';
import 'apptexts.dart';
import 'svg_builder.dart';

class DrawerAppBar extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final bool centerTitle;
  const DrawerAppBar({
    super.key,
    this.title,
    this.subTitle,
    required this.centerTitle
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(centerTitle)...[
          50.sp.sbW,
        ],
        Expanded(
            child: Column(
              crossAxisAlignment: centerTitle? CrossAxisAlignment.center: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(title!=null)...[
                  AppText(title??"", isTitle: true, isBold: true, size: 19.20.sp,)
                ],
                if(subTitle!=null)...[
                  AppText(subTitle??"", size: 16.sp,)
                ]
              ],
            )
        ),
        10.sp.sbW,
        InkWell(
          onTap: Navigator.of(context).pop,
          child: Container(
            height: 40.sp,
            alignment: Alignment.center,
            width: 40.sp,
            decoration: BoxDecoration(
                color: stateColor3(isDark: isAppDark(context)),
                shape: BoxShape.circle
            ),
            child: SvgBuilder(
              Assets.svg.closeCircle,
              size: 16.sp,
              color: isAppDark(context)? Colors.white: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}