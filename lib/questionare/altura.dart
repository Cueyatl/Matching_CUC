import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/preferencia_genero.dart';
import 'package:matching/questionare/preferencia_altura.dart';
import 'package:matching/data/app_data.dart';
import 'package:matching/data/app_localizations.dart';

  
void main() {
  runApp(const HeigthQs());
}

class HeigthQs extends StatelessWidget {
  const HeigthQs({super.key});
  @override
  Widget build(BuildContext context) {
  const Color textColor = Styl.textColorShade;
final formKey = GlobalKey<FormState>();


  
// -----------------------------------------
// Lógica para validar datos de fechas ingresadas
// -----------------------------------------



    return
    Form
    (
    key:formKey,
    child: 
    Scaffold(
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
                HeaderOne(message: AppLocalizations.of(context)!.translate('HeightViewTitle'),),
                SizedBox(height: Styl.respoHeightSmall(context)),
                TextOne(message: AppLocalizations.of(context)!.translate('HeightViewDescription'), xfontColor: textColor,),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'La altura es requerida';
                        }
                        final height = int.tryParse(value);
                        if (height == null || height < 50 || height > 240) {
                          return 'Introduce una altura válida (50 - 240 cm)';
                        }
                        return null;
                      },
                    decoration:  InputDecoration(
                      counterText: '',
                      enabledBorder:const  UnderlineInputBorder(
                        borderSide: BorderSide(color: textColor,
                        )
                      ),
                      border: InputBorder.none,
                      contentPadding:const EdgeInsets.only(bottom: 0.0),
                      hintText: AppLocalizations.of(context)!.translate('HeightViewLblHeight'),
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
                  Navigator.pushNamed(context, '/SearchHeightQs');
                },
              )
            ],
          )
)
      )
    );
  }
}
