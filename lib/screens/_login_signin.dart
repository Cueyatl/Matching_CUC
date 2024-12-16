import 'package:flutter/material.dart';
import 'package:matching/data/app_data.dart';
import '../widgets/_gradient_widget.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/screens/login.dart';
import 'package:matching/questionare/bienvenida.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_logo_widget.dart';
import 'package:matching/data/app_localizations.dart';

const double myHeight = 200;
const double myWidth = 200;
void main() {
  runApp(const SignInLogIn());
}
//Este es blanco, usuario y contraseña
class SignInLogIn extends StatelessWidget {
  const SignInLogIn({super.key});
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
              

          WidgetButton(
              topPadding: Styl.respoHeightMedium(context),
              bottomPadding: Styl.respoHeightSmall(context),
              
              message: (AppLocalizations.of(context)!.translate('CredentialsViewLgIn')),
              isGradient: true,
              printMessage: "Log in pushed",
              logicHere:() 
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const LogInForm()),);
                },
            ),

              SizedBox(height: Styl.respoHeightMedium(context)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: Styl.respoHeightMedium(context)),
                    TextOne(message:(AppLocalizations.of(context)!.translate('CredentialsViewNoCuenta')),),
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
