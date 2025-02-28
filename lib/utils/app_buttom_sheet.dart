import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_theme/palette.dart';
import 'constants.dart';
import '../widget/drawer_appbar.dart';
import 'widget_extensions.dart';



Future<dynamic> bottomSheets({
  required Widget child,
  BuildContext? contexts,
  String? title,
  EdgeInsetsGeometry? padding,
  double? radius,
  bool centerTitle = false,
  String? subTitle,
  bool noHeader = false,
  bool barrierDismissible = true
}) async {
  BuildContext context = contexts?? navigationService.context;
  return await showCupertinoModalSheet(
      context: navigationService.context,
      barrierDismissible: barrierDismissible,
      builder: (_){
        return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: width(context),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius ?? 24.r),
                      topRight: Radius.circular(radius ?? 24.r),
                    )
                  ),
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      children: [

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
                          child: noHeader? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 6.sp,
                                width: 50.sp,
                                decoration: BoxDecoration(
                                  color: stateColor8(isAppDark(context)),
                                  borderRadius: BorderRadius.circular(5.r)
                                ),
                              )
                            ],
                          ):  DrawerAppBar(
                            title: title,
                            centerTitle: centerTitle,
                            subTitle: subTitle,
                          ),
                        ),
                        Padding(
                          padding: padding?? EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
                          child: child,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
      }
  );
}

Future<dynamic> appBottomSheet({
  required double height,
  required Widget child,
  BuildContext? contexts,
  double? radius,
  String? title,
  String? subTitle,
  bool centerTitle = false,
  bool noHeader = false
}) async {
  BuildContext context = contexts?? navigationService.navigatorKey.currentState!.context;
  return await showCupertinoModalSheet(
      context: context,
      builder: (_){
        double heights = (height+32.sp)/844.h;
        return DraggableScrollableSheet(
            initialChildSize: heights,
            snap: true,
            maxChildSize: 0.95,
            snapSizes: [heights, (heights+0.95)/2 ,0.95],
            builder:(_, scroll){
              return Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius??30.r),
                      topRight: Radius.circular(radius??30.r),
                    )
                ),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      controller: scroll,
                      child: Padding(
                        padding: 16.sp.padA,
                        child: noHeader? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 6.sp, 
                              width: 50.sp,
                              decoration: BoxDecoration(
                                color: stateColor8(isAppDark(context)),
                                borderRadius: BorderRadius.circular(5.r)
                              ),
                            )
                          ],
                        ): DrawerAppBar(
                          centerTitle: centerTitle,
                          title: title,
                          subTitle: subTitle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: child,
                    )
                  ],
                ),
              );
            }
        );
      }
  );
}
