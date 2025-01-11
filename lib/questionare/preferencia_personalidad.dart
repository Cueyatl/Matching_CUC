import 'package:flutter/material.dart';
import 'package:matching/data/central_state.dart';
import 'package:provider/provider.dart';

import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/widgets/_responsive_layout_widget.dart';

import 'package:matching/data/app_data.dart';

import 'package:matching/widgets/_multiple_choice_widget.dart';

import 'package:matching/data/app_localizations.dart';

void main() {
  runApp(const SearchPersonalityQs());
}

class SearchPersonalityQs extends StatefulWidget {
  const SearchPersonalityQs({super.key});
  @override
  SearchPersonalityQsState createState() => SearchPersonalityQsState();
}

class SearchPersonalityQsState extends State<SearchPersonalityQs> {
  // Track which button is selected (1 for Button 1, 2 for Button 2, null if none)

  int? selectedPersonalityOption;

  final List<int> _selectedPersonalityPreference = [];

  @override
  Widget build(BuildContext context) {
    OptionsData optionsData = OptionsData();
    OptionsHelper personalityQuestion = OptionsHelper(
      context: context,
      optionMap: optionsData.personalityTypeOptions,
      isPreference: true,
      buttonIndex: selectedPersonalityOption,
    );
    personalityQuestion.selectedPreferencesInput = _selectedPersonalityPreference;
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
        lastPageDirection: "/SearchBodyTypeQs",
      ),
      body: ResponsiveLayout(
        verticalPadding: Styl.verticalPadding,
        horizontalPadding: Styl.horizontalPadding,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderOne(
                message:
                    AppLocalizations.of(context)!.translate('ComplexionViewTitle'),
              ),
              TextOne(
                message: AppLocalizations.of(context)!
                    .translate('ComplexionViewDescription'),
                bottomPadding: Styl.sizeBoxSpace,
              ),
              MultipleOptionListWidget(
                options: personalityQuestion
                    .optionMapGenerated, //List<Map(string, dynamic)
                selectedButtons: _selectedPersonalityPreference, //List int
                onButtonsSelected:
                    onButtonSelectedPersonality, //dynamic function setstate
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
            logicHere: () {
              final user =
                  Provider.of<CentralStateModel>(context, listen: false);
              user.setPersonalityPreferences(
                  personalityQuestion.multiplelistParser(_selectedPersonalityPreference));
              Navigator.pushNamed(context, '/PersonalityTags');
            },
          ),
        ),
      ),
    );
  }
}
