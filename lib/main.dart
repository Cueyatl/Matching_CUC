// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:matching/data/app_data.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:matching/screens/home_page.dart';
// import 'package:matching/screens/_home_screen.dart';
// import 'screens/profile_screen.dart';
import 'screens/_login_signin.dart';
import 'screens/_flasher.dart';
import 'screens/login.dart';
import 'questionare/bienvenida.dart';
import 'questionare/fecha_nacimiento.dart';
import 'questionare/preferencia_genero.dart';
import 'questionare/genero.dart';
import 'questionare/altura.dart';
import 'questionare/fotos.dart';
import 'questionare/etiquetas.dart';
import 'data/app_localizations.dart';
import 'screens/cards.dart';
// import 'NOT_Supported/main_Preview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en'); // Default to English

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false, // Remove debug banner
      locale: _locale,
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('es', ''), // Spanish
      ],
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // home: HomePage(onLocaleChange: setLocale),
      home:  const TinderCardApp(),
    );
  }
}
