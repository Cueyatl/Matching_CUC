import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  late Map<String, dynamic> _localizedData;

  Future<void> load() async {
    String jsonString = await rootBundle.loadString('assets/languages/${locale.languageCode}.json');
    _localizedData = json.decode(jsonString); // Parse the JSON as Map<String, dynamic>
  }

  String translate(String key) {
    // Return a string or the key itself if not found
    final value = _localizedData[key];
    return value is String ? value : key;
  }

  List<String> translateList(String key) {
    // Return a list of strings if the key exists and is a list, otherwise an empty list
    final value = _localizedData[key];
    if (value is List) {
      return value.map((item) => item.toString()).toList();
    }
    return [];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
