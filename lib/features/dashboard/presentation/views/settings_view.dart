import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_flutter/core/locale_provider.dart';
import 'package:proyecto_flutter/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:proyecto_flutter/l10n/app_localizations.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeProvider = context.watch<LocaleProvider>();
    final selectedLanguage = localeProvider.locale.languageCode;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          DashboardHeader(title: l10n.configuration),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Text(
                  l10n.language,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  l10n.selectLanguage,
                  style: const TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                _LanguageOption(
                  title: l10n.spanish,
                  subtitle: 'ES',
                  value: LocaleProvider.spanish.languageCode,
                  groupValue: selectedLanguage,
                  onChanged: (_) {
                    localeProvider.setLocale(LocaleProvider.spanish);
                  },
                ),
                const SizedBox(height: 8),
                _LanguageOption(
                  title: l10n.english,
                  subtitle: 'EN',
                  value: LocaleProvider.english.languageCode,
                  groupValue: selectedLanguage,
                  onChanged: (_) {
                    localeProvider.setLocale(LocaleProvider.english);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  const _LanguageOption({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: RadioListTile<String>(
        activeColor: const Color(0xFFFF6A6A),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text(subtitle),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
