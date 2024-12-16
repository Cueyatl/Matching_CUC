import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/fecha_nacimiento.dart';
import 'package:matching/questionare/bienvenida.dart';
import 'package:matching/data/app_data.dart';
import 'package:matching/data/app_localizations.dart';

void main() {
  runApp(const NameQs());
}

class NameQs extends StatelessWidget {
  const NameQs({super.key});
  @override
  Widget build(BuildContext context) {
    //Color Variables, change em to global vars from app_data.
  const Color textColor = Styl.textColorShade;
  const Color textBaseColor = Styl.textColorBase;
  
// -----------------------------------------
// Lógica para validar datos de fechas ingresadas
// -----------------------------------------



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
                HeaderOne(message: AppLocalizations.of(context)!.translate('NameViewTitle')),
                Padding(
                padding:const EdgeInsets.symmetric(vertical: 14.0,),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Styl.bgBase,
                    contentPadding:const  EdgeInsets.only(bottom: 0.0),
                    enabledBorder:const UnderlineInputBorder(
                      borderSide: BorderSide(color: textColor),
                    ),
                    focusedBorder:const UnderlineInputBorder(
                      borderSide: BorderSide(color:textBaseColor),
                      ),
                    focusColor: textBaseColor,
                    labelText: AppLocalizations.of(context)!.translate('NameViewLblName'),
                    labelStyle:const TextStyle(color:textColor)
                  ),
                ),
              ),
              TextOne(message: AppLocalizations.of(context)!.translate('NameViewAdviceOne')),
              TextOne(message: AppLocalizations.of(context)!.translate('NameViewAdviceTwo'),
              xfontWeight: FontWeight.bold,),
              
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
