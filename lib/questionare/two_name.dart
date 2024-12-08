import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/three_birthday.dart';
import 'package:matching/questionare/one_welcome.dart';
import 'package:matching/data/app_data.dart';

void main() {
  runApp(const NameQs());
}

class NameQs extends StatelessWidget {
  const NameQs({super.key});
  @override
  Widget build(BuildContext context) {
    //Document Variables.
  const Color textColor = Styl.textColorShade;
  const Color textBaseColor = Styl.textColorBase;

    return Scaffold(
      backgroundColor: Styl.bgBase,
      appBar: const WidgetCloseAppBar(goBack: true, lastPage: WelcomeQs(),),
      body: Padding(
        padding: const  EdgeInsets.symmetric(
          vertical: Styl.verticalPadding,
          horizontal: Styl.horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const HeaderOne(message: NameView.title,),
                Padding(
                padding:const EdgeInsets.symmetric(vertical: 14.0,),
                child: TextFormField(
                  decoration:const InputDecoration(
                    fillColor: Styl.bgBase,
                    contentPadding:  EdgeInsets.only(bottom: 0.0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: textColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:textBaseColor),
                      ),
                    focusColor: textBaseColor,
                    labelText: NameView.lblName,
                    labelStyle: TextStyle(color:textColor)
                  ),
                ),
              ),
              const TextOne(message: NameView.adviceOne , xfontColor: textColor,),
              const TextOne(message: NameView.adviceTwo, xfontColor:textBaseColor, xfontWeight: FontWeight.bold,),
              
              WidgetButton(topPadding: Styl.respoHeightMedium(context),bottomPadding: Styl.respoHeightSmall(context), acceptOrContinue: false, isGradient: true, 
                logicHere: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const BirthdayQs()));                
                },
              )

            ],
          )

      )
    );
  }
}
