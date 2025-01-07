import 'package:flutter/material.dart';
import 'package:matching/data/central_state.dart';
import 'package:provider/provider.dart';

import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/fecha_nacimiento.dart';
import 'package:matching/questionare/bienvenida.dart';
import 'package:matching/data/app_data.dart';
import 'package:matching/data/app_localizations.dart';
import 'package:matching/data/data_base_helper.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const NameQs());
}

class NameQs extends StatefulWidget {
  const NameQs({super.key});
  

  @override
  State<NameQs> createState() => _NameQsState();
}

class _NameQsState extends State<NameQs> {
  //Helps interact with the form outside the widget.
  final _formKey = GlobalKey<FormState>();
  //controller for manipulating data from the textForm.
  final TextEditingController _nameController = TextEditingController();

  

  bool _isButtonEnabled = false; //ERROR: Cambiame a false antes de usar.

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updateButtonState);
  }
  


  @override
  void dispose() {
    _nameController.removeListener(_updateButtonState);
    _nameController.dispose();
    super.dispose();
  }
  
  


  @override
  Widget build(BuildContext context) {
    const Color textColor = Styl.textColorShade;
    const Color textBaseColor = Styl.textColorBase;

    return Scaffold(
      backgroundColor: Styl.bgBase,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPage: WelcomeQs(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Styl.verticalPadding,
          horizontal: Styl.horizontalPadding,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderOne(
                  message: AppLocalizations.of(context)!
                      .translate('NameViewTitle')),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    fillColor: Styl.bgBase,
                    contentPadding: const EdgeInsets.only(bottom: 0.0),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: textColor),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: textBaseColor),
                    ),
                    focusColor: textBaseColor,
                    labelText: AppLocalizations.of(context)!
                        .translate('NameViewLblName'),
                    labelStyle: const TextStyle(color: textColor),
                  ),
                  maxLength: 30,
                  // Validation Logic
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return  AppLocalizations.of(context)!.translate('nameVal');
                    }
                    // Regex for names only acceted vocals and letters and spaces.
                    if (!RegExp(TypeValidation.valsForNames).hasMatch(value)) {
                      return AppLocalizations.of(context)!.translate('nameValSpecification');
                    }
                    return null;
                  },

                ),
              ),
              TextOne(
                  message: AppLocalizations.of(context)!
                      .translate('NameViewAdviceOne')),
              TextOne(
                message: AppLocalizations.of(context)!
                    .translate('NameViewAdviceTwo'),
                xfontWeight: FontWeight.bold,
              ),
              WidgetButton(
                isEnabled: _isButtonEnabled, 
                logicHere: ()  {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.pushNamed(context, '/BirthdayQs');
                    //This will send the data to Central_state.dart for later post method exec.
                    final user = Provider.of<CentralStateModel>(context, listen: false);
                    user.setName(_nameController.text);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
