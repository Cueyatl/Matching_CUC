import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:matching/data/app_data.dart';
import 'package:matching/data/app_localizations.dart';
import 'package:matching/data/central_state.dart';
import 'package:matching/questionare/genero.dart';
import 'package:matching/questionare/nombre.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/widgets/_responsive_layout_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const BirthdayQs());
}

class BirthdayQs extends StatefulWidget {
  const BirthdayQs({super.key});

  @override
  BirthdayQsState createState() => BirthdayQsState();
}

class BirthdayQsState extends State<BirthdayQs> {
  int _currentValue = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styl.azulProfundo,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPageDirection: "/Name",
      ),
      body: 
      ResponsiveLayout(
        verticalPadding: Styl.verticalPadding,
        horizontalPadding: Styl.horizontalPadding,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderOne(
                message: AppLocalizations.of(context)!.translate('BirthdayViewTitle'),
              ),
              TextOne(
                message: AppLocalizations.of(context)!.translate('BirthdayViewDescription'),
                bottomPadding: Styl.sizeBoxSpace,
              ),

              
            ],
          ),
          Center(child: 
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NumberPicker(
                itemCount: 5,
                textStyle: const TextStyle(
                  color: Styl.cieloNevado,
                  fontSize: Styl.textOneSize,
                ),
                selectedTextStyle: const TextStyle(
                  color: Styl.rosaFantasia,
                  fontSize: Styl.headerOneSize,
                ),
                value: _currentValue,
                minValue: 16,
                maxValue: 100,
                onChanged: (value) => setState(() => _currentValue = value),
              ),
              TextOne(
                message: '${AppLocalizations.of(context)!.translate('YourAge')} $_currentValue',
              ),
            ],
          ),
          ),
            const SizedBox(height: Styl.sizeBoxSpace),

          const Spacer(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          height: Styl.buttonHeight,
          child: WidgetButton(
            isEnabled: true,
            logicHere: () {
              final user =
                  Provider.of<CentralStateModel>(context, listen: false);
              user.setAge(_currentValue);
              Navigator.pushNamed(context, '/GenderQs');
            },
          ),
        ),
      ),
    );
  }
}
