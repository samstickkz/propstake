import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_theme/palette.dart';
import '../gen/assets.gen.dart';
import '../utils/widget_extensions.dart';
import 'apptexts.dart';
import 'svg_builder.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final VoidCallback? goTo;
  final Color? textColor;
  final String text;
  const AuthAppBar({
    super.key,
    this.leading,
    this.text = "",
    this.textColor,
    this.goTo,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).primaryColor == const Color(0xFFEDF0F0);
    return SafeArea(
      top: true,
      bottom: false,
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: 50.sp,
          margin: 16.sp.padH,
          width: width(context),
          child: Material(
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if(Navigator.of(context).canPop())...[
                        InkWell(
                          onTap: Navigator.of(context).pop,
                          child: Container(
                            height: 32.sp,
                            width: 32.sp,
                            alignment: Alignment.center,
                            child: SvgBuilder(Assets.svg.closeCircle, size: 16.sp, color: stateColor11(isDark: isDark),),
                          ),
                        )
                      ],
                    ],
                  ),
                ),
                if(text.isNotEmpty)...[
                  10.sp.sbW,
                  InkWell(
                    onTap: goTo,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
                      child: AppText(
                        text,
                        size: 16.sp,
                        color: textColor ?? (goTo == null? stateColor9(isDark: isDark): const Color(0xFF3E63DD)),
                      ),
                    ),
                  )
                ]

              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(390.w, 50.sp);
}

