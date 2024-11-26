import 'package:flutter/material.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/widgets/_logo_widget.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/questionare/_two_name.dart';
import 'package:matching/data/app_data.dart';

void main() {
  runApp(const WelcomeQs());
}
class WelcomeQs extends StatelessWidget {
  const WelcomeQs({super.key});
  @override
  Widget build(BuildContext context) {
  const Color textColor = Colors.grey;
  const double sizeBoxSize =24.0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const WidgetCloseAppBar(),
      body: Padding(
        padding:const  EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 24.0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  WidgetLogo(),
                  SizedBox(width: 8),
                ],
              ),
              const HeaderOne(message: WelcomeView.ruleTwoTitle,),
              const TextOne(message: WelcomeView.description, xfontColor: textColor,),
              const SizedBox(height: sizeBoxSize),
              const HeaderThree(message: WelcomeView.ruleOneTitle,),
              const TextOne(message: WelcomeView.ruleOneText, xfontColor:textColor,),
              const SizedBox(height: sizeBoxSize),
              const HeaderThree(message: WelcomeView.ruleTwoTitle,),
              const TextOne(message: WelcomeView.ruleTwoText, xfontColor: textColor,),
              const SizedBox(height: sizeBoxSize),
              const HeaderThree(message: WelcomeView.ruleThreeTitle,),
              const TextOne(message: WelcomeView.ruleThreeText, xfontColor: textColor,),
              const  SizedBox(height: sizeBoxSize),
              const HeaderThree(message: WelcomeView.ruleFourTitle,),
              const TextOne(message: WelcomeView.ruleFourText, xfontColor: textColor,),
              const  Spacer(),
              WidgetButton(topPadding: 40.0,bottomPadding: 10.0, acceptOrContinue: true, isGradient: true, 
                logicHere: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const NameQs()));
                },
                
              )
            ],
          )
      )
    );
  }
}
