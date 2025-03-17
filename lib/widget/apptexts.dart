import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:propstake/app_theme/palette.dart';
import 'package:propstake/utils/widget_extensions.dart';

class AppText extends Text {
  final String text;
  final Color? color;
  final TextOverflow? overflow;
  final VoidCallback? onTap;
  final double? size;
  final double? height;
  final int? maxLine;
  final String? family;
  final bool? isBold;
  final FontStyle fontStyle;
  final bool? isHeader;
  final bool isLabel;
  final bool isTitle;
  final TextStyle? style;
  final double? letterSpacing;
  final Locale? locale;
  final FontWeight? weight;
  final TextDecoration? decoration;
  final TextAlign? align;

  const AppText(
      this.text,
      {super.key,
      this.color,
      this.overflow,
      this.size,
      this.weight,
      this.onTap,
      this.align,
      this.maxLine,
      this.locale,
      this.height,
      this.family,
      this.style,
      this.isBold,
      this.isHeader,
      this.isLabel = false,
      this.decoration,
      this.fontStyle = FontStyle.normal,
      this.isTitle = false,
      this.letterSpacing
    }) : super(text);

  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: style ?? (isTitle? Theme.of(context).textTheme.titleLarge: isLabel?  Theme.of(context).textTheme.labelMedium: Theme.of(context).textTheme.bodyMedium)?.copyWith(
          fontSize: size,
          height: height,
          decoration: decoration,
          letterSpacing: letterSpacing,
          decorationColor: stateColor11(isAppDark(context)),
          decorationThickness: 0.5,
          fontFamily: family,
          color: color,
          // fontFamily: family,
          overflow: overflow,
          fontStyle: fontStyle,
          fontWeight: weight ?? (isBold == true ? FontWeight.w700 : null)
        ),
        textAlign: align ?? TextAlign.start,
        selectionColor: Colors.grey.withOpacity(0.5),
        maxLines: maxLine,
      ),
    );
  }
}
