import 'package:flutter/material.dart';
import 'package:matching/data/app_data.dart';
import 'package:matching/data/app_localizations.dart';
import 'package:matching/questionare/nombre.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/widgets/_logo_widget.dart';
import 'package:matching/widgets/_responsive_layout_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';


void main() {
  runApp(const WelcomeQs());
}
class WelcomeQs extends StatelessWidget {
  const WelcomeQs({super.key});
  @override
  Widget build(BuildContext context) {
  //Document Variables.
  
  
    return Scaffold(
      backgroundColor: Styl.azulProfundo,
      appBar: const WidgetCloseAppBar(),
      body: ResponsiveLayout(
        verticalPadding: Styl.verticalPadding,
        horizontalPadding: Styl.horizontalPadding,
        children: [
              Row(
                children: [
                  // WidgetLogo(),
                  Image.asset(
                    scale: 2.4,
                    'images/duotoneHugger.png'),
                  const SizedBox(width: 8),
                ],
              ),
              HeaderOne(message: AppLocalizations.of(context)!.translate('WelcomeViewRuleTwoTitle',)),
              TextOne(message: AppLocalizations.of(context)!.translate('WelcomeViewDescription',)),
              SizedBox(height: Styl.respoHeightMedium(context)),
              HeaderTwo(message: AppLocalizations.of(context)!.translate('WelcomeViewRuleOneTitle',)),
              TextOne(message: AppLocalizations.of(context)!.translate('WelcomeViewRuleOneText',)),
              SizedBox(height: Styl.respoHeightMedium(context)),
              HeaderTwo(message: AppLocalizations.of(context)!.translate('WelcomeViewRuleTwoTitle',)),
              TextOne(message: AppLocalizations.of(context)!.translate('WelcomeViewRuleTwoText' )),
              SizedBox(height: Styl.respoHeightMedium(context)),
              HeaderTwo(message: AppLocalizations.of(context)!.translate('WelcomeViewRuleThreeTitle',)),
              TextOne(message: AppLocalizations.of(context)!.translate('WelcomeViewRuleThreeText' )),
              SizedBox(height: Styl.respoHeightMedium(context)),
              HeaderTwo(message: AppLocalizations.of(context)!.translate('WelcomeViewRuleFourTitle',)),
              TextOne(message: AppLocalizations.of(context)!.translate('WelcomeViewRuleFourText' )),
              const  Spacer(),
              WidgetButton(
                  // topPadding: Styl.respoHeightMedium(context),
                  // bottomPadding: Styl.respoHeightSmall(context),
                  // acceptOrContinue: true,
                  // isGradient: true,
                  isEnabled: true,
                  logicHere: () {
                    Navigator.pushNamed(context, '/Name');
                  },
                )
            ],
          )
      
    );
  }
}
