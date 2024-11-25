import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen')),
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
