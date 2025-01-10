import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matching/data/app_data.dart';
import 'package:matching/data/app_localizations.dart';
import 'package:matching/data/central_state.dart';
import 'package:matching/data/data_base_helper.dart';
import 'package:matching/questionare/bienvenida.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/widgets/_input_field.dart';
import 'package:matching/widgets/_responsive_layout_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const NameQs());
}

class NameQs extends StatefulWidget {
  const NameQs({super.key});

  @override
  State<NameQs> createState() => _NameQsState();
}

class _NameQsState extends State<NameQs> {
  //Password thingy
  void _updatePasswordState(bool isValid) {
    setState(() {
      _isButtonEnabled = isValid;
    });
  }

  //Helps interact with the form outside the widget.
  //controller for manipulating data from the textForm.
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _nameController.removeListener(_updateButtonState);
    _emailController.removeListener(_updateButtonState);
    _passwordController.removeListener(_updateButtonState);

    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset: true, // Allow the layout to adjust for the keyboard
    backgroundColor: Styl.azulProfundo,
    appBar: const WidgetCloseAppBar(
      goBack: true,
      lastPageDirection: "/WelcomeQs",
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        padding:const EdgeInsets.symmetric(
          vertical: Styl.verticalPadding,
          horizontal: Styl.horizontalPadding,
        ),
        child:
        ResponsiveLayout(
          children: [
         Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderOne(
                  message: AppLocalizations.of(context)!
                      .translate('NameViewTitle')),
              TextOne(
                message: AppLocalizations.of(context)!
                    .translate('NameViewAdviceOne'),
                topPadding: Styl.sizeBoxSpace,
              ),
              TextOne(
                message: AppLocalizations.of(context)!
                    .translate('NameViewAdviceTwo'),
                xfontWeight: FontWeight.bold,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Styl.sizeBoxSpace),
                      child: InputField(
                        viewLblName: "NameViewLblName",
                        translateError: "nameWarningSpecification",
                        translateTag: "nameWarning",
                        controller: _nameController,
                        hidden: false,
                        onValidationChanged: (bool isValid) {
                          setState(() => _isButtonEnabled = isValid);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Styl.sizeBoxSpace),
                      child: InputField(
                        viewLblName: "emailViewLbl",
                        translateError: "emailWarningSpecification",
                        translateTag: "emailWarning",
                        controller: _emailController,
                        hidden: false,
                        onValidationChanged: (bool isValid) {
                          setState(() => _isButtonEnabled = isValid);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Styl.sizeBoxSpace),
                      child: InputField(
                        viewLblName: "Password",
                        translateError: "passwordWarningSpecification",
                        translateTag: "passwordWarning",
                        controller: _passwordController,
                        hidden: true,
                        onValidationChanged: _updatePasswordState,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
      ),
      )
    ),
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity, // Stretch button horizontally
        height: Styl.buttonHeight, // Fixed height for the button
        child: WidgetButton(
          isEnabled: _isButtonEnabled,
          logicHere: () {
            if (_formKey.currentState?.validate() ?? false) {
              Navigator.pushNamed(context, '/BirthdayQs');

              // Send the data to Central_state.dart for later POST method execution.
              final user = Provider.of<CentralStateModel>(context,
                  listen: false);

              user.setName(_nameController.text);
              user.setName(_passwordController.text);
              user.setName(_emailController.text);
            }
          },
        ),
      ),
    ),
  );
}
}