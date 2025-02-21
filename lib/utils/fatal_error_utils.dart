import 'package:flutter/material.dart';

bool isFatalError(FlutterErrorDetails errorDetails) {
  if (errorDetails.exceptionAsString().contains('Fatal')) {
    return true;
  }
  return false;
}
