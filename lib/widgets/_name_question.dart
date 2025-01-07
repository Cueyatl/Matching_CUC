import 'package:flutter/material.dart';
import 'package:matching/data/app_localizations.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/data/app_data.dart'; // for Styl
import 'package:matching/data/data_base_helper.dart'; // for TypeValidation

class NameInputField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<bool> onValidationChanged;

  const NameInputField({
    Key? key,
    required this.controller,
    required this.onValidationChanged,
  }) : super(key: key);

  @override
  State<NameInputField> createState() => _NameInputFieldState();
}

class _NameInputFieldState extends State<NameInputField> {
  /// Local key for validating only this form.
  final _fieldKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_validateField);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_validateField);
    super.dispose();
  }

  /// Called whenever the controller’s text changes.
  void _validateField() {
    bool isValid = _fieldKey.currentState?.validate() ?? false;
    widget.onValidationChanged(isValid);
  }

  @override
  Widget build(BuildContext context) {
    const Color textColor = Styl.textColorShade;
    const Color textBaseColor = Styl.textColorBase;

    return Form(
      key: _fieldKey,
      child: TextFormField(
        controller: widget.controller,
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
          labelText:
              AppLocalizations.of(context)!.translate('NameViewLblName'),
          labelStyle: const TextStyle(color: textColor),
        ),
        maxLength: 30,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.translate('nameVal');
          }
          // Regex for names only accepted: vowels, letters, and spaces
          if (!RegExp(TypeValidation.valsForNames).hasMatch(value)) {
            return AppLocalizations.of(context)!
                .translate('nameValSpecification');
          }
          return null;
        },
      ),
    );
  }
}
