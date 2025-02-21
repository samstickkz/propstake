import 'package:flutter/services.dart';

class CreditCardFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any existing spaces
    String newText = newValue.text.replaceAll(RegExp(r'\s+'), '');

    // Add spaces after every 4 digits
    String formattedText = '';
    for (int i = 0; i < newText.length; i++) {
      if (i % 4 == 0 && i != 0) formattedText += ' ';
      formattedText += newText[i];
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}


class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any non-digit or '/' characters
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9/]'), '');

    // Handle deletion of the '/' character
    if (oldValue.text.length > newValue.text.length && oldValue.text.contains('/') && !newText.contains('/')) {
      newText = newText.substring(0, newText.length - 1); // Remove last character if '/' is deleted
    }

    // Validate the month portion (should be 01-12)
    if (newText.length >= 2) {
      int? month = int.tryParse(newText.substring(0, 2));
      if (month == null || month < 1 || month > 12) {
        return oldValue; // Revert to the previous value if the month is invalid
      }
    }

    // Automatically insert '/' after the month, but only if the user hasn’t entered it manually
    if (newText.length == 2 && !newText.contains('/')) {
      newText += '/';
    } else if (newText.length > 5) {
      // Limit to MM/YY format
      newText = newText.substring(0, 5);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}


class CVVFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any non-digit characters
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Limit length to 4 digits
    if (newText.length > 3) {
      newText = newText.substring(0, 3);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}


