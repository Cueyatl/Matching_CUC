import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/data/central_state.dart';
import 'package:provider/provider.dart';

import 'package:matching/widgets/_text_style_widget.dart';

import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/widgets/_responsive_layout_widget.dart';

import 'package:matching/questionare/preferencia_genero.dart';
import 'package:matching/questionare/preferencia_altura.dart';
import 'package:matching/data/app_data.dart';
import 'package:matching/data/app_localizations.dart';

void main() {
  runApp(const HeigthQs());
}

class HeigthQs extends StatefulWidget {
  const HeigthQs({super.key});

  @override
  _HeigthQsState createState() => _HeigthQsState();
}

class _HeigthQsState extends State<HeigthQs> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double _currentHeight = 120; // Valor inicial de la altura

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: Styl.azulProfundo,
        appBar: const WidgetCloseAppBar(
          goBack: true,
          lastPageDirection: '/CareerQs',
        ),
        body:

          ResponsiveLayout(
        verticalPadding: Styl.verticalPadding,
        horizontalPadding: Styl.horizontalPadding,
        children: [
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderOne(message:AppLocalizations.of(context)!.translate('HeightViewTitle'),),
              SizedBox(height: Styl.respoHeightSmall(context)),
              TextOne(message: AppLocalizations.of(context)!.translate('HeightViewDescription'),
                bottomPadding: Styl.sizeBoxSpace,
              ),
              

              // Slider de altura
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 32.0),
                child: Column(
                  children: [
                    Text(
                      '${_currentHeight.toStringAsFixed(1)} cm',
                      style: TextStyle(
                        fontSize: Styl.p1(context),
                        fontWeight: FontWeight.bold,
                        color: Styl.cieloNevado,
                      ),
                    ),
                    Slider(
                      value: _currentHeight,
                      min: 120,
                      max: 190,
                      divisions: 70, // Number of integer steps
                      label:
                          '${_currentHeight.round()} cm', // Convert to integer without decimals
                      onChanged: (double value) {
                        setState(() {
                          _currentHeight = value
                              .roundToDouble(); // Round to the nearest integer
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
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
              int setHeight=_currentHeight.round();
              final user =
                  Provider.of<CentralStateModel>(context, listen: false);
              user.setHeight(setHeight);
              Navigator.pushNamed(context, '/BodyTypeQs');
            },
          ),
        ),
      ),
      ),
    );
  }
}
