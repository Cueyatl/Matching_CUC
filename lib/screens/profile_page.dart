import 'package:flutter/material.dart';
import 'package:matching/data/app_data.dart';
import 'package:matching/data/app_localizations.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';

import 'package:matching/widgets/_responsive_layout_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';


class ProfileView extends StatefulWidget {

  const ProfileView({super.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _genderController;
  late TextEditingController _heightController;
  late TextEditingController _careerController;
  late TextEditingController _complexionController;
  late TextEditingController _personalityController;

  
  @override
  // void initState() {
  //   super.initState();
  //   _nameController = TextEditingController(text: widget.profile['nombre']);
  //   _ageController = TextEditingController(text: widget.profile['edad'].toString());
  //   _genderController = TextEditingController(text: widget.profile['genero']);
  //   _heightController = TextEditingController(text: widget.profile['altura'].toString());
  //   _careerController = TextEditingController(text: widget.profile['carrera']);
  //   _complexionController = TextEditingController(text: widget.profile['complexion']);
  //   _personalityController = TextEditingController(text: widget.profile['personalidad']);
  // }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _heightController.dispose();
    _careerController.dispose();
    _complexionController.dispose();
    _personalityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar_placeholder.png'), // Replace with actual avatar
            ),
            const SizedBox(height: 20),
            buildTextField('Name', _nameController),
            buildTextField('Age', _ageController, isNumber: true),
            buildTextField('Gender', _genderController),
            buildTextField('Height (cm)', _heightController, isNumber: true),
            buildTextField('Career', _careerController),
            buildTextField('Complexion', _complexionController),
            buildTextField('Personality', _personalityController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
               
              },
              child: const Text('Save Profile'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, {bool isNumber = false}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  // void saveProfile() {
  //   // Simulate saving the profile - Replace this with actual save logic
  //   final updatedProfile = {
  //     'nombre': _nameController.text,
  //     'edad': int.tryParse(_ageController.text) ?? widget.profile['edad'],
  //     'genero': _genderController.text,
  //     'altura': int.tryParse(_heightController.text) ?? widget.profile['altura'],
  //     'carrera': _careerController.text,
  //     'complexion': _complexionController.text,
  //     'personalidad': _personalityController.text,
  //   };

    
  
}