import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for inputFormatters
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:intl/intl.dart';
import 'package:matching/questionare/nombre.dart';
import 'package:matching/questionare/genero.dart';
import 'package:matching/data/app_data.dart';
import 'package:matching/data/app_localizations.dart';

void main() {
  runApp(const BirthdayQs());
}

class BirthdayQs extends StatefulWidget {
  const BirthdayQs({super.key});

  @override
  BirthdayQsState createState() => BirthdayQsState();
}

//funny looking class
class BirthdayQsState extends State<BirthdayQs> {
  // Focus nodes for each TextFormField

  final FocusNode _focusNodeDD = FocusNode();
  final FocusNode _focusNodeMM = FocusNode();
  final FocusNode _focusNodeYYYY = FocusNode();


/* Logic:
ALL spaces need a controller for checking its status
It can work with a data formatter, when data change accordingly.

import 'package:intl/intl.dart';

void calculateAge(String birthdate) {
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  final DateTime today = DateTime.now();

  try {
    DateTime parsedDate = formatter.parse(birthdate);
    int age = today.year - parsedDate.year;

    if (today.month < parsedDate.month ||
        (today.month == parsedDate.month && today.day < parsedDate.day)) {
      age--;
    }

    if (age < 18) {
      print("Access denied");
    } else {
      print("Your age is $age");
    }
  } catch (e) {
    print("Invalid date format. Please use DD/MM/YYYY.");
  }
}

*/




  @override
  Widget build(BuildContext context) {
        const Color textColor = Styl.textColorShade;
    final List<Map<String, dynamic>> dateFields = [
    {
      "hint": "DD",
      "maxLength": 2,
      "focusNode": _focusNodeDD,
      "nextFocusNode": _focusNodeMM,
      "controller": TextEditingController(),
    },
    {
      "hint": "MM",
      "maxLength": 2,
      "focusNode": _focusNodeMM,
      "nextFocusNode": _focusNodeYYYY,
      "controller": TextEditingController(),
    },
    {
      "hint": "YYYY",
      "maxLength": 4,
      "focusNode": _focusNodeYYYY,
      "nextFocusNode": null,
      "controller": TextEditingController(),
    },
  ];
  final formKey = GlobalKey<FormState>();
  void _validateAndSubmit() {
    if (formKey.currentState!.validate()) {
      final String day = dateFields[0]["controller"].text;
      final String month = dateFields[1]["controller"].text;
      final String year = dateFields[2]["controller"].text;

      try {
        final birthDate = DateTime(
          int.parse(year),
          int.parse(month),
          int.parse(day),
        );
        final DateTime today = DateTime.now();
        int age = today.year - birthDate.year;
        if (today.month < birthDate.month ||
            (today.month == birthDate.month && today.day < birthDate.day)) {
          age--;
        }

        if (age < 18) {
          // _showError("Access denied. You must be at least 18 years old.");
        } else {
          // _showSuccess("Access granted!");
        }
      } catch (_) {
        // _showError("Invalid date. Please check your input.");
      }
    }
  }
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Titulo
            HeaderOne(
              message:
                  AppLocalizations.of(context)!.translate('BirthdayViewTitle'),
            ),
            TextOne(
              message: AppLocalizations.of(context)!
                  .translate('BirthdayViewDescription'),
              xfontColor: textColor,
            ),

            Row(
  children: [
    // Bucle que recorre cada elemento de la lista 'dateFields' para generar los campos de texto.
    for (int i = 0; i < dateFields.length; i++) ...[
      Expanded(
        
        // #Textformfield {#6f5,25}
        child: TextFormField(
          keyboardType: TextInputType.number, // Define el teclado numérico.
          inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Solo permite números.
          maxLength: dateFields[i]["maxLength"], // Define la longitud máxima del campo.
          textAlign: TextAlign.center, // Alinea el texto al centro.
          focusNode: dateFields[i]["focusNode"], // Asigna el nodo de enfoque actual.
          controller: dateFields[i]["Controller"],
          decoration: InputDecoration(
            counterText: '', // Elimina el contador de caracteres por defecto.
            border: InputBorder.none, // Sin borde.
            contentPadding: const EdgeInsets.only(bottom: 0.0), // Ajusta el espacio interno.
            hintText: dateFields[i]["hint"], // Texto de sugerencia (DD, MM o YYYY).
            hintStyle: TextStyle(
              letterSpacing: 8.0, // Ajusta el espaciado entre letras.
              color: textColor, // Color del texto.
              fontSize: Styl.p3(context), // Tamaño de la fuente ajustado según el contexto.
            ),
          ),
          validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Required";
                        }
                        if (!RegExp(r'^\d+$').hasMatch(value)) {
                          return "Only numbers allowed";
                        }
                        if (i == 0 && (int.tryParse(value) ?? 0) > 31) {
                          return "Invalid day";
                        }
                        if (i == 1 && (int.tryParse(value) ?? 0) > 12) {
                          return "Invalid month";
                        }
                        if (i == 2 && (int.tryParse(value)?.toString().length != 4)) {
                          return "Invalid year";
                        }
                        return null;
                      },
            
          // Manejo del cambio de texto: si se completa el campo, pasa al siguiente nodo de enfoque.
          onChanged: (value) {
            if (value.length == dateFields[i]["maxLength"] &&
                dateFields[i]["nextFocusNode"] != null) {
              FocusScope.of(context).requestFocus(dateFields[i]["nextFocusNode"]);
            }
          },
        ),
      ),
      // Agrega un separador "/" después de cada campo, excepto el último.
      if (i < dateFields.length - 1)
        const TextOne(
          message: "/",
        ),
    ],
    // Espaciado adicional después de los campos de texto.
    SizedBox(width: Styl.respoSmall(context)),
  ],
),
            SizedBox(height: Styl.respoHeightMedium(context)),

            
            WidgetButton(
              topPadding: Styl.respoHeightMedium(context),
              bottomPadding: Styl.respoHeightSmall(context),
              acceptOrContinue: false,
              isGradient: true,
              logicHere: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const GenderQs()));
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
