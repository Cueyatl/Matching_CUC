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
  runApp(const CareerQs());
}

class CareerQs extends StatefulWidget {
  const CareerQs({super.key});
  @override
  CareerQsState createState() => CareerQsState();
}

class CareerQsState extends State<CareerQs> {
  int? selectedButtonCareer;

  @override
  Widget build(BuildContext context) {
    
    OptionsData optionsData = OptionsData();

    OptionsHelper careerQuestion = OptionsHelper(
        context: context,
        optionMap: optionsData.careerOptions,
        isPreference: false,
        buttonIndex: selectedButtonCareer);

    void onButtonSelectedCareer(int buttonIndex) {
      setState(() {
        selectedButtonCareer = buttonIndex;
      });
    }
    return Scaffold(
      backgroundColor: Styl.azulProfundo,
      appBar: const WidgetCloseAppBar(),
      body: ResponsiveLayout(
        verticalPadding: Styl.verticalPadding,
        horizontalPadding: Styl.horizontalPadding,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderOne(message:AppLocalizations.of(context)!.translate('CareerViewTitle'),),
              TextOne(message: AppLocalizations.of(context)!.translate('CareerViewDescription'),
                bottomPadding: Styl.sizeBoxSpace,),
              
              Padding(padding:const EdgeInsets.symmetric(horizontal:  Styl.horizontalPaddingSmall),
                child: 
              SelectableOptionListWidget(
                  options: careerQuestion.optionMapGenerated, //List<Map(string, dynamic)
                  selectedButton: selectedButtonCareer, //int?
                  onButtonSelected: onButtonSelectedCareer, //dynamic function setstate
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
              user.setCareer(careerQuestion.setSingleData);
              Navigator.pushNamed(context, '/HeightQs');
            },  
          ),
        ),
      ),
    );
  }
}
