import 'package:flutter/material.dart';
import 'package:matching/data/central_state.dart';
import 'package:provider/provider.dart';

import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/widgets/_responsive_layout_widget.dart';
import 'dart:convert'; //json encode
import 'package:http/http.dart' as http;

import 'package:matching/data/app_data.dart';

import 'package:matching/widgets/_multiple_choice_widget.dart';

import 'package:matching/data/app_localizations.dart';

void main() {
  runApp(const PersonalityTags());
}

class PersonalityTags extends StatefulWidget {
  const PersonalityTags({super.key});
  @override
  PersonalityTagsState createState() => PersonalityTagsState();
}

class PersonalityTagsState extends State<PersonalityTags> {
  // Track which button is selected (1 for Button 1, 2 for Button 2, null if none)
  Future<void> _sendUserData() async {
    final user = Provider.of<CentralStateModel>(context, listen: false);
    const url = 'http://192.168.1.66:5000/create_user';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      logger.i('User saved successfully: ${response.body}');
      if (mounted) {
        Navigator.pushNamed(context, '/SwipeCardsClass');
      }
    } else {
      logger.e('Failed to save user: ${response.body}',
          error: 'Send user data failure');
    }
  }

  int? selectedPersonalityOption;

  final List<int> _selectedPersonalityPreference = [];

  @override
  Widget build(BuildContext context) {
    OptionsData optionsData = OptionsData();
    OptionsHelper personalityQuestion = OptionsHelper(
      context: context,
      optionMap: optionsData.matchTags,
      isPreference: true,
      buttonIndex: selectedPersonalityOption,
    );
    personalityQuestion.selectedPreferencesInput =
        _selectedPersonalityPreference;
    void onButtonSelectedPersonality(int index) {
      setState(() {
        personalityQuestion.buttonIndex = index;
        personalityQuestion.onMultipleButtonSelected();
      });
    }

    return Scaffold(
      backgroundColor: Styl.azulProfundo,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPageDirection: "/SearchPersonalityTypeQs",
      ),
      body: ResponsiveLayout(
        verticalPadding: Styl.verticalPadding,
        horizontalPadding: Styl.horizontalPadding,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderOne(message: AppLocalizations.of(context)!.translate('ComplexionViewTitle'),),
              TextOne(message: AppLocalizations.of(context)!.translate('ComplexionViewDescription'),
                bottomPadding: Styl.sizeBoxSpace,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.6, // Ajusta según sea necesario
                child: SingleChildScrollView(
                  child: MultipleOptionListWidget(
                    textFontSize: 12,
                    spacing: 2,
                    runSpacing: 1,
                    options: personalityQuestion
                        .optionMapGenerated, // List<Map<string, dynamic>
                    selectedButtons:
                        _selectedPersonalityPreference, // List<int>
                    onButtonsSelected:
                        onButtonSelectedPersonality, // dynamic function setstate
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: Styl.buttonHeight,
          child: WidgetButton(
            isEnabled: true,
            logicHere: () async {
              final user =
                  Provider.of<CentralStateModel>(context, listen: false);
              user.setTagsChoice(personalityQuestion
                  .multiplelistParser(_selectedPersonalityPreference));
              Navigator.pushNamed(context, '/SwipeCardsClass');
              await _sendUserData();
            },
          ),
        ),
      ),
    );
  }
}
