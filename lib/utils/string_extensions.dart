import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:intl/intl.dart';

import '../data/services/local/navigation/navigation_service.dart';
import '../locator.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
const ext = 0;
final formatCurrency =
    NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');

//Formats the amount and returns a formatted amount
String formatPrice(String amount) {
  return formatCurrency.format(num.parse(amount)).toString();
}

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

extension StringExtension on String {
  String convertString() =>
      getString(locator<NavigationService>().navigatorKey.currentState!.context);
}

String convertListString(String string, {List<dynamic>? data}){
  data ??= [];
  return locator<NavigationService>().navigatorKey.currentState!.context.formatString(string, data);
}

extension StringCasingExtension on String {
  String? camelCase() => toBeginningOfSentenceCase(this);

  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  String? trimToken() => contains(":") ? split(":")[1].trim() : this;

  String? trimSpaces() => replaceAll(" ", "");
}

extension ImagePath on String {
  String get svg => 'assets/svg/$this.svg';

  String get png => 'assets/png/$this.png';

  String get jpg => 'assets/png/$this.jpg';
}

extension NumExtensions on int {
  num addPercentage(num v) => this + ((v / 100) * this);

  num getPercentage(num v) => ((v / 100) * this);
}


String trimPhone(String? phone) {
  if (phone![4] == "0") {
    List v = phone.split("").toList();
    v.removeAt(4);
    return v.join("").toString();
  } else {
    return phone;
  }
}

String transformPhoneNumber(String num) {
  if(num.isNotEmpty){
    // Check if the phone number starts with "+2340"
    if (num.startsWith("0")) {
      // Remove the "0" after "+234"
      return num.substring(1);
    }
  }
  // Return the original number if no transformation is needed
  return num;
}

String formatPhoneNumber(String phoneNumber) {
  // Remove the country code (assuming it's always +234 for Nigeria)
  String withoutCountryCode = phoneNumber.substring(4);

  // If the number starts with '0', remove it
  if (withoutCountryCode.startsWith('0')) {
    withoutCountryCode = withoutCountryCode.substring(1);
  }

  return "0$withoutCountryCode";
}


String formatNumber(double number, {int? decimalPlaces, bool? roundUp}) {
  if (decimalPlaces != null && decimalPlaces < 0) {
    throw ArgumentError("decimalPlaces cannot be negative");
  }

  if (decimalPlaces != null && decimalPlaces == 0) {
    return roundUp != null && roundUp ? number.ceil().toString() : number.floor().toString();
  }

  final formatter = NumberFormat.decimalPattern();

  if (decimalPlaces != null) {
    formatter.minimumFractionDigits = decimalPlaces;
    formatter.maximumFractionDigits = decimalPlaces;
  }

  return roundUp != null && roundUp
      ? formatter.format(number)
      : formatter.format(double.parse(number.toStringAsFixed(decimalPlaces ?? 0)));
}

class NumericTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Use a regular expression to remove non-numeric characters
    final filteredValue = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    return TextEditingValue(
      text: filteredValue,
      selection: TextSelection.collapsed(offset: filteredValue.length),
    );
  }
}
