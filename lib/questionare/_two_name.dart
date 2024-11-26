import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/_three_birthday.dart';
import 'package:matching/questionare/_one_welcome.dart';
import 'package:matching/data/app_data.dart';

void main() {
  runApp(const NameQs());
}

class NameQs extends StatelessWidget {
  const NameQs({super.key});
  @override
  Widget build(BuildContext context) {
  const Color textColor = Colors.grey;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const WidgetCloseAppBar(goBack: true, lastPage: WelcomeQs(),),
      body: Padding(
        padding: const  EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 24.0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const HeaderOne(message: NameView.title,),
                Padding(
                padding:const EdgeInsets.symmetric(vertical: 14.0,),
                child: TextFormField(
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.only(bottom: 0.0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    focusColor: Colors.black,
                    labelText: NameView.lblName,
                    labelStyle: TextStyle(color: Colors.grey)
                  ),
                ),
              ),
              const TextOne(message: NameView.adviceOne , xfontColor: textColor,),
              const TextOne(message: NameView.adviceTwo, xfontColor:Colors.black, xfontWeight: FontWeight.bold,),
              
              WidgetButton(topPadding: 40.0,bottomPadding: 10.0, acceptOrContinue: false, isGradient: true, 
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
