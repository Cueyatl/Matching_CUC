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
  runApp(const SearchHeightQs());
}

class SearchHeightQs extends StatefulWidget {
  const SearchHeightQs({super.key});
  @override
  SearchHeightQsState createState() => SearchHeightQsState();
}

class SearchHeightQsState extends State<SearchHeightQs> {
  // Track which button is selected (1 for Button 1, 2 for Button 2, null if none)

  int? selectedHeightOption;
  
  final List<int> _selectedHeightPreference = [];


  @override
  Widget build(BuildContext context) {
OptionsData optionsData = OptionsData();
       OptionsHelper heightQuestion = OptionsHelper(
        context: context,
        optionMap: optionsData.heightOptions,
        isPreference: true,
        buttonIndex: selectedHeightOption,
        );
        heightQuestion.selectedPreferencesInput= _selectedHeightPreference;
       void onButtonSelectedHeight(int index) {
      setState(() {
        heightQuestion.buttonIndex = index;
        heightQuestion.onMultipleButtonSelected();
      });
    }
    
    return Scaffold(
      backgroundColor: Styl.azulProfundo,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPageDirection: "/SearchCareerQs",
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
                    AppLocalizations.of(context)!.translate('HeightViewTitleQ'),
              ),
              TextOne(
                message: AppLocalizations.of(context)!
                    .translate('HeightViewDescriptionQ'),
                bottomPadding: Styl.sizeBoxSpace,
              ),
                MultipleOptionListWidget(
              options: heightQuestion.optionMapGenerated, //List<Map(string, dynamic)
              selectedButtons: _selectedHeightPreference, //List int
              onButtonsSelected: onButtonSelectedHeight, //dynamic function setstate
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
              user.setHeightPreferences(heightQuestion.multiplelistParser(
                      _selectedHeightPreference));
              Navigator.pushNamed(context, '/SearchGenderQs');
            },
          ),
        ),
      ),
    );
  }
}
