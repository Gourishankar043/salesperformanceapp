
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleController extends ChangeNotifier {
  LocaleController._();

  static final LocaleController instance = LocaleController._();

  static const String _languageKey = 'selected_language';

  static const List<String> supportedLanguageCodes = [
    'en', 'de', 'fr', 'it', 'es',
    'zh', 'ja', 'ko', 'ms', 'pt',
  ];

  Locale _locale = const Locale('en');
  bool _loaded = false;

  Locale get locale => _locale;

  Future<void> loadSavedLocale() async {
    if (_loaded) return;

    final preferences = await SharedPreferences.getInstance();
    final savedCode = preferences.getString(_languageKey);

    if (savedCode != null &&
        supportedLanguageCodes.contains(savedCode)) {
      _locale = Locale(savedCode);
    }

    _loaded = true;
    notifyListeners();
  }

  Future<void> changeLocale(String languageCode) async {
    if (!supportedLanguageCodes.contains(languageCode) ||
        languageCode == _locale.languageCode) {
      return;
    }

    _locale = Locale(languageCode);
    notifyListeners();

    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_languageKey, languageCode);
  }
}
