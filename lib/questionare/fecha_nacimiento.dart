import 'package:flutter/material.dart';
import 'package:matching/data/central_state.dart';
import 'package:provider/provider.dart';
import 'package:matching/data/app_localizations.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:intl/intl.dart';

import 'package:matching/data/app_data.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/questionare/nombre.dart';
import 'package:matching/questionare/genero.dart';

void main() {
  runApp(const BirthdayQs());
}

class BirthdayQs extends StatefulWidget {
  const BirthdayQs({super.key});

  @override
  BirthdayQsState createState() => BirthdayQsState();
}

class BirthdayQsState extends State<BirthdayQs> {
  // Declare _currentValue outside of the build method, as part of the widget state

  int _currentValue = 16;
  @override
  Widget build(BuildContext context) {
    const Color textColor = Styl.textColorShade;

    return Scaffold(
      backgroundColor: Styl.bgBase,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPage: NameQs(),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Styl.verticalPadding,
            horizontal: Styl.horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titulo
                  HeaderOne(
                    message: AppLocalizations.of(context)!
                        .translate('BirthdayViewTitle'),
                  ),
                  TextOne(
                    message: AppLocalizations.of(context)!
                        .translate('BirthdayViewDescription'),
                    xfontColor: textColor,
                  ),
                  SizedBox(height: Styl.respoHeightXLarge(context)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  NumberPicker(
                    value: _currentValue,
                    minValue: 16,
                    maxValue: 100,
                    onChanged: (value) => setState(() => _currentValue = value),
                  ),
                  TextOne(
                    message:
                        '${AppLocalizations.of(context)!.translate('YourAge')} $_currentValue',
                  )
                ],
              ),
              SizedBox(height: Styl.respoHeightMedium(context)),
              WidgetButton(
                isEnabled: true,
                logicHere: () {
                        final user = Provider.of<CentralStateModel>(context, listen: false);
                        user.setAge(_currentValue);
                        Navigator.pushNamed(context, '/GenderQs');


                },
              ),
            ],
          )),
    );
  }
}
