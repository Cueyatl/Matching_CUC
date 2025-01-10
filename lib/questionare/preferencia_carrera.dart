import 'package:flutter/material.dart';
import 'package:matching/data/central_state.dart';
import 'package:provider/provider.dart';

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

  final Set<int> _selectedButtons = {};
  
  void centralStateUserData(selectedButtons, options){
    List<int> setOptions = selectedButtons.toList();
    final user = Provider.of<CentralStateModel>(context, listen: false);
    
//error: THIS IS OBSOLETE, USE METHODS SHOWN IN DEV_VIEW.DART  
    // user.setCareerPreferences(setOptions);
  }


  void _onButtonSelected(int buttonIndex) {
    setState(() {

      if (_selectedButtons.contains(buttonIndex)) {
        _selectedButtons.remove(buttonIndex); // Deselect if already selected
      } else {
        _selectedButtons.add(buttonIndex); // Add to selected buttons
      }
      
      if (buttonIndex==6){
        _selectedButtons.clear();
        _selectedButtons.add(6);
      } else {
        if(_selectedButtons.contains(6)){
          _selectedButtons.remove(6);
        }
      }
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
      backgroundColor: Styl.azulProfundo,
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
                      isSelected: _selectedButtons.contains(option['index']),
                      onPressed: () => _onButtonSelected(int.parse(option['index'].toString()))
                    ),
                    const SizedBox(height: Styl.heightSBoxSmall),
                  ],
                )
              ).toList()
            ),   
            const Spacer(),
            WidgetButton(
              // topPadding: Styl.respoHeightMedium(context),
              // bottomPadding: Styl.respoHeightSmall(context),
              // acceptOrContinue: false,
              // isGradient: true,
              logicHere: () {
                  centralStateUserData(_selectedButtons, options);
                  Navigator.pushNamed(context, '/AddPhotosQs');
                },
            ),
          ],
        ),
      ),
    );
  }
}
