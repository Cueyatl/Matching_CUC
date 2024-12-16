import 'package:flutter/material.dart';
import 'package:matching/data/app_localizations.dart';

class HomePage extends StatelessWidget {
  final Function(Locale) onLocaleChange;

  const HomePage({required this.onLocaleChange, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('welcome')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.translate('hello')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onLocaleChange(const Locale('es')); // Change to Spanish
              },
              child: const Text('Español'),
            ),
            ElevatedButton(
              onPressed: () {
                onLocaleChange(const Locale('en')); // Change to English
              },
              child: const Text('English'),
            ),
          ],
        ),
      ),
    );
  }
}
