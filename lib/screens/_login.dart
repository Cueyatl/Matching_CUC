import 'package:flutter/material.dart';
// import '../widgets/_gradient_widget.dart';
import 'package:matching/widgets/_logo_widget.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/questionare/_one_welcome.dart';
import 'package:matching/widgets/_text_style_widget.dart';

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
        color: Colors.white,
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
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              child:  HeaderOne(message: "¡Bienvenido de vuelta!", xTextAlign: TextAlign.center,),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0)),
                    labelText: 'Usuario o correo electrónico',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0)),
                    labelText: 'Contraseña',
                  ),
                ),
              ),
            // HELLo
          const WidgetButton(
              topPadding: 10.0,
              bottomPadding: 10.0,
              message: "Iniciar sesión",
              isGradient: true,
              printMessage: "Log in pushed",
            ),

              const SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("¿Todavía no tienes una cuenta?"),
                    GestureDetector(
                      onTap: () {
                        
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const WelcomeQs()),);
                        print('Navigate to welcoming of Sign in form');
                        
                      },
                      child: const Text(
                        " Regístrate aquí.",
                        style: TextStyle(
                          color: Colors.black,
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
