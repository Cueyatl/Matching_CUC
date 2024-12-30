import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/preferencia_altura.dart';
import 'package:matching/questionare/preferencia_carrera.dart';
import 'package:matching/widgets/_selectable_option_widget.dart';
import 'package:matching/data/app_data.dart';
import 'package:matching/data/app_localizations.dart';

void main() {
  runApp(const CareerQs());
}

class CareerQs extends StatefulWidget {
  const CareerQs({super.key});
  @override
  CareerQsState createState() => CareerQsState();
}

class CareerQsState extends State<CareerQs> {
  int? selectedButton;

  void _onButtonSelected(int buttonIndex) {
    setState(() {
      selectedButton = buttonIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final options = [
  {'label': AppLocalizations.of(context)!.translate('QuestionOptionsLbladmin'), 'index': 1,},
  {'label': AppLocalizations.of(context)!.translate('QuestionOptionsLblCont'), 'index': 2,},
  {'label': AppLocalizations.of(context)!.translate('QuestionOptionsLblBio'), 'index': 3,},
  {'label': AppLocalizations.of(context)!.translate('QuestionOptionsLblInd'), 'index': 4,},
  {'label': AppLocalizations.of(context)!.translate('QuestionOptionsLblSis'), 'index': 5,},
];
    const Color textColor = Styl.textColorShade;
    return Scaffold(
      backgroundColor: Styl.bgBase,
      appBar: const WidgetCloseAppBar(
        
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Styl.verticalPadding,
          horizontal: Styl.horizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderOne(
              message: AppLocalizations.of(context)!.translate('CareerViewTitle'),
            ),
            SizedBox(height: Styl.respoHeightSmall(context)),
            TextOne(
              message:
                  AppLocalizations.of(context)!.translate('CareerViewDescription'),
              xfontColor: textColor,
            ),
            SizedBox(height: Styl.respoHeightMedium(context)),
            Column(
              children:
                  options.map<Widget>((option) => Column(children: [
                    SelectableButton(
                      label: option['label'].toString(),
                      isSelected: selectedButton==option['index'],
                      onPressed: () => _onButtonSelected(int.parse(option['index'].toString()))
                    ),
                    const SizedBox(height: Styl.heightSBoxSmall),
                  ],
                )
              ).toList()
            ),   
            const Spacer(),
            WidgetButton(
              topPadding: Styl.respoHeightMedium(context),
              bottomPadding: Styl.respoHeightSmall(context),
              acceptOrContinue: false,
              isGradient: true,
              logicHere: () {
                Navigator.pushNamed(context, '/calendar');
              },
            ),
          ],
        ),
      ),
    );
  }
}
