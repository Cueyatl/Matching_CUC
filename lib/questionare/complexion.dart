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
  runApp(const BodyTypeQs());
}

class BodyTypeQs extends StatefulWidget {
  const BodyTypeQs({super.key});
  @override
  BodyTypeQsState createState() => BodyTypeQsState();
}

class BodyTypeQsState extends State<BodyTypeQs> {
  int? selectedButtonComplexion;

  @override
  Widget build(BuildContext context) {
    
    OptionsData optionsData = OptionsData();

    OptionsHelper complexionQuestion = OptionsHelper(
        context: context,
        optionMap: optionsData.bodyTypeOptions,
        isPreference: false,
        buttonIndex: selectedButtonComplexion);

    void onButtonSelectedComplexion(int buttonIndex) {
      setState(() {
        selectedButtonComplexion = buttonIndex;
      });
    }
    return Scaffold(
      backgroundColor: Styl.azulProfundo,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPageDirection: "/HeightQs",
      ),
      body: ResponsiveLayout(
        verticalPadding: Styl.verticalPadding,
        horizontalPadding: Styl.horizontalPadding,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderOne(message:AppLocalizations.of(context)!.translate('ComplexionViewTitle'),),
              TextOne(message: AppLocalizations.of(context)!.translate('ComplexionViewDescription'),
                bottomPadding: Styl.sizeBoxSpace,),
                    Image.asset(
                    scale: 2.4,
                    'images/bodyTypes.png'),
                  const SizedBox(width: 8),
              Padding(padding:const EdgeInsets.symmetric(horizontal:  Styl.horizontalPaddingSmall),
                child: 
              SelectableOptionListWidget(
                  options: complexionQuestion.optionMapGenerated, //List<Map(string, dynamic)
                  selectedButton: selectedButtonComplexion, //int?
                  onButtonSelected: onButtonSelectedComplexion, //dynamic function setstate
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
              user.setBodyType(complexionQuestion.setSingleData);
              Navigator.pushNamed(context, '/PersonalityQs');
            },  
          ),
        ),
      ),
    );
  }
}
