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
  runApp(const SearchGenderQs());
}

class SearchGenderQs extends StatefulWidget {
  const SearchGenderQs({super.key});
  @override
  SearchGenderQsState createState() => SearchGenderQsState();
}

class SearchGenderQsState extends State<SearchGenderQs> {
  // Track which button is selected (1 for Button 1, 2 for Button 2, null if none)

  int? selectedGenderOption;

  final List<int> _selectedGenderPreference = [];

  @override
  Widget build(BuildContext context) {
    OptionsData optionsData = OptionsData();
    OptionsHelper genderQuestion = OptionsHelper(
      context: context,
      optionMap: optionsData.genderOptionsplural,
      isPreference: true,
      buttonIndex: selectedGenderOption,
    );
    genderQuestion.selectedPreferencesInput = _selectedGenderPreference;
    void onButtonSelectedGender(int index) {
      setState(() {
        genderQuestion.buttonIndex = index;
        genderQuestion.onMultipleButtonSelected();
      });
    }

    return Scaffold(
      backgroundColor: Styl.azulProfundo,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPageDirection: "/SearchHeightQs",
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
                    AppLocalizations.of(context)!.translate('GenderViewTitleQ'),
              ),
              TextOne(
                message: AppLocalizations.of(context)!
                    .translate('GenderViewDescriptionQ'),
                bottomPadding: Styl.sizeBoxSpace,
              ),
              MultipleOptionListWidget(
                options: genderQuestion
                    .optionMapGenerated, //List<Map(string, dynamic)
                selectedButtons: _selectedGenderPreference, //List int
                onButtonsSelected:
                    onButtonSelectedGender, //dynamic function setstate
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
              user.setGenderPreferences(
                  genderQuestion.multiplelistParser(_selectedGenderPreference));
              Navigator.pushNamed(context, '/SearchBodyTypeQs');
            },
          ),
        ),
      ),
    );
  }
}
