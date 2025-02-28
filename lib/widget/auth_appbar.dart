import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/utils/constants.dart';

import '../app_theme/palette.dart';
import '../gen/assets.gen.dart';
import '../utils/widget_extensions.dart';
import 'apptexts.dart';
import 'svg_builder.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final String text;
  final List<Widget>? actions;
  final bool centerTitle;
  const AppAppBar({
    super.key,
    this.leading,
    this.text = "",
    this.title,
    this.actions,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading ?? (navigationService.canPop()? InkWell(
        onTap: Navigator.of(context).pop,
        child: Container(
          height: 32.sp,
          width: 32.sp,
          alignment: Alignment.center,
          child: SvgBuilder(Assets.svg.closeCircle, size: 16.sp, color: stateColor11(isAppDark(context)),),
        ),
      ): 0.0.sbH
      ),
      leadingWidth: 32.w + 32.w,

      title: title?? (text.isNotEmpty? Text(text): null),
      actions: actions,
    );

    // return SafeArea(
    //   top: true,
    //   bottom: false,
    //   child: Material(
    //     color: Colors.transparent,
    //     child: Container(
    //       height: 50.sp,
    //       margin: 16.sp.padH,
    //       width: width(context),
    //       child: Material(
    //         color: Colors.transparent,
    //         child: Row(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Expanded(
    //               child: Row(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   if(leading != null)...[
    //                     leading!
    //                   ] else
    //                   if(Navigator.of(context).canPop())...[
    //                     InkWell(
    //                       onTap: Navigator.of(context).pop,
    //                       child: Container(
    //                         height: 32.sp,
    //                         width: 32.sp,
    //                         alignment: Alignment.center,
    //                         child: SvgBuilder(Assets.svg.closeCircle, size: 16.sp, color: stateColor11(isAppDark(context)),),
    //                       ),
    //                     )
    //                   ],
    //                 ],
    //               ),
    //             ),
    //             if(text.isNotEmpty)...[
    //               10.sp.sbW,
    //               InkWell(
    //                 onTap: goTo,
    //                 child: Container(
    //                   padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
    //                   child: AppText(
    //                     text,
    //                     size: 16.sp,
    //                     color: textColor ?? (goTo == null? stateColor9(isAppDark(context)): const Color(0xFF3E63DD)),
    //                   ),
    //                 ),
    //               )
    //             ]
    //
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(390.w, 50.sp);
}

