import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_theme/palette.dart';
import '../utils/widget_extensions.dart';
import 'app_button.dart';
import 'apptexts.dart';

class ActionBottomSheet extends StatelessWidget {
  final String? title;
  final Widget? body;
  final String? subTitle;
  final bool useGradient;
  final bool oneButton;
  final Color? confirmButtonColor;
  final double? width;
  final String? cancelButtonText;
  final String? doItButtonText;
  final VoidCallback? otherOnTap;
  final Widget? prefixIcon1;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Widget? prefixIcon2;
  final VoidCallback? onTap;
  final VoidCallback? cancelTap;
  const ActionBottomSheet({
    super.key,
    required this.title,
    required this.onTap,
    this.cancelTap,
    this.subTitle,
    this.cancelButtonText,
    this.doItButtonText,
    this.prefixIcon1,
    this.prefixIcon2,
    this.otherOnTap,
    this.body,
    this.child,
    this.confirmButtonColor,
    this.useGradient = false,
    this.oneButton = false,
    this.padding, this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Navigator.of(context).pop,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: (){},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.sp),
                child: Container(
                  width: width?? 250.sp,
                  decoration: BoxDecoration(
                    color: useGradient? null : white(isAppDark(context)),
                    border: Border.all(
                      width: 2.sp,
                      color: Theme.of(context).cardColor
                    ),
                    gradient: !useGradient? null:  LinearGradient(
                      colors: [
                        isAppDark(context)?
                        const Color(0xFFE4F1FC):
                        const Color(0xFF303235),
                        Theme.of(context).cardColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(16.sp)
                  ),
                  padding: padding?? 16.0.padA,
                  child: child?? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      body??
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.sp.sbH,
                          AppText(title??"", size: 20.sp, weight: FontWeight.w600, isTitle: true, align: TextAlign.start,),
                          10.sp.sbH,
                          AppText(subTitle??"Are you sure you want to ${(title??"").toLowerCase()}?", isHeader: true, size: 14.sp, align: TextAlign.start, weight: FontWeight.w400,),
                          40.sp.sbH
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if(!oneButton)...[
                            Expanded(
                              child: AppButton.fullWidth(
                                isLoading: false,
                                height: 48.sp,
                                backgroundColor: stateColor3(isAppDark(context)),
                                fontWeight: FontWeight.w600,
                                textColor: stateColor12(isAppDark(context)),
                                text: cancelButtonText?? "Cancel",
                                onTap: (){
                                  Navigator.of(context).pop();
                                  cancelTap ==null? null: cancelTap!();
                                },
                                borderColor: stateColor4(isAppDark(context)),
                              ),
                            )
                          ],
                          10.0.sbW,
                          Expanded(
                            child: AppButton.fullWidth(
                              isLoading: false,
                              fontWeight: FontWeight.w600,
                              text: doItButtonText?? "Continue",
                              onTap: ()async{
                                Navigator.of(context).pop();
                                onTap ==null? null: onTap!();
                              },
                              height: 48.sp,
                            ),
                          ),
                        ],
                      ),
                      10.sp.sbH,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}