import 'package:flutter/material.dart';
// import '../widgets/_gradient_widget.dart';
import 'package:matching/widgets/_logo_widget.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/questionare/one_welcome.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/data/app_data.dart';
const double myHeight = 200;
const double myWidth = 200;
void main() {
  runApp(const LogInForm());
}

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
              
              const Padding(
              padding: EdgeInsets.symmetric(vertical: Styl.verticalPadding, horizontal: Styl.horizontalPadding),
              child:  HeaderOne(message: CredentialsView.title, xTextAlign: TextAlign.center,),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: Styl.verticalPadding, horizontal: Styl.horizontalPadding),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Styl.bgBase,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0)),
                    labelText: CredentialsView.tgUser,
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
                    labelText: CredentialsView.tgPass,
                  ),
                ),
              ),
            // HELLo
          WidgetButton(
              topPadding: Styl.respoHeightMedium(context),
              bottomPadding: Styl.respoHeightSmall(context),
              message: CredentialsView.lgIn,
              isGradient: true,
              printMessage: "Log in pushed",
            ),

              SizedBox(height: Styl.respoHeightMedium(context)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: Styl.respoHeightMedium(context)),
                    TextOne(message: CredentialsView.noCuenta.substring(0,20)),
                    GestureDetector(
                      onTap: () {
                        
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const WelcomeQs()),);
                        print('Navigate to welcoming of Sign in form');
                        
                      },
                      child:  Text(
                        CredentialsView.sgnRegister,
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
