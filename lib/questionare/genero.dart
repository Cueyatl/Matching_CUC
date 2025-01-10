import 'package:flutter/material.dart';
import 'package:matching/data/central_state.dart';
import 'package:provider/provider.dart';
import 'package:matching/data/app_localizations.dart';

import 'package:matching/data/app_data.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_circular_gender_button_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/widgets/_responsive_layout_widget.dart';
import 'package:matching/widgets/_selectable_option_widget.dart';
import 'package:matching/questionare/fecha_nacimiento.dart';
import 'package:matching/questionare/preferencia_genero.dart';

import 'package:matching/widgets/_single_choice_widget.dart';

void main() {
  runApp(const GenderQs());
}

class GenderQs extends StatefulWidget {
  const GenderQs({super.key});
  @override
  GenderQsState createState() => GenderQsState();
}

class GenderQsState extends State<GenderQs> {
  int? selectedButtonGender;

  @override
  Widget build(BuildContext context) {

    OptionsData optionsData = OptionsData();

    OptionsHelper genderQuestion = OptionsHelper(
        context: context,
        optionMap: optionsData.genderOptions,
        isPreference: false,
        buttonIndex: selectedButtonGender);
    void onButtonSelectedGender(int buttonIndex) {
      setState(() {
        selectedButtonGender = buttonIndex;
      });
    }

    return Scaffold(
      backgroundColor: Styl.azulProfundo,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        // lastPage: BirthdayQs(),
      ),
      body:
        ResponsiveLayout(
        verticalPadding: Styl.verticalPadding,
        horizontalPadding: Styl.horizontalPadding,
        children: [
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            HeaderOne(message:AppLocalizations.of(context)!.translate('GenderViewTitle'),),
            TextOne(message: AppLocalizations.of(context)!.translate('GenderViewDescription'),
              bottomPadding: Styl.sizeBoxSpace,),
            
            CircularButton(
              paddingBetweenButtons: 20,
              buttonSize: 160,
              options:genderQuestion.optionMapGenerated, //List<Map(string, dynamic)
              selectedButton: selectedButtonGender, //int?
              onButtonSelected:onButtonSelectedGender, //dynamic function setstate
            ),
          ],
        ),
    ],),
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
              user.setGender(genderQuestion.setSingleData);
              Navigator.pushNamed(context, '/CarrerQs');
            },
          ),
        ),
      ),
    );
  }
}
