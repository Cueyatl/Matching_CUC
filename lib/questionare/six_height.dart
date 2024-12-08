import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/five_lookingGenre.dart';
import 'package:matching/questionare/seven_lookingHeight.dart';
import 'package:matching/data/app_data.dart';


void main() {
  runApp(const HeigthQs());
}

class HeigthQs extends StatelessWidget {
  const HeigthQs({super.key});
  @override
  Widget build(BuildContext context) {
  const Color textColor = Styl.textColorShade;
    return Scaffold(
      backgroundColor: Styl.bgBase,
      appBar: const WidgetCloseAppBar(goBack: true, lastPage: SearchGenderQs(),),
      body: Padding(
        padding: const  EdgeInsets.symmetric(
          vertical: Styl.verticalPadding,
          horizontal: Styl.horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const HeaderOne(message: HeightView.title,),
                SizedBox(height: Styl.respoHeightSmall(context)),
                const TextOne(message: HeightView.description, xfontColor: textColor,),
                SizedBox(width: Styl.respoSmall(context)),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 32.0),

              child: Expanded(
                  child: TextFormField(
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    // inputFormatters: [
                    // ],
                    maxLength: 4,
                    textAlign: TextAlign.center,
                    decoration:  InputDecoration(
                      counterText: '',
                      enabledBorder:const  UnderlineInputBorder(
                        borderSide: BorderSide(color: textColor,
                        )
                      ),
                      border: InputBorder.none,
                      contentPadding:const EdgeInsets.only(bottom: 0.0),
                      hintText: HeightView.lblHeight,
                      hintStyle: TextStyle(
                        letterSpacing: 8.0,
                        color: textColor,
                        fontSize: Styl.p3(context),
                      ),
                    ),
                  ),
                ),
              ),
              
              WidgetButton(topPadding: Styl.respoHeightMedium(context),bottomPadding: Styl.respoHeightSmall(context), acceptOrContinue: false, isGradient: true, 
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
