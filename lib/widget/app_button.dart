import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:propstake/utils/widget_extensions.dart';
import 'package:propstake/widget/svg_builder.dart';


import '../app_theme/palette.dart';
import 'apptexts.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool transparent;
  final bool gradient;
  final bool isOutline;
  final bool isTransparent;
  final bool useSecondaryColor;
  final bool noFixHeight;
  final double? borderWidth;
  final String? svgImage;
  final String? pngImage;
  final double? height;
  final double? widths;
  final double? borderRadius;
  final double? textSize;
  final double? iconSize;
  final Color? borderColor;
  final Color? backGroundColor;
  final Color? textColor;
  final String? text;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final FontWeight? fontWeight;
  final double? buttonSpacing;
  final bool isLoading;
  final bool isExpanded;

  const AppButton({
    super.key,
    this.onTap,
    this.transparent = false,
    this.gradient = true,
    required this.isLoading,
    this.child,
    this.widths,
    this.borderWidth,
    this.borderColor,
    this.textColor,
    this.backGroundColor,
    this.text,
    this.borderRadius,
    this.padding,
    this.height,
    this.textSize,
    this.isExpanded = true,
    this.isOutline = false,
    this.buttonSpacing,
    this.noFixHeight = false,
    this.isTransparent = false,
    this.useSecondaryColor = false,
    this.fontWeight,
    this.svgImage, 
    this.pngImage,
    this.iconSize,
  });

  /// Factory constructors for different styles
  factory AppButton.small({
    VoidCallback? onTap,
    String? text,
    bool isLoading = false,
    Color? color,
    double? height,
    String? pngImage,
    double? textSize,
    bool useSecondaryColor = false,
    double? borderWith,
    Color? borderColor,
    Widget? child,
    Color? textColor,
    String? svgImage,
  }) {
    return AppButton(
      onTap: onTap,
      text: text,
      textColor: textColor,
      height: height ?? 48.0.sp,
      borderRadius: 20.0.sp,
      isLoading: isLoading,
      backGroundColor: color,
      borderWidth: borderWith?? (borderColor != null? 0.5.sp : 0.0),
      useSecondaryColor: useSecondaryColor,
      borderColor: borderColor,
      gradient: false,
      padding: 16.sp.padH,
      textSize: textSize?? 12.0,
      pngImage: pngImage,
      svgImage: svgImage,
      child: child,
    );
  }

  factory AppButton.outline({
    VoidCallback? onTap,
    String? text,
    String? pngImage,
    Widget? child,
    Color? textColor,
    double? textSize,
    String? svgImage,
    double? heights,
    bool isLoading = false,
    bool isFullWidth = true,
    Color? borderColor,
  }) {
    return AppButton(
      onTap: onTap,
      text: text,
      isLoading: isLoading,
      isOutline: true,
      textSize: textSize,
      widths: isFullWidth? double.maxFinite: null,
      height: heights?? (isFullWidth? 52.sp : 48.sp),
      borderColor: borderColor,
      textColor: textColor,
      gradient: false,
      pngImage: pngImage,
      svgImage: svgImage,
      child: child,
      // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
    );
  }

  factory AppButton.transparent({
    VoidCallback? onTap,
    String? text,
    double? heights,
    bool isLoading = false,
    bool isFullWidth = true,
    Color? borderColor,
    String? pngImage,
    double? textSize,
    Widget? child,
    Color? textColor,
    String? svgImage,
  }) {
    return AppButton(
      onTap: onTap,
      text: text,
      isLoading: isLoading,
      isTransparent: true,
      widths: isFullWidth? double.maxFinite: null,
      height: heights?? (isFullWidth? 52.sp : 48.sp),
      borderColor: borderColor,
      textColor: textColor,
      gradient: false,
      textSize: textSize,
      pngImage: pngImage,
      svgImage: svgImage,
      child: child,
      // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
    );
  }

  factory AppButton.fullWidth({
    VoidCallback? onTap,
    String? text,
    required bool isLoading,
    bool useSecondaryColor = false,
    Color? backgroundColor,
    Color? textColor,
    String? pngImage,
    String? svgImage,
    double? borderWith,
    FontWeight? fontWeight,
    double? height,
    Color? borderColor,
    double? textSize
  }) {
    return AppButton(
      onTap: onTap,
      text: text,
      isLoading: isLoading,
      height: height?? 52.sp,
      pngImage: pngImage,
      svgImage: svgImage,
      fontWeight: fontWeight,
      textColor: textColor,
      textSize: textSize,
      widths: double.maxFinite,
      borderWidth: borderWith?? (borderColor != null? 1.sp : 0.0),
      useSecondaryColor: useSecondaryColor,
      borderColor: borderColor,
      borderRadius: 32.r,
      backGroundColor: backgroundColor,
      gradient: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = backGroundColor ??(useSecondaryColor? Theme.of(context).colorScheme.secondary: stateColor12(isDark: isAppDark()));
    final Color disabledBackgroundColor = backgroundColor.withOpacity(0.5);
    final Color borderClr =  borderColor ?? borderAppColor;
    final Color disabledBorderColor = borderClr.withOpacity(0.4);
    // final Color textColors = textColor ?? ( backgroundColor == Theme.of(context).colorScheme.secondary || backgroundColor ==  stateColor2(isAppDark(context))? black(isAppDark(context)): (backgroundColor == stateColor12(isAppDark(context))? Theme.of(context).cardColor: Theme.of(context).unselectedWidgetColor));
    final Color textColors = textColor ?? (backgroundColor == stateColor4(isDark: isAppDark()) || backgroundColor == stateColor2(isDark: isAppDark())? black(isDark: isAppDark()): white());
    final Color loadingTextColor = Colors.white.withOpacity(0.6);

    return isOutline || isTransparent? OutlinedButton(
        onPressed: isLoading ? null : onTap == null? null : (){
          FocusManager.instance.primaryFocus!.unfocus();
          onTap!();
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: onTap != null? borderClr : disabledBorderColor,
          side: isTransparent? BorderSide.none: BorderSide(
              color: onTap != null? borderClr : disabledBorderColor,
              width: 1.sp
          ),
          fixedSize: (isExpanded && widths == null && height == null) ? null : Size(widths ?? double.infinity, height ?? 52.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 32.r),
          ),
        ),
        child: isLoading? SpinKitDualRing(
          color: borderClr,
          size: 26.sp,
        ):  child ?? (
          svgImage!=null || pngImage!=null? IntrinsicWidth(
            child: Row(
              children: [
                if(svgImage!=null)...[
                  Opacity(
                    opacity: onTap == null? 0.5: 1,
                    child: SvgBuilder(
                      svgImage!,
                      size: iconSize ?? 20.sp,
                    ),
                  ),
                ] else ...[
                  Opacity(
                    opacity: onTap == null? 0.5: 1,
                    child: ImageBuilder(
                      pngImage!,
                      size: iconSize ?? 20.sp,
                    ),
                  ),
                ],
                8.sp.sbW,
                AppText(
                  text??"",
                  color: onTap != null? (textColor != null? textColors:  borderClr) : (textColor != null? loadingTextColor: disabledBorderColor),
                  weight: fontWeight?? FontWeight.w700,
                  size: textSize?? 16.sp,
                  align: TextAlign.center,
                )
              ],
            ),
          ):
            AppText(
          text??"",
          color: onTap != null? (textColor != null? textColors:  borderClr) : (textColor != null? loadingTextColor: disabledBorderColor),
          weight: fontWeight?? FontWeight.w700,
          size: textSize?? 16.sp,
          align: TextAlign.center,
        ))
    ):


      ElevatedButton(
      onPressed: isLoading ? null : onTap == null? null : (){
        FocusManager.instance.primaryFocus!.unfocus();
        onTap!();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: onTap == null ? disabledBackgroundColor : backgroundColor,
        shadowColor: Colors.transparent,
        padding: padding,
        elevation: 0.sp,
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(borderRadius ?? 32.r),
          side: transparent? BorderSide.none:  BorderSide(
            color: borderColor ?? (isOutline ? (borderClr) : Colors.transparent),
            width: borderWidth ?? 1.5.sp,
          ),
        ),
        fixedSize: (isExpanded && widths == null && height == null) ? null : Size(widths ?? double.infinity, height ?? 52.sp),
      ),
      child: isLoading? SpinKitDualRing(
        color: textColors,
        size: 26.sp,
      ) :  child ?? (
          svgImage!=null || pngImage!=null? IntrinsicWidth(
            child: Row(
              children: [
                if(svgImage!=null)...[
                  Opacity(
                    opacity: onTap == null? 0.5: 1,
                    child: SvgBuilder(
                      svgImage!,
                      size: iconSize ?? 20.sp,
                    ),
                  ),
                ] else ...[
                  Opacity(
                    opacity: onTap == null? 0.5: 1,
                    child: ImageBuilder(
                      pngImage!,
                      size: iconSize ?? 20.sp,
                    ),
                  ),
                ],
                8.sp.sbW,
                AppText(
                  text??"",
                  color: onTap != null? textColors : loadingTextColor,
                  weight: fontWeight?? FontWeight.w700,
                  size: textSize?? 16.sp,
                  align: TextAlign.center,
                )
              ],
            ),
          ):
          AppText(
            text??"",
            color:  onTap != null? textColors : loadingTextColor,
            weight: fontWeight?? FontWeight.w700,
            size: textSize?? 16.sp,
            align: TextAlign.center,
          ))
    );


  }
}
