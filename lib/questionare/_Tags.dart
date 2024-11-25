import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/_three_birthday.dart';
import 'package:matching/questionare/_one_welcome.dart';

void main() {
  runApp(const PersonalityTags());
}

class PersonalityTags extends StatelessWidget {
  const PersonalityTags({super.key});
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
                const HeaderOne(message: "Cuéntanos que es lo que te apasiona",),
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
                    labelText: 'Nombre',
                    labelStyle: TextStyle(color: Colors.grey)
                  ),
                ),
              ),
              const TextOne(message: "Así aparecerá en tu perfil.", xfontColor: textColor,),
              const TextOne(message: "No podrás cambiarlo después", xfontColor:Colors.black, xfontWeight: FontWeight.bold,),
              const Spacer(),
              WidgetButton(topPadding: 40.0,bottomPadding: 10.0, message: "Siguiente", isGradient: true, 
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
