import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/seven_lookingHeight.dart';
import 'package:matching/questionare/nine_LookingCareer.dart';
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

  void _onButtonSelected(int buttonIndex) {
    setState(() {
      selectedButton = buttonIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final options = [
  {'label': QuestionOptions.lbladmin, 'index': 1,},
  {'label': QuestionOptions.lblCont, 'index': 2,},
  {'label': QuestionOptions.lblBio, 'index': 3,},
  {'label': QuestionOptions.lblInd, 'index': 4,},
  {'label': QuestionOptions.lblSis, 'index': 5,},
];
    const Color textColor = Styl.textColorShade;
    return Scaffold(
      backgroundColor: Styl.bgBase,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPage: LookingHeightQs(),
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
              message: CareerView.title,
            ),
            SizedBox(height: Styl.respoHeightSmall(context)),
            const TextOne(
              message:
                  CareerView.description,
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
