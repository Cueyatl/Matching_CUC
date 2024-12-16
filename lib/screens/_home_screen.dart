import 'package:flutter/material.dart';
import 'package:matching/data/app_data.dart';
import 'package:matching/questionare/bienvenida.dart';

//Do not use, still working
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // xfontColor: Styl.textColorBase
        title: const Text('Home Screen'), ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the Profile Screen
            Navigator.pushNamed(context, '/profile');
          },
          child:const Text('Go to Profile'),
        ),
      ),
    );
  }
}
