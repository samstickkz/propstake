import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_storage/get_storage.dart';

import '../../../localization/locales.dart';
import '../../cache/database_keys.dart';


class LocaleService {
  // Fields
  Locale? initLocale; // For storing the initialized locale
  late FlutterLocalization localization; // Localization instance
  late GetStorage box; // Storage for persistent data
  String language = "en"; // Default language code
  List<String> supportedLanguages = []; // List of supported languages

  final StreamController<String> _languageController = StreamController.broadcast();

  /// Stream to listen to language changes
  Stream<String> get languageStream => _languageController.stream;

  /// Initialize LocaleService
  Future<void> init() async {
    box = GetStorage();
    localization = FlutterLocalization.instance;

    // Set up initial locale and supported languages
    await _initializeSupportedLanguages();
    await _initializeLocale();
  }

  /// Save a new locale and update the app's language
  Future<void> saveLocale(String newLanguage) async {
    language = newLanguage;
    await box.write(StorageKey.languageCode, newLanguage);
    localization.translate(language); // Update localization
    _languageController.add(language); // Notify listeners of language change
  }

  /// Get the current locale
  Future<void> getLocale() async {
    language = box.read(StorageKey.languageCode) ?? "en"; // Default to "en"
    localization.translate(language); // Update localization instance
    _languageController.add(language); // Notify listeners of language change
  }

  /// Initialize locale during startup
  Future<void> _initializeLocale() async {
    language = box.read(StorageKey.languageCode) ?? "en"; // Default to "en"
    initLocale = Locale(language); // Set the initial locale
    localization.init(mapLocales: locales, initLanguageCode: language);
    _languageController.add(language); // Notify listeners of initial language
  }

  /// Initialize supported languages
  Future<void> _initializeSupportedLanguages() async {
    supportedLanguages = locales.map((locale) => locale.languageCode).toList();
  }

  /// Dispose the StreamController
  void dispose() {
    _languageController.close();
  }
}
