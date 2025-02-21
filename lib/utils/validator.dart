import 'package:flutter/services.dart';

import 'string_extensions.dart';

const emailRegex = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regEx = RegExp(r"(?=.*[a-z])(?=.*[0-9])\w+");

String? Function(String?)? emailValidator = (String? val) {
  String validate = val!.replaceAll(RegExp(r"\s+"), "");
  if (validate.isEmpty ||
      !RegExp(emailRegex).hasMatch(validate)) {
    return 'Enter valid email';
  }
  return null; // Return null for valid input
};

String? Function(String?)? passwordValidator = (String? val) {
  String value = val??"";
  RegExp regex = RegExp(r'[A-Z]');
  RegExp smallRegex = RegExp(r"[a-z]");
  RegExp numberRegex = RegExp(r'\d');
  RegExp signRegex = RegExp(r'[!@#$%^&*(),\-_.?":;{}|<>]');
  if (!regex.hasMatch(value)){
    return "Password should contain CAPITAL leters";
  } else if (!smallRegex.hasMatch(value)){
    return "Password should contain alphabets";
  } else if (!numberRegex.hasMatch(value)){
    return "Password should contain special Numbers (0123...89)";
  } else if (!signRegex.hasMatch(value)){
    return "Password should contain special character (%#\$*_-)";
  } else if (value.length < 7) {
    return "Password should contain at least 8 characters";
  }
    return null;
};

String? Function(String?)? emptyValidator = (String? val) {
  String value = val??"";
  if(value.trim().isEmpty){
    return "This field cannot be empty";
  }
  return null;
};

bool validateFullName(String input) {
  // Regular expression pattern
  RegExp regex = RegExp(r'^[A-Za-z]{2,}(?:\s[A-Za-z]{2,})+$');

  // Test the input against the pattern
  return regex.hasMatch(input);
}

bool validateName(String input) {
  // Regular expression pattern
  RegExp regex = RegExp(r"^[A-Z][a-zA-Z'_-]+$");
  // Test the input against the pattern
  return regex.hasMatch(input);
}

bool isEightDigitPhoneNumber(String input) {
  final RegExp regex = RegExp(r'^\d{11}$');
  return regex.hasMatch(input);
}

bool isValidIpAddress(String ip) {
  // Regular expression to match IPv4 address format
  final regex = RegExp(r'^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'
  r'\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'
  r'\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)'
  r'\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$');

  return regex.hasMatch(ip);
}


String? validatePhoneNumber(String? value) {
  if (!isEightDigitPhoneNumber(value!)) {
    return 'Please enter a valid 8-digit phone number';
  }
  return null; // Input is valid
}

String? fullNameValidator(String? value) {
  if(value==null){
    return "Full name cannot be empty";
  }else if(!validateFullName(value)){
    return "Full Name not Valid";
  }
  return null;
}

String? nameValidator(String? value) {
  if(value==null){
    return "Full name cannot be empty";
  }else if(validateName(value)){
    return "Name not Valid";
  }
  return null;
}

String? cvvValidator(String? value) {
  // Check if the value is null or empty
  if (value == null || value.isEmpty) {
    return 'CVV is required';
  }

  // Check if the CVV length is exactly 3 digits
  if (value.length != 3) {
    return 'CVV must be exactly 3 digits';
  }

  // Validation passed
  return null;
}

String? expiryDateValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Expiry date is required';
  }

  // Check if the format matches MM/YY
  final RegExp expiryRegex = RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$');
  if (!expiryRegex.hasMatch(value)) {
    return 'Invalid format. Use MM/YY';
  }

  // Split into month and year
  final parts = value.split('/');
  final month = int.parse(parts[0]);
  final year = int.parse(parts[1]);

  // Get the current month and year
  final now = DateTime.now();
  final currentYear = now.year % 100; // Get last two digits of the current year
  final currentMonth = now.month;

  // Validate expiration date
  if (year < currentYear || (year == currentYear && month < currentMonth)) {
    return 'Card has expired';
  }

  return null; // Valid expiry date
}

String? numberValidator(String? value, {num? min, int? max}) {
  if (value == null || value.isEmpty) {
    return 'Please enter a number';
  }

  // Convert input to integer
  final number = num.tryParse(value);
  if (number == null) {
    return 'Please enter a valid number';
  }

  // Optional: Check range if provided
  if (min != null && number < min) {
    return 'Number should be at least $min';
  }
  if (max != null && number > max) {
    return 'Number should not exceed $max';
  }

  return null; // Return null if the input is valid
}

class UsernameInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Prevent the username from starting with '@'
    if (newValue.text.startsWith('@')) {
      return oldValue; // Keep the old value if new value starts with '@'
    }
    return newValue; // Return the new value if it passes the checks
  }
}

class IpAddressInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final text = newValue.text;

    // Prevent any non-numeric or non-period characters
    if (!RegExp(r'^[0-9.]*$').hasMatch(text)) {
      return oldValue;
    }

    // Ensure IP address format (each block between periods is max 3 digits, and max 4 blocks)
    final blocks = text.split('.');
    for (var block in blocks) {
      if (block.length > 3) {
        return oldValue;
      }
      if (int.tryParse(block) != null && int.parse(block) > 255) {
        return oldValue;
      }
    }

    if (blocks.length > 4) {
      return oldValue;
    }

    return newValue;
  }
}