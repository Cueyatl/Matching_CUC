import 'package:flutter/material.dart';
import 'package:matching/data/central_state.dart';
import 'package:provider/provider.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:matching/data/app_data.dart';

//My widgets
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_name_question.dart';
import 'package:matching/widgets/_single_choice_widget.dart';
import 'package:matching/widgets/_multiple_choice_widget.dart';

//Style widgets
import 'package:matching/widgets/_text_style_widget.dart';

//Translation widget
import 'package:matching/data/app_localizations.dart';

//Debug widgets
import 'package:logger/logger.dart';

void main() => runApp(const DevsOne());

class DevsOne extends StatefulWidget {
  const DevsOne({super.key});

  @override
  State<DevsOne> createState() => _DevsOneState();
}

class _DevsOneState extends State<DevsOne> {
  var logger = Logger();
  //get data for options from here.

  // Controller for the name input
  final TextEditingController _nameController = TextEditingController();

  // Tracks if the button should be enabled, used for not leaving certain inputs empty.
  bool _isButtonEnabled = false; // Make sure this is false by default

  //init value for age
  int _currentValueAge = 16;

  // ############### SINGLE
  int? selectedButtonGender;

// Carrer
  int? selectedCarrerOption;
  final List<int> _selectedGenderPreference = [];


  @override
  Widget build(BuildContext context) {

  OptionsData optionsData = OptionsData();
  
  OptionsHelper genderQuestion = OptionsHelper(
        context: context,
        optionMap: optionsData.genderOptions,
        isPreference: false,
        buttonIndex: selectedButtonGender);

    OptionsHelper careerQuestion = OptionsHelper(
        context: context,
        optionMap: optionsData.careerOptions,
        isPreference: true,
        buttonIndex: selectedCarrerOption,
        );

        careerQuestion.selectedPreferencesInput= _selectedGenderPreference;


// ############# multiple
  void onButtonSelectedCareer(int index) {
      setState(() {
        careerQuestion.buttonIndex = index;
        careerQuestion.onMultipleButtonSelected();
      });
    }
  void onButtonSelectedGender(int buttonIndex) {
    setState(() {
      selectedButtonGender = buttonIndex;
    });
  }

    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //  Codigo UNO
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            
            NameInputField(
              controller: _nameController,
              onValidationChanged: (bool isValid) {
                setState(() => _isButtonEnabled = isValid);
              },
            ),
            
            NumberPicker(
              value: _currentValueAge,
              minValue: 16,
              maxValue: 100,
              onChanged: (value) => setState(() => _currentValueAge = value),
            ),
            TextOne(
              message:
                  '${AppLocalizations.of(context)!.translate('YourAge')} $_currentValueAge',
            ),
            //FIN CODIGO UNO


            SelectableOptionListWidget(
              options: genderQuestion.optionMapGenerated, //List<Map(string, dynamic)
              selectedButton: selectedButtonGender, //int?
              onButtonSelected: onButtonSelectedGender, //dynamic function setstate
            ),


            MultipleOptionListWidget(
              options: careerQuestion.optionMapGenerated, //List<Map(string, dynamic)
              selectedButtons: _selectedGenderPreference, //List int
              onButtonsSelected: onButtonSelectedCareer, //dynamic function setstate
            ),


            WidgetButton(
              isEnabled: _isButtonEnabled,
              logicHere: () {
                if (_isButtonEnabled) {
                  // Navigate to your next screen
                  Navigator.pushNamed(context, '/PersonalityTags');
                  // Save data in your CentralStateModel
                  final user = Provider.of<CentralStateModel>(
                    context,
                    listen: false,
                  );
                  user.setName(_nameController.text);

                  user.setAge(_currentValueAge);

                  user.setGender(genderQuestion.setSingleData);
                  

                  user.setGenderPreferences(genderQuestion.multiplelistParser(
                      _selectedGenderPreference));
                      
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
