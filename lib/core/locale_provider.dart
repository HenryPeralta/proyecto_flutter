import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  final SharedPreferences _sharedPreferences;

  static const String _localeKey = 'selected_locale';
  static const Locale spanish = Locale('es');
  static const Locale english = Locale('en');

  LocaleProvider(this._sharedPreferences)
      : _locale = Locale(
          _sharedPreferences.getString(_localeKey) ?? spanish.languageCode,
        );

  Locale _locale;

  Locale get locale => _locale;

  Future<void> setLocale(Locale locale) async {
    if (_locale.languageCode == locale.languageCode) return;

    _locale = locale;
    await _sharedPreferences.setString(_localeKey, locale.languageCode);
    notifyListeners();
  }
}
