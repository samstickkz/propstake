import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/constants.dart';
import '../../cache/database_keys.dart';

enum ThemeModeOption { light, dark, system }

class ThemeModel extends ChangeNotifier {
  ThemeModeOption _themeModeOption = ThemeModeOption.system;
  ThemeModeOption get themeModeOption => _themeModeOption;

  ThemeModel() {
    getPreferences();
  }

  Future<void> changeTheme(ThemeModeOption mode) async {
    _themeModeOption = mode;
    setThemePreferences(_themeModeOption);
    _applySystemOverlayStyle();
    notifyListeners();
  }

  Future<void> getPreferences() async {
    final storedMode = await storageService.readItem(key: StorageKey.isDarkModeKey);
    _themeModeOption = storedMode != null
        ? ThemeModeOption.values[storedMode]
        : ThemeModeOption.system;
    _applySystemOverlayStyle();
    notifyListeners();
  }

  void setThemePreferences(ThemeModeOption mode) async {
    await storageService.storeItem(key: StorageKey.isDarkModeKey, value: mode.index);
    _applySystemOverlayStyle();
  }

  ThemeMode get themeMode {
    switch (_themeModeOption) {
      case ThemeModeOption.light:
        return ThemeMode.light;
      case ThemeModeOption.dark:
        return ThemeMode.dark;
      case ThemeModeOption.system:
      default:
        return ThemeMode.system;
    }
  }

  void _applySystemOverlayStyle() {
    if (_themeModeOption == ThemeModeOption.dark ||
        (_themeModeOption == ThemeModeOption.system && WidgetsBinding.instance.window.platformBrightness == Brightness.dark)) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
  }

  // New getter to check if the theme is dark
  bool get isDark {
    if (_themeModeOption == ThemeModeOption.dark) {
      return true;
    } else if (_themeModeOption == ThemeModeOption.light) {
      return false;
    } else {
      // For system mode, return true if system brightness is dark
      return WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    }
  }
}
