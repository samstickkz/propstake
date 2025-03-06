import 'package:flutter/material.dart';

import '../app_theme/palette.dart';
import '../utils/widget_extensions.dart';

class PriceWidget extends StatelessWidget {
  final dynamic value;
  final double? size;
  final num? spaceSize;
  final Color? color;
  final String? family;
  final bool? roundUp;
  final Currency currency;
  final bool isBold;
  final int? decimalPlaces;
  final TextAlign? align ;
  final double? iconSize;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final double? height;
  final int? maxLine;
  final FontStyle fontStyle;
  final bool? isHeader;
  final bool isLabel;
  final bool isTitle;
  final TextStyle? style;
  final double? letterSpacing;
  final Locale? locale;
  final TextDecoration? decoration;
  const PriceWidget({
    super.key,
    this.value,
    this.size,
    this.color,
    this.roundUp,
    this.family,
    this.isBold = false,
    this.weight,
    this.currency = Currency.dollar,
    this.decimalPlaces,
    this.iconSize,
    this.spaceSize,
    this.align,
    this.overflow,
    this.maxLine,
    this.locale,
    this.height,
    this.style,
    this.isHeader,
    this.isLabel = false,
    this.decoration,
    this.fontStyle = FontStyle.normal,
    this.isTitle = false,
    this.letterSpacing
  });

  @override
  Widget build(BuildContext context) {


    num values = value == null? 0: value is int? 0: num.tryParse(value)??0;

    // Format value to 2 decimal places or round up if specified
    String formattedValue = roundUp == true? (double.tryParse(values.toStringAsFixed(2)) ?? 0.00).floor().toString(): (double.tryParse(values.toStringAsFixed(2)) ?? 0.00).toStringAsFixed(decimalPlaces ?? 2);

    // Get currency symbol based on selected currency
    String currencySymbol = getCurrencySymbol(currency);

    TextStyle? textStyle =  style ?? (isTitle? Theme.of(context).textTheme.titleLarge: isLabel?  Theme.of(context).textTheme.labelMedium: Theme.of(context).textTheme.bodyMedium)?.copyWith(
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
    );

    return RichText(
      text: TextSpan(
        children: [
          // Currency Symbol
          TextSpan(
            text: currencySymbol,
            style: textStyle?.copyWith(
              fontSize: iconSize
            ),
          ),
          // Formatted Value
          TextSpan(
            text: formattedValue,
            style: textStyle,
          ),
        ],
      ),
      textAlign: align?? TextAlign.start,
    );
  }
}

enum Currency {dollar, naira, euro, pounds, yen, rupees}

String getCurrencySymbol(Currency currency) {
  switch (currency) {
    case Currency.dollar:
      return '\$';
    case Currency.naira:
      return '₦';
    case Currency.euro:
      return '€';
    case Currency.pounds:
      return '£';
    case Currency.yen:
      return '¥';
    case Currency.rupees:
      return '₹';
    default:
      return '';
  }
}