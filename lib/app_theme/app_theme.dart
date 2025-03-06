import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants.dart';
import '../utils/widget_extensions.dart';
import 'palette.dart';

class AppTheme {


  static ThemeData themeData(bool isDark) {
    return ThemeData(
      fontFamily: 'satoshi',
      primaryColor: primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      unselectedWidgetColor: white(isDark),
      colorScheme: ColorScheme(
        primary: primaryColor,
        secondary: iris9(isDark),
        surface: white(isDark),
        error: red9(isDark),
        onPrimary: black(isDark),
        onSecondary: black(isDark),
        onSurface: black(isDark),
        onError: white(isDark),
        brightness: isDark? Brightness.dark : Brightness.light,

        background: gray2(isDark),
        onBackground: black(isDark),
      ),
      // ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
      //   secondary: iris9(isDark),
      //   primary:  grass9(isDark)
      // ),

      splashColor: stateColor6(isDark),
      highlightColor: stateColor3(isDark),

      disabledColor: Colors.grey,
      iconTheme: IconThemeData(
          color: stateColor11(isDark)
      ),
      dividerTheme: DividerThemeData(
          color: stateColor3(isDark),
          thickness: 1.5.h
      ),

      /// TEXT THEME
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: gray11(isDark),
          fontSize: 14.68.sp,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: TextStyle(
          color: gray11(isDark),
          fontSize: 13.33.sp,
          fontWeight: FontWeight.normal,
        ),
        bodyLarge: TextStyle(
          color: gray11(isDark),
          fontSize: 16.sp,
        ),
        titleLarge: TextStyle(
            fontSize: 19.20.sp,
            fontWeight: FontWeight.w700,
            color: black(isDark)
        ),
        labelMedium: TextStyle(
            fontSize: 14.68.sp,
            fontWeight: FontWeight.normal,
            color: gray10(isDark)
        ),
        labelSmall: TextStyle(
            fontSize: 14.68.sp,
            fontWeight: FontWeight.normal,
            color: gray9(isDark)
        ),

      ),

      /// INPUT THEME
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
        isDense: true,

        hintStyle: TextStyle(
          color: stateColor10(isDark),
          fontSize: 13.sp,
          fontWeight: FontWeight.normal,
        ),
        labelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: stateColor10(isDark)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderAppColor, width: 1.sp),
            borderRadius: BorderRadius.circular(8.r)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.sp, color: gray6(isDark)),
            borderRadius: BorderRadius.circular(8.r)
        ),
        errorBorder:OutlineInputBorder(
            borderSide: BorderSide(width: 1.sp, color:  red9(isDark)),
            borderRadius: BorderRadius.circular(8.r)
        ),
        errorStyle: TextStyle(
          color: red9(isDark),
          fontSize: 13.33.sp,
          fontWeight: FontWeight.w500,
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.sp, color:  Colors.transparent),
            borderRadius: BorderRadius.circular(8.r)
        ),
        focusedErrorBorder:OutlineInputBorder(
            borderSide: BorderSide(width: 1.sp, color:  borderAppColor),
            borderRadius: BorderRadius.circular(8.r)
        ),
        filled: true,
        fillColor: Colors.transparent,
      ),


      cardColor: white(isDark),
      canvasColor: stateColor1(isDark),
      appBarTheme:  AppBarTheme(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        systemOverlayStyle: isDark == true? SystemUiOverlayStyle.light: SystemUiOverlayStyle.dark,
        foregroundColor: stateColor12(isDark),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: stateColor12(isDark)),
        titleTextStyle: TextStyle(
          fontSize: 19.20.sp,
          fontWeight: FontWeight.w700,
          color: stateColor12(isDark),
        ),
      ),
      scaffoldBackgroundColor: stateColor1(isDark),
      shadowColor: Colors.grey,
    );

  }
}

InputDecoration appInputDecorator({
  EdgeInsetsGeometry? contentPadding,
  bool? isDense,
  TextStyle? hintStyle,
  TextStyle? labelStyle,
  InputBorder? focusedBorder,
  InputBorder? enabledBorder,
  InputBorder? errorBorder,
  TextStyle? errorStyle,
  InputBorder? disabledBorder,
  InputBorder? focusedErrorBorder,
  bool? filled,
  Color? fillColor,
}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 14.sp),
    isDense: true,
    hintStyle: TextStyle(
      color: gray10(isAppDark(navigationService.context)),
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
    ),
    labelStyle: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.normal,
        color: gray10(isAppDark(navigationService.context))
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderAppColor, width: 1.sp),
        borderRadius: BorderRadius.circular(8.r)
    ),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.sp, color: green6(isAppDark(navigationService.context))),
        borderRadius: BorderRadius.circular(8.r)
    ),
    errorBorder:OutlineInputBorder(
        borderSide: BorderSide(width: 1.sp, color:  red10(isAppDark(navigationService.context))),
        borderRadius: BorderRadius.circular(8.r)
    ),
    errorStyle: TextStyle(
      color: red12(isAppDark(navigationService.context)),
      fontSize: 13.33.sp,
      fontWeight: FontWeight.w500,
    ),
    disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.sp, color:  red10(isAppDark(navigationService.context))),
        borderRadius: BorderRadius.circular(8.r)
    ),
    focusedErrorBorder:OutlineInputBorder(
        borderSide: BorderSide(width: 1.sp, color: borderAppColor),
        borderRadius: BorderRadius.circular(8.r)
    ),
    filled: true,
    fillColor: stateColor3(isAppDark(navigationService.context)),
  );
}

