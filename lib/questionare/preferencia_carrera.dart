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
  runApp(const SearchCareerQs());
}

class SearchCareerQs extends StatefulWidget {
  const SearchCareerQs({super.key});
  @override
  SearchCareerQsState createState() => SearchCareerQsState();
}

class SearchCareerQsState extends State<SearchCareerQs> {
  // Track which button is selected (1 for Button 1, 2 for Button 2, null if none)

  int? selectedCareerOption;
  
  final List<int> _selectedCareerPreference = [];


  @override
  Widget build(BuildContext context) {
OptionsData optionsData = OptionsData();
       OptionsHelper careerQuestion = OptionsHelper(
        context: context,
        optionMap: optionsData.careerOptions,
        isPreference: true,
        buttonIndex: selectedCareerOption,
        );
        careerQuestion.selectedPreferencesInput= _selectedCareerPreference;
       void onButtonSelectedCareer(int index) {
      setState(() {
        careerQuestion.buttonIndex = index;
        careerQuestion.onMultipleButtonSelected();
      });
    }
    
    return Scaffold(
      backgroundColor: Styl.azulProfundo,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPageDirection: "/PersonalityQs",
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
                    AppLocalizations.of(context)!.translate('CareerViewTitleQ'),
              ),
              TextOne(
                message: AppLocalizations.of(context)!
                    .translate('CareerViewDescriptionQ'),
                bottomPadding: Styl.sizeBoxSpace,
              ),
                MultipleOptionListWidget(
              options: careerQuestion.optionMapGenerated, //List<Map(string, dynamic)
              selectedButtons: _selectedCareerPreference, //List int
              onButtonsSelected: onButtonSelectedCareer, //dynamic function setstate
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
              user.setCareerPreferences(careerQuestion.multiplelistParser(
                      _selectedCareerPreference));
              Navigator.pushNamed(context, '/SearchHeightQs');
            },
          ),
        ),
      ),
    );
  }
}
