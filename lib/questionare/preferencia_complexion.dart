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
  runApp(const SearchBodyTypeQs());
}

class SearchBodyTypeQs extends StatefulWidget {
  const SearchBodyTypeQs({super.key});
  @override
  SearchBodyTypeQsState createState() => SearchBodyTypeQsState();
}

class SearchBodyTypeQsState extends State<SearchBodyTypeQs> {
  // Track which button is selected (1 for Button 1, 2 for Button 2, null if none)

  int? selectedBodyTypeOption;

  final List<int> _selectedBodyTypePreference = [];

  @override
  Widget build(BuildContext context) {
    OptionsData optionsData = OptionsData();
    OptionsHelper bodyTypeQuestion = OptionsHelper(
      context: context,
      optionMap: optionsData.bodyTypeOptions,
      isPreference: true,
      buttonIndex: selectedBodyTypeOption,
    );
    bodyTypeQuestion.selectedPreferencesInput = _selectedBodyTypePreference;
    void onButtonSelectedBodyType(int index) {
      setState(() {
        bodyTypeQuestion.buttonIndex = index;
        bodyTypeQuestion.onMultipleButtonSelected();
      });
    }

    return Scaffold(
      backgroundColor: Styl.azulProfundo,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPageDirection: "/SearchGenderQs",
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
                    AppLocalizations.of(context)!.translate('ComplexionViewTitleQ'),
              ),
              TextOne(
                message: AppLocalizations.of(context)!
                    .translate('ComplexionViewDescriptionQ'),
                bottomPadding: Styl.sizeBoxSpace,
              ),
              MultipleOptionListWidget(
                options: bodyTypeQuestion
                    .optionMapGenerated, //List<Map(string, dynamic)
                selectedButtons: _selectedBodyTypePreference, //List int
                onButtonsSelected:
                    onButtonSelectedBodyType, //dynamic function setstate
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
              user.setBodyTypePreferences(
                  bodyTypeQuestion.multiplelistParser(_selectedBodyTypePreference));
              Navigator.pushNamed(context, '/SearchPersonalityTypeQs');
            },
          ),
        ),
      ),
    );
  }
}
