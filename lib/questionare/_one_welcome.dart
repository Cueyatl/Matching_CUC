import 'package:flutter/material.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/widgets/_logo_widget.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/questionare/_two_name.dart';

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
              const HeaderOne(message: "Te damos la bienvenida a Matching.",),
              const TextOne(message: "Por favor, sigue estas reglas.", xfontColor: textColor,),
              const SizedBox(height: sizeBoxSize),
              const HeaderThree(message: "No finjas ser alguien más.",),
              const TextOne(message: "Asegúrate de que tus fotos, edad y biografía correspondan con quien eres actualmente.", xfontColor:textColor,),
              const SizedBox(height: sizeBoxSize),
              const HeaderThree(message: "Cuídate.",),
              const TextOne(message: "No des tu información personal demasiado pronto.", xfontColor: textColor,),
              const SizedBox(height: sizeBoxSize),
              const HeaderThree(message: "Tómalo con calma.",),
              const TextOne(message: "Respeta a los demás y trpatalos como te gustaría que te trataran.", xfontColor: textColor,),
              const  SizedBox(height: sizeBoxSize),
              const HeaderThree(message: "Toma la iniciativa.",),
              const TextOne(message: "Siempre denuncia el mal comportamiento.", xfontColor: textColor,),
              const  Spacer(),
              WidgetButton(topPadding: 40.0,bottomPadding: 10.0, message: "Acepto", isGradient: true, 
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
