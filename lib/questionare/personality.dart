import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:matching/data/central_state.dart';
import 'package:matching/data/app_localizations.dart';

import 'package:matching/data/app_data.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/widgets/_single_choice_widget.dart';
import 'package:matching/widgets/_responsive_layout_widget.dart';

void main() {
  runApp(const PersonalityQs());
}

class PersonalityQs extends StatefulWidget {
  const PersonalityQs({super.key});
  @override
  PersonalityQsState createState() => PersonalityQsState();
}

class PersonalityQsState extends State<PersonalityQs> {
  int? selectedButtonPersonality;

  @override
  Widget build(BuildContext context) {
    
    OptionsData optionsData = OptionsData();

    OptionsHelper personalityQuestion = OptionsHelper(
        context: context,
        optionMap: optionsData.personalityTypeOptions,
        isPreference: false,
        buttonIndex: selectedButtonPersonality);

    void onButtonSelectedPersonality(int buttonIndex) {
      setState(() {
        selectedButtonPersonality = buttonIndex;
      });
    }
    return Scaffold(
      backgroundColor: Styl.azulProfundo,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPageDirection: "/BodyTypeQs",
      ),
      body: ResponsiveLayout(
        verticalPadding: Styl.verticalPadding,
        horizontalPadding: Styl.horizontalPadding,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderOne(message:AppLocalizations.of(context)!.translate('PersonalityTitle'),),
              TextOne(message: AppLocalizations.of(context)!.translate('PersonalityDescr'),
                bottomPadding: Styl.sizeBoxSpace,),
              Padding(padding:const EdgeInsets.symmetric(horizontal:  Styl.horizontalPaddingSmall),
                child: 
              SelectableOptionListWidget(
                  options: personalityQuestion.optionMapGenerated, //List<Map(string, dynamic)
                  selectedButton: selectedButtonPersonality, //int?
                  onButtonSelected: onButtonSelectedPersonality, //dynamic function setstate
                ),
              ),
              
            ],
          ),
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
              user.setPersonalityType(personalityQuestion.setSingleData);
              Navigator.pushNamed(context, '/SearchCareerQs');
            },  
          ),
        ),
      ),
    );
  }
}
