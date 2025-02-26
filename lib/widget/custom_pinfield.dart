import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../app_theme/palette.dart';
import '../utils/widget_extensions.dart';
import 'apptexts.dart';

class CustomPinTextField extends StatelessWidget {
  const CustomPinTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onDone,
    this.hintText,
    this.textInputAction,
    this.textInputType,
    this.textAlign,
    this.onChanged,
    this.controller,
    this.readOnly,
    thiscureText = false,
    thiscuringCharacter,
    this.maxLines = 1,
    this.onTap,
    this.autoFocus = true,
    this.focusNode,
    this.maxLength = 6,
    this.title,
    this.forceErrorState = false,
    this.obscureText = false,
    this.obscuringCharacter,
    this.errorBuilder,
  });
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onDone;
  final Widget Function(String?, String)? errorBuilder;
  final String? hintText;
  final String? title;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final Function(String)? onChanged;
  final Function()? onTap;
  final TextEditingController? controller;
  final int maxLines;
  final int maxLength;
  final bool? readOnly;
  final bool obscureText;
  final bool autoFocus;
  final FocusNode? focusNode;
  final String? obscuringCharacter;
  final bool forceErrorState;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    bool isDark = Theme.of(context).primaryColor == const Color(0xFFEDF0F0);
    return Column(

      children: [
        if (title != null)...[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(
                title ?? "",
                size:  16.sp,
                align: TextAlign.start,
                weight: FontWeight.w500,
                color: stateColor12(isDark: isAppDark(context)),
              ),
            ],
          ),
          10.sp.sbH,
        ],
        Pinput(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          defaultPinTheme: PinTheme(
            height: 52.h,
            width: 49.w,
            constraints: BoxConstraints(
              minHeight: 7.h,
              minWidth: 12.w,
            ),
            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: stateColor10(isDark: isDark),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: stateColor7(isDark: isDark),
                width: 1.sp,
              ),
            ),
          ),
          errorBuilder: errorBuilder,
          submittedPinTheme: PinTheme(
            height: 52.h,
            width: 49.w,
            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: stateColor11(isDark: isDark),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: stateColor3(isDark: isDark),
              border: Border.all(
                color: const Color(0xFF3E63DD),
                width: 1.sp,
              ),
            ),
          ),
          errorPinTheme: PinTheme(
            height: 52.h,
            width: 49.w,
            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: red9(isDark: isDark),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: stateColor3(isDark: isDark),
              border: Border.all(
                color: red9(isDark: isDark),
                width: 1.sp,
              ),
            ),
          ),
          length: maxLength,
          onSubmitted: onDone,
          onCompleted: onDone,
          onChanged: onChanged,
          obscuringCharacter: '●',
          autofocus: autoFocus,
          controller: controller,
          keyboardType: textInputType ?? TextInputType.phone,
          errorTextStyle: TextStyle(
            color: themeData.colorScheme.error,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          forceErrorState: forceErrorState,
          validator: validator,
        ),
      ],
    );
  }
}
