import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
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
  double _currentHeight = 160; // Valor inicial de la altura

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: Styl.azulProfundo,
        appBar: const WidgetCloseAppBar(
          goBack: true,
          lastPageDirection: 'GenderQs',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Styl.verticalPadding,
            horizontal: Styl.horizontalPadding,
          ),
          child: Column(
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
                      min: 100,
                      max: 240,
                      divisions: 140, // Number of integer steps
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
        ),
      ),
    );
  }
}
