import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_flutter/features/auth/presentation/providers/auth_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleNotifier extends StateNotifier<Locale> {
  final SharedPreferences _sharedPreferences;

  static const String _localeKey = 'selected_locale';
  static const Locale spanish = Locale('es');
  static const Locale english = Locale('en');

  LocaleNotifier(this._sharedPreferences)
      : super(
          Locale(
            _sharedPreferences.getString(_localeKey) ?? spanish.languageCode,
          ),
        );

  Future<void> setLocale(Locale locale) async {
    if (state.languageCode == locale.languageCode) return;

    state = locale;
    await _sharedPreferences.setString(_localeKey, locale.languageCode);
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return LocaleNotifier(sharedPreferences);
});
