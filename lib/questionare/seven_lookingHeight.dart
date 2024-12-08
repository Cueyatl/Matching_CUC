import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/six_height.dart';
import 'package:matching/questionare/eigth_Career.dart';
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
    final options = [
  {'label': HeightView.lblHighQ, 'index': 1,},
  { 'label': HeightView.lblMidQ,  'index': 2,},
  {  'label': HeightView.lblLowQ, 'index': 3,},
  { 'label': HeightView.lblAllQ, 'index': 4,},
];
    const Color textColor = Styl.textColorShade;

    return Scaffold(
      backgroundColor: Styl.bgBase,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPage: HeigthQs(),
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
              message:HeightView.titleQ,
            ),
            SizedBox(height: Styl.respoHeightSmall(context)),
            const TextOne(
              message:
                  HeightView.descriptionQ,
              xfontColor: textColor,
            ),
            SizedBox(height: Styl.respoHeightMedium(context)),
            Column(
              children:
                  options.map<Widget>((option) => Column(children: [
                    SelectableButton(
                      label: option['label'].toString(),
                      isSelected: options.contains(option['index']),
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
