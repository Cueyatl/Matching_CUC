import 'package:flutter/material.dart';
// import '../widgets/_gradient_widget.dart';
import 'package:matching/widgets/_logo_widget.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/questionare/bienvenida.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/data/app_data.dart';
import 'package:matching/data/app_localizations.dart';

const double myHeight = 200;
const double myWidth = 200;
void main() {
  runApp(const LogInForm());
}
//Este es blanco, usuario y contraseña
class LogInForm extends StatelessWidget {
  const LogInForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Styl.bgBase,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const WidgetLogo(
                  topPadding: 30,
                  logoWidth: myWidth,
                  logoHeight: myHeight,
                  bottomPadding: 0.0,
                  gradient: false,),
              
              Padding(
              padding:const EdgeInsets.symmetric(vertical: Styl.verticalPadding, horizontal: Styl.horizontalPadding),
              child:  HeaderOne(message: 
              (AppLocalizations.of(context)!.translate('CredentialsViewTitle')),
              xTextAlign: TextAlign.center,),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: Styl.verticalPadding, horizontal: Styl.horizontalPadding),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Styl.bgBase,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0)),
                    labelText:
                    (AppLocalizations.of(context)!.translate('CredentialsViewTgUser')),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Styl.verticalPadding, horizontal: Styl.horizontalPadding),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Styl.bgBase,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0)),
                    labelText: 
                    (AppLocalizations.of(context)!.translate('CredentialsViewTgPass')),
                  ),
                ),
              ),
          WidgetButton(
              topPadding: Styl.respoHeightMedium(context),
              bottomPadding: Styl.respoHeightSmall(context),
              message: 
              (AppLocalizations.of(context)!.translate('CredentialsViewLgIn')),
              isGradient: true,
              printMessage: "Log in pushed",
            ),

              SizedBox(height: Styl.respoHeightMedium(context)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: Styl.respoHeightMedium(context)),
                    TextOne(message:
                    AppLocalizations.of(context)!.translate('CredentialsViewNoCuenta')),
                    GestureDetector(
                      onTap: () {
                        
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const WelcomeQs()),);
                        print('Navigate to welcoming of Sign in form');
                        
                      },
                      child:  Text(
                        (AppLocalizations.of(context)!.translate('CredentialsViewSgnRegister')),
                        style: TextStyle(
                          fontSize: Styl.p3(context),
                          color: Styl.textColorShade,
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
