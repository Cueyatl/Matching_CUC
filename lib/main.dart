// ignore_for_file: unused_import
// Importaciones de Flutter
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:matching/data/central_state.dart';

import 'package:provider/provider.dart';

import 'package:matching/data/app_data.dart';
import 'package:matching/data/app_localizations.dart';

// Importaciones de Cuestionario
import 'questionare/bienvenida.dart';
import 'package:matching/questionare/nombre.dart';
import 'package:matching/questionare/fecha_nacimiento.dart';
import 'package:matching/questionare/genero.dart';
import 'package:matching/questionare/carrera.dart';
import 'package:matching/questionare/complexion.dart';
import 'package:matching/questionare/personality.dart';
import 'package:matching/questionare/altura.dart';
import 'package:matching/questionare/preferencia_carrera.dart';
import 'package:matching/questionare/preferencia_genero.dart';
import 'package:matching/questionare/preferencia_complexion.dart';
import 'package:matching/questionare/preferencia_personalidad.dart';



import 'package:matching/questionare/preferencia_altura.dart';
// import 'package:matching/questionare/fotos.dart';
import 'package:matching/questionare/etiquetas.dart';

// Importaciones Pantallas
// import 'screens/_flasher.dart';
import 'screens/swipe_cards.dart';
import 'screens/profile_page.dart';

//THIS IS FOR DEVOPS ONLY
import 'package:matching/screens/dev_view.dart';


import 'screens/login_page.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Lock to portrait mode
  ]).then((_) {
    runApp(
      ChangeNotifierProvider(
        create: (_) => CentralStateModel(),
        child: const MyApp(),
      ),
    );
  });
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() =>  _MyAppState();
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
      
      // home:LogInForm(onLocaleChange: setLocale),

      routes: {
        '/': (context) =>   LogInForm(onLocaleChange: setLocale),       // Home Page
        '/WelcomeQs': (context) => const  WelcomeQs(), // Calendar Page
        '/Name': (context) => const  NameQs(),
        '/BirthdayQs': (context) => const  BirthdayQs(),
        '/GenderQs': (context) => const  GenderQs(),
        '/CareerQs': (context) => const CareerQs(),
        '/HeightQs': (context) => const HeigthQs(),
        '/BodyTypeQs': (context) => const BodyTypeQs(),
        '/PersonalityQs': (context) => const PersonalityQs(),

        '/SearchCareerQs': (context) => const SearchCareerQs(),
        '/SearchHeightQs': (context) => const  SearchHeightQs(),
        '/SearchGenderQs': (context) => const  SearchGenderQs(),
        '/SearchBodyTypeQs': (context) => const  SearchBodyTypeQs(),
        '/SearchPersonalityTypeQs': (context) => const  SearchPersonalityQs(),
        
        // '/AddPhotosQs': (context) => const AddPhotosQs(),

        '/PersonalityTags': (context) => const PersonalityTags(),

        '/SwipeCardsClass': (context) =>  const SwipeCardsClass(),
        '/ProfileView': (context) =>  const ProfileView(),

        '/DevsOne': (context) => const DevsOne(),
      },

    );
  }
}
