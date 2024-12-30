import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/carrera.dart';
import 'package:matching/questionare/altura.dart';
import 'package:matching/widgets/_selectable_option_widget.dart';
import 'package:matching/questionare/fotos.dart';
import 'package:matching/data/app_data.dart';
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
  int? selectedButton;
  Set<int> selectedButtons = {};


  void _onButtonSelected(int buttonIndex) {
    setState(() {

      if (selectedButtons.contains(buttonIndex)) {
        selectedButtons.remove(buttonIndex); // Deselect if already selected
      } else {
        selectedButtons.add(buttonIndex); // Add to selected buttons
      }
      
      if (buttonIndex==6){
        selectedButtons.clear();
        selectedButtons.add(6);
      } else {
        if(selectedButtons.contains(6)){
          selectedButtons.remove(6);
        }
      }
          print(selectedButtons);
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
  {'label': AppLocalizations.of(context)!.translate('QuestionOptionsLblCareers'), 'index': 6,},
];
    return Scaffold(
      backgroundColor: Styl.bgBase,
      appBar: const WidgetCloseAppBar(goBack: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Styl.verticalPadding,
          horizontal: Styl.horizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderOne(
              message: AppLocalizations.of(context)!.translate('CareerViewTitleQ'),
            ),
            SizedBox(height: Styl.respoHeightSmall(context)),
            TextOne(
              message:
                  AppLocalizations.of(context)!.translate('CareerViewDescriptionQ'),
            ),
            SizedBox(height: Styl.respoHeightMedium(context)),
            Column(
              children:
                  options.map<Widget>((option) => Column(children: [
                    SelectableButton(
                      label: option['label'].toString(),
                      isSelected: selectedButtons.contains(option['index']),
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
                  Navigator.pushNamed(context, '/AddPhotosQs');
                },
            ),
          ],
        ),
      ),
    );
  }
}
