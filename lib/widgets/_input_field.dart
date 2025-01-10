import 'package:flutter/material.dart';
import 'package:matching/data/app_localizations.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/data/app_data.dart'; // for Styl
import 'package:matching/data/data_base_helper.dart'; // for TypeValidation

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<bool> onValidationChanged;
  final String translateTag;
  final String translateError;
  final String viewLblName;
  final bool hidden;

  const InputField({
    super.key,
    required this.controller,
    required this.onValidationChanged,
    required this.viewLblName,
    required this.translateTag,
    required this.translateError,
    this.hidden=false
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  /// Local key for validating only this form.
  final _fieldKey = GlobalKey<FormState>();
bool _obscureText = true; // T
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
    const Color textColor = Styl.grisNevado;
    const Color textBaseColor = Styl.cieloNevado;

    return Form(
      key: _fieldKey,
      child: TextFormField(
        controller: widget.controller,
        style: const TextStyle(
          color: Styl.cieloNevado, // Change input text color
          fontSize: 16.0, // Adjust font size
          fontWeight: FontWeight.normal, // Customize weight
        ),
         obscureText: widget.hidden ? _obscureText : false, // Toggle password visibility
        decoration: InputDecoration(
          fillColor: Styl.azulProfundo,
          contentPadding: const EdgeInsets.only(bottom: 0.0),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: textColor),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: textBaseColor),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Styl.naranjaLava),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Styl.naranjaLava),
          ),
          focusColor: textBaseColor,
          labelText:
              AppLocalizations.of(context)!.translate(widget.viewLblName),
          labelStyle: const TextStyle(color: textColor),
          errorStyle: const TextStyle(
            color: Styl.cieloNevado, // Change the error message color
            fontSize: 12.0, // Adjust the font size
            fontWeight: FontWeight.bold, // Optional: make the text bold
          ),
            suffixIcon: widget.hidden
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: textColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null, 
        ),
        
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.translate(widget.translateTag);
          }
          // Regex for Names only accepted: vowels, letters, and spaces
          if (!RegExp(TypeValidation.valsForNames).hasMatch(value)) {
            return AppLocalizations.of(context)!
                .translate(widget.translateError);
          }
          return null;
        },
      ),
    );
  }
}
