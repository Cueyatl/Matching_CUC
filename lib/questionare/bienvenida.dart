import 'package:flutter/material.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/widgets/_logo_widget.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/questionare/nombre.dart';
import 'package:matching/data/app_data.dart';
import 'package:matching/data/app_localizations.dart';

void main() {
  runApp(const WelcomeQs());
}
class WelcomeQs extends StatelessWidget {
  const WelcomeQs({super.key});
  @override
  Widget build(BuildContext context) {
  //Document Variables.
  
  
    return Scaffold(
      backgroundColor: Styl.bgBase,
      appBar: const WidgetCloseAppBar(),
      body: Padding(
        padding:const  EdgeInsets.symmetric(
          vertical: Styl.verticalPadding,
          horizontal: Styl.horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  WidgetLogo(),
                  SizedBox(width: 8),
                ],
              ),
              HeaderOne(message: AppLocalizations.of(context)!.translate('WelcomeViewRuleTwoTitle',)),
              TextOne(message: AppLocalizations.of(context)!.translate('WelcomeViewDescription',)),
              SizedBox(height: Styl.respoHeightMedium(context)),
              HeaderThree(message: AppLocalizations.of(context)!.translate('WelcomeViewRuleOneTitle',)),
              TextOne(message: AppLocalizations.of(context)!.translate('WelcomeViewRuleOneText',)),
              SizedBox(height: Styl.respoHeightMedium(context)),
              HeaderThree(message: AppLocalizations.of(context)!.translate('WelcomeViewRuleTwoTitle',)),
              TextOne(message: AppLocalizations.of(context)!.translate('WelcomeViewRuleTwoText' )),
              SizedBox(height: Styl.respoHeightMedium(context)),
              HeaderThree(message: AppLocalizations.of(context)!.translate('WelcomeViewRuleThreeTitle',)),
              TextOne(message: AppLocalizations.of(context)!.translate('WelcomeViewRuleThreeText' )),
              SizedBox(height: Styl.respoHeightMedium(context)),
              HeaderThree(message: AppLocalizations.of(context)!.translate('WelcomeViewRuleFourTitle',)),
              TextOne(message: AppLocalizations.of(context)!.translate('WelcomeViewRuleFourText' )),
              const  Spacer(),
              WidgetButton(
                  // topPadding: Styl.respoHeightMedium(context),
                  // bottomPadding: Styl.respoHeightSmall(context),
                  // acceptOrContinue: true,
                  // isGradient: true,
                  isEnabled: true,
                  logicHere: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NameQs()));
                  },
                )
            ],
          )
      )
    );
  }
}
