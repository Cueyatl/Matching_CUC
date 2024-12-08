import 'package:flutter/material.dart';
import 'package:matching/data/app_data.dart';
import '../widgets/_gradient_widget.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/screens/login.dart';
import 'package:matching/questionare/one_welcome.dart';

const double myHeight = 200;
const double myWidth = 200;
void main() {
  runApp(const SignInLogIn());
}

class SignInLogIn extends StatelessWidget {
  const SignInLogIn({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: gradientDecor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: Image.asset(
                      'images/logo.png',
                      width: myWidth,
                      height: myHeight,
                      fit: BoxFit.cover,
                    ),
                  )),
              WidgetButton(
                topPadding: 2.0,
                bottomPadding: 2.0,
                message: CredentialsView.lgIn,
                isGradient: false,
                printMessage: "Log in pushed",
                logicHere: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const LogInForm()),);
                },
              ),
              SizedBox(height: Styl.respoHeightMedium(context)),
              SizedBox(height: Styl.respoHeightXLarge(context)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: Styl.respoHeightSmall(context)),
                    Text(CredentialsView.noCuenta.substring(0,21)),
                    GestureDetector(
                      onTap: () {
                        // Replace with your registration URL logic
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const WelcomeQs()),);
                        print('Navigate to welcoming of Sign in form');
                      },

                      child:  Text(
                        CredentialsView.sgnRegister,
                        style:const TextStyle(
                          color:Styl.textColorBase,
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
