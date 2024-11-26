import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/_seven_lookingHeight.dart';
import 'package:matching/questionare/_nine_LookingCareer.dart';
import 'package:matching/widgets/_selectable_option_widget.dart';
import 'package:matching/data/app_data.dart';

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
  final double actualButtonWidth = 120.0;

  void _onButtonSelected(int buttonIndex) {
    setState(() {
      selectedButton = buttonIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color textColor = Colors.grey;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPage: LookingHeightQs(),
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
              message: CareerView.title,
            ),
            const SizedBox(height: 10),
            const TextOne(
              message:
                  CareerView.description,
              xfontColor: textColor,
            ),
            const SizedBox(height: 18),
            SelectableButton(
              label: QuestionOptions.lbladmin,
              isSelected: selectedButton == 1,
              onPressed: () => _onButtonSelected(1),
            ),
            SelectableButton(
              label: QuestionOptions.lblCont,
              isSelected: selectedButton == 2,
              onPressed: () => _onButtonSelected(2),
            ),
            SelectableButton(
              label: QuestionOptions.lblBio,
              isSelected: selectedButton == 3,
              onPressed: () => _onButtonSelected(3),
              
            ),
            const SizedBox(width: 20), // Add some spacing between buttons
            SelectableButton(
              label: QuestionOptions.lblInd,
              isSelected: selectedButton == 4,
              onPressed: () => _onButtonSelected(4),
              
            ),
            SelectableButton(
              label: QuestionOptions.lblSis,
              isSelected: selectedButton == 5,
              onPressed: () => _onButtonSelected(5),
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
                    builder: (context) => const LookingCareerQs(),
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
