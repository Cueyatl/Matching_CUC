import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:matching/data/app_data.dart';
import 'package:matching/data/app_localizations.dart';
import 'package:matching/questionare/bienvenida.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_logo_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';


const double myHeight = 200;
const double myWidth = 200;

//Este es blanco, usuario y contraseña
class LogInForm extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  const LogInForm({required this.onLocaleChange, super.key});

  @override
  LogInFormState createState() => LogInFormState();
}

class LogInFormState extends State<LogInForm> {
  //Debug info, warning and error logs
  var logger = Logger();
  int initialLabelIndex = 1; // Default value for the toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Styl.azulProfundo,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topRight, // Aligns the toggle to the right
                child: Wrap(
                  children: [
                    SizedBox(
                      height: 50,
                      child: ToggleSwitch(
                        minWidth: 90.0,
                        initialLabelIndex: initialLabelIndex,
                        cornerRadius: 20.0,
                        activeFgColor: Styl.cieloNevado,
                        inactiveBgColor: Styl.cieloNevado,
                        inactiveFgColor: Styl.azulReal,
                        totalSwitches: 2,
                        labels: [
                          AppLocalizations.of(context)!.translate("Spanish"),
                          AppLocalizations.of(context)!.translate("English"),
                        ],
                        // ignore: prefer_const_literals_to_create_immutables
                        activeBgColors: [
                          // ignore: prefer_const_literals_to_create_immutables
                          [Styl.azulReal],
                          // ignore: prefer_const_literals  _to_create_immutables
                          const [Styl.azulReal]
                        ],
                        onToggle: (index) {
                          setState(() {
                            initialLabelIndex = index!;
                          });
                          if (index == 0) {
                            widget.onLocaleChange(const Locale('es'));
                          } else if (index == 1) {
                            widget.onLocaleChange(const Locale('en'));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const WidgetLogo(
                topPadding: 30,
                logoWidth: myWidth,
                logoHeight: myHeight,
                bottomPadding: 0.0,
                gradient: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Styl.verticalPadding,
                    horizontal: Styl.horizontalPadding),
                child: HeaderOne(
                  message: (AppLocalizations.of(context)!
                      .translate('CredentialsViewTitle')),
                  xTextAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Styl.verticalPadding,
                    horizontal: Styl.horizontalPadding),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Styl.azulProfundo,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11.0),
                      borderSide:const BorderSide(
                        color: Styl.cieloNevado, // Color when not selected
                        width: 2.0, // Border width when not selected
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11.0),
                      borderSide:const BorderSide(
                        color: Styl.azulReal, // Color when selected
                        width: 2.0, // Border width when selected
                      ),
                    ),
                    labelText: AppLocalizations.of(context)!
                        .translate('CredentialsViewTgUser'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: Styl.verticalPadding,
                    horizontal: Styl.horizontalPadding),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Styl.azulProfundo,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11.0),
                      borderSide:const BorderSide(
                        color: Styl.cieloNevado, // Color when not selected
                        width: 2.0, // Border width when not selected
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11.0),
                      borderSide:const BorderSide(
                        color: Styl.azulReal, // Color when selected
                        width: 2.0, // Border width when selected
                      ),
                    ),
                    labelText: AppLocalizations.of(context)!
                        .translate('CredentialsViewTgPass'),
                  ),
                ),
              ),
              WidgetButton(
                // topPadding: Styl.respoHeightMedium(context),
                // bottomPadding: Styl.respoHeightSmall(context),
                message: (AppLocalizations.of(context)!
                    .translate('CredentialsViewLgIn')),
                logicHere: (){ Navigator.pushNamed(context, '/SwipeCardsClass');}
              ),
              SizedBox(height: Styl.respoHeightMedium(context)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: Styl.respoHeightMedium(context)),
                    TextOne(
                        message: AppLocalizations.of(context)!
                            .translate('CredentialsViewNoCuenta')),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/WelcomeQs');
                        logger.i('Navigate to welcoming of Sign in form');
                      },
                      child: Text(
                        (AppLocalizations.of(context)!
                            .translate('CredentialsViewSgnRegister')),
                        style: TextStyle(
                          fontSize: Styl.p3(context),
                          color: Styl.amarilloNeon,
                          decoration: TextDecoration.underline,
                          decorationColor: Styl.amarilloNeon
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
