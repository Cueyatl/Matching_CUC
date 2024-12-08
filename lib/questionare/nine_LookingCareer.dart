import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/eigth_Career.dart';
import 'package:matching/questionare/six_height.dart';
import 'package:matching/widgets/_selectable_option_widget.dart';
import 'package:matching/questionare/add_photos.dart';
import 'package:matching/data/app_data.dart';

void main() {
  runApp(const LookingCareerQs());
}

class LookingCareerQs extends StatefulWidget {
  const LookingCareerQs({super.key});
  @override
  LookingCareerQsState createState() => LookingCareerQsState();
}

class LookingCareerQsState extends State<LookingCareerQs> {
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
    const Color textColor = Styl.textColorShade;
    return Scaffold(
      backgroundColor: Styl.bgBase,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPage: CareerQs(),
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
              message: CareerView.titleQ,
            ),
            SizedBox(height: Styl.respoHeightSmall(context)),
            const TextOne(
              message:
                  CareerView.descriptionQ,
              xfontColor: textColor,
            ),
            SizedBox(height: Styl.respoHeightMedium(context)),
            SelectableButton(
              label: QuestionOptions.lbladmin,
              isSelected:  selectedButtons.contains(1),
              onPressed: () => _onButtonSelected(1),   
            ),
            SizedBox(width: Styl.respoSmall(context)), // Add some spacing between buttons
            SelectableButton(
              label: QuestionOptions.lblCont,
              isSelected: selectedButtons.contains(2),
              onPressed: () => _onButtonSelected(2),
              
            ),
            SelectableButton(
              label: QuestionOptions.lblBio,
              isSelected: selectedButtons.contains(3),
              onPressed: () => _onButtonSelected(3),
            ),
            SelectableButton(
              label: QuestionOptions.lblInd,
              isSelected: selectedButtons.contains(4),
              onPressed: () => _onButtonSelected(4),
            ),
            SelectableButton(
              label: QuestionOptions.lblSis,
              isSelected: selectedButtons.contains(5),
              onPressed: () => _onButtonSelected(5),
            ),
            SelectableButton(
              label: QuestionOptions.lblCareers,
              isSelected: selectedButtons.contains(6),
              onPressed: () => _onButtonSelected(6),
            ),
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
                    builder: (context) => const AddPhotosQs(),
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
