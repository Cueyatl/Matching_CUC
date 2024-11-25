import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/_five_lookingGenre.dart';
import 'package:matching/questionare/_seven_lookingHeight.dart';


void main() {
  runApp(const HeigthQs());
}

class HeigthQs extends StatelessWidget {
  const HeigthQs({super.key});
  @override
  Widget build(BuildContext context) {
  const Color textColor = Colors.grey;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const WidgetCloseAppBar(goBack: true, lastPage: SearchGenderQs(),),
      body: Padding(
        padding: const  EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 24.0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const HeaderOne(message: "¿Cuál es tu altura?",),
                const SizedBox(width: 10),
                const TextOne(message: ". Esta información nos ayudará a hacer recomendaciones más precisas para ti.", xfontColor: textColor,),
                const SizedBox(width: 10),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 32.0),

              child: Expanded(
                  child: TextFormField(
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    // inputFormatters: [
                    // ],
                    maxLength: 4,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      counterText: '',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,
                        )
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 0.0),
                      hintText: "0.00 cms",
                      hintStyle: TextStyle(
                        letterSpacing: 8.0,
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              WidgetButton(topPadding: 40.0,bottomPadding: 10.0, message: "Siguiente", isGradient: true, 
                logicHere: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const LookingHeightQs()));                
                },
              )
            ],
          )

      )
    );
  }
}
