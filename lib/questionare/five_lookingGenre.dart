import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/four_gender.dart';
import 'package:matching/questionare/six_height.dart';
import 'package:matching/widgets/_selectable_option_widget.dart';
import 'package:matching/data/app_data.dart';


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
  int? selectedButton;
  Set<int> selectedButtons = {};


  void _onButtonSelected(int buttonIndex) {
    setState(() {

      if (selectedButtons.contains(buttonIndex)) {
        selectedButtons.remove(buttonIndex); // Deselect if already selected
      } else {
        selectedButtons.add(buttonIndex); // Add to selected buttons
      }
      
      if (buttonIndex==4){
        selectedButtons.clear();
        selectedButtons.add(4);
      } else {
        if(selectedButtons.contains(4)){
          selectedButtons.remove(4);
        }
      }


          print(selectedButtons);
      
    });
  }


  @override
  Widget build(BuildContext context) {
    final options=[
      {'label': QuestionOptions.lblMan, 'index': 1},
      {'label': QuestionOptions.lblWoman, 'index': 2},
      {'label': QuestionOptions.lblOther, 'index': 3},
      {'label': QuestionOptions.lblGenders, 'index': 4},
    ];
    const Color textColor = Styl.textColorShade;
    return Scaffold(
      backgroundColor: Styl.bgBase,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPage: GenderQs(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Styl.verticalPadding,
          horizontal: Styl.horizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderOne(
              message: GenderView.titleQ,
            ),
            SizedBox(height: Styl.respoHeightSmall(context)),
            const TextOne(
              message:
                  GenderView.descriptionQ ,
              xfontColor: textColor,
            ),
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
            
            // const SizedBox(height: 18),
            // SelectableButton(
            //   label: QuestionOptions.lblMan,
            //   isSelected:  selectedButtons.contains(1), 
            //   onPressed: () => _onButtonSelected(1),              
            // ),
            // const SizedBox(width: 20), // Add some spacing between buttons
            // SelectableButton(
            //   label: QuestionOptions.lblWoman,
            //   isSelected: selectedButtons.contains(2),
            //   onPressed: () => _onButtonSelected(2),
              
            // ),
            // SelectableButton(
            //   label: QuestionOptions.lblBeyondBin,
            //   isSelected: selectedButtons.contains(3),
            //   onPressed: () => _onButtonSelected(3),
            // ),
            // SelectableButton(
            //   label: QuestionOptions.lblGenders,
            //   isSelected: selectedButtons.contains(4),
            //   onPressed: () => _onButtonSelected(4),
            // ),
            const Spacer(),
            WidgetButton(
              topPadding: Styl.respoHeightMedium(context),
              bottomPadding: Styl.respoHeightSmall(context),
              acceptOrContinue: false,
              isGradient: true,
              logicHere: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HeigthQs(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
