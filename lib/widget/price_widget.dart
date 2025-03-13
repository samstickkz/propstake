import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:propstake/localization/locales.dart';
import 'package:propstake/utils/string_extensions.dart';

import '../app_theme/palette.dart';
import '../utils/widget_extensions.dart';

class PriceWidget extends StatelessWidget {
  final dynamic value;
  final double? size;
  final num? spaceSize;
  final Color? color;
  final String? family;
  final bool roundUp;
  final Currency currency;
  final bool isBold;
  final int decimalPlaces;
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
  final bool isHidden;
  final TextStyle? style;
  final double? letterSpacing;
  final Locale? locale;
  final TextDecoration? decoration;
  final bool usePrefixCurrency;
  final bool useSymbol;
  final bool? isNegative;
  const PriceWidget({
    super.key,
    this.value,
    this.size,
    this.color,
    this.roundUp = false,
    this.isHidden = false,
    this.family,
    this.isBold = false,
    this.weight,
    this.currency = Currency.dollar,
    this.decimalPlaces = 2,
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
    this.letterSpacing,
    this.usePrefixCurrency = true,
    this.useSymbol = true,
    this.isNegative
  });

  @override
  Widget build(BuildContext context) {


    double formattedValue = value == null
        ? 0.00
        : roundUp
        ? (value * (10 * decimalPlaces)).ceil() / (10 * decimalPlaces)
        : double.parse(value.toStringAsFixed(decimalPlaces));

    // Get currency symbol based on selected currency
    String currencySymbol = getCurrencySymbol(currency);
    String currencyText = getCurrencyText(currency);

    TextStyle? styles =  style ?? (isTitle? Theme.of(context).textTheme.titleLarge: isLabel?  Theme.of(context).textTheme.labelMedium: Theme.of(context).textTheme.bodyMedium)?.copyWith(
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
          // Currency Symbol Prefix
          if (isNegative!=null)
            TextSpan(
              text: isNegative==true? "- ": "+ ",
              style: styles,
            ),
          if (useSymbol && usePrefixCurrency)
            TextSpan(
              text: currencySymbol,
              style: styles?.copyWith(
                fontFamily: currency == Currency.naira? "Inter" : null
              ),
            ),
          if (!useSymbol && usePrefixCurrency)
            TextSpan(
              text: currencyText,
              style: styles,
            ),

          // Formatted Value
          TextSpan(
            text: usePrefixCurrency
                ? " ${isHidden ? "*****" : formatValue(formattedValue, roundUp: roundUp, decimalPlaces: decimalPlaces) }"
                : "${isHidden ? "*****" : formatValue(formattedValue, roundUp: roundUp, decimalPlaces: decimalPlaces)} ",
            style: styles,
          ),

          // Currency Symbol Suffix
          if (useSymbol && !usePrefixCurrency)
            TextSpan(
              text: currencySymbol,
              style: styles,
            ),
          if (!useSymbol && !usePrefixCurrency)
            TextSpan(
              text: currencyText,
              style: styles,
            ),
        ],
      ),
      textAlign: align ?? TextAlign.start,
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
    default:
      return '';
  }
}

String getCurrencyText(Currency currency) {
  switch (currency) {
    case Currency.dollar:
      return LocaleData.usd.convertString();
    case Currency.naira:
      return LocaleData.ngn.convertString();
    case Currency.euro:
      return LocaleData.eur.convertString();
    case Currency.pounds:
      return LocaleData.gbp.convertString();
    case Currency.yen:
      return LocaleData.yuan.convertString();
    default:
      return LocaleData.usd.convertString();
  }
}

String formatValue(num? value, {bool roundUp = false, int decimalPlaces = 2}) {
  if (value == null) {
    return "0";
  }

  num processedValue = roundUp
      ? value.ceil() // Round UP to the nearest whole number
      : double.parse(value.toStringAsFixed(decimalPlaces)); // Keep decimals if needed

  // Use `intl.NumberFormat` to format the number with commas
  final formatter = NumberFormat("#,##0${roundUp ? '' : '.' + '0' * decimalPlaces}");

  return formatter.format(processedValue);
}
