// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:matching/data/app_data.dart';

// import 'screens/home_screen.dart';
// import 'screens/profile_screen.dart';
import 'screens/_login_signin.dart';
import 'screens/_flasher.dart';
import 'screens/login.dart';
import 'questionare/one_welcome.dart';
import 'questionare/three_birthday.dart';
import 'questionare/five_lookingGenre.dart';
import 'questionare/four_gender.dart';
import 'questionare/six_height.dart';
import 'questionare/add_photos.dart';
import 'questionare/Tags.dart';
// import 'NOT_Supported/main_Preview.dart';
void main() {
  
  runApp(const MyApp());

}




class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: PersonalityTags()
    );
    
  }
}
