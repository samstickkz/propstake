import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';

class AppLogger {
  static final _isRunningTests = Platform.environment.containsKey('FLUTTER_TEST');

  String get _logType => const String.fromEnvironment("LOG_TYPE");

  bool get _enabled {
    if (kReleaseMode) return false;
    if (_isRunningTests) return true;
    return true;
  }

  bool get enabledTrace {
    if (kReleaseMode) return false;
    if (_isRunningTests) return true;
    return (_logType == "TRACE");
  }

  void _log(String level, dynamic message) {
    if (_enabled) {
      log("$level: $message");
    }
  }

  AppLogger.debug(Object message) {
    _log('DEBUG', message);
  }

  AppLogger.error(dynamic exception, dynamic stackTrace) {
    if (exception == null) return;
    _log('ERROR', '$exception: $stackTrace');
  }
}
