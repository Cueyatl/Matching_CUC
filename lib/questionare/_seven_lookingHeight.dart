import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/_six_height.dart';
import 'package:matching/questionare/_eigth_Career.dart';
import 'package:matching/widgets/_selectable_option_widget.dart';
import 'package:matching/data/app_data.dart';


void main() {
  runApp(const LookingHeightQs());
}

class LookingHeightQs extends StatefulWidget {
  const LookingHeightQs({super.key});
  @override
  LookingHeightQsState createState() => LookingHeightQsState();
}

class LookingHeightQsState extends State<LookingHeightQs> {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color textColor = Colors.grey;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPage: HeigthQs(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 24.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderOne(
              message:HeightView.titleQ,
            ),
            const SizedBox(height: 10),
            const TextOne(
              message:
                  HeightView.descriptionQ,
              xfontColor: textColor,
            ),
            const SizedBox(height: 18),
            SelectableButton(
              label:HeightView.lblHighQ,
              isSelected:  selectedButtons.contains(1), 
              onPressed: () => _onButtonSelected(1),              
            ),
            const SizedBox(width: 20), // Add some spacing between buttons
            SelectableButton(
              label: HeightView.lblMidQ,
              isSelected: selectedButtons.contains(2),
              onPressed: () => _onButtonSelected(2),
              
            ),
            SelectableButton(
              label: HeightView.lblLowQ,
              isSelected: selectedButtons.contains(3),
              onPressed: () => _onButtonSelected(3),
            ),
            SelectableButton(
              label: HeightView.lblAllQ,
              isSelected: selectedButtons.contains(4),
              onPressed: () => _onButtonSelected(4),
            ),
            const Spacer(),
            WidgetButton(
              topPadding: 40.0,
              bottomPadding: 10.0,
              acceptOrContinue: false,
              isGradient: true,
              logicHere: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CareerQs(),
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
