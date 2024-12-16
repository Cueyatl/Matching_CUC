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

class BirthdayQsState extends State<BirthdayQs> {
  // Focus nodes for each TextFormField

  final FocusNode _focusNodeDD = FocusNode();
  final FocusNode _focusNodeMM = FocusNode();
  final FocusNode _focusNodeYYYY = FocusNode();

  @override
  void dispose() {
    // Dispose of the FocusNodes when no longer needed
    _focusNodeDD.dispose();
    _focusNodeMM.dispose();
    _focusNodeYYYY.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> dateFields = [
      {
        "hint": "DD",
        "maxLength": 2,
        "focusNode": _focusNodeDD,
        "nextFocusNode": _focusNodeMM,
      },
      {
        "hint": "MM",
        "maxLength": 2,
        "focusNode": _focusNodeMM,
        "nextFocusNode": _focusNodeYYYY,
      },
      {
        "hint": "YYYY",
        "maxLength": 4,
        "focusNode": _focusNodeYYYY,
        "nextFocusNode": null,
      },
    ];
  //LOGICA
    const Color textColor = Styl.textColorShade;
// Obtener la fecha y hora actual.
DateTime now = DateTime.now();

// Formatear la fecha actual al formato "dd/MM/yyyy".
String formattedDate = DateFormat('dd/MM/yyyy').format(now);

// Extraer el año actual (los últimos 4 caracteres de la fecha formateada).
String getYears = formattedDate.substring(6, 10);

// Calcular el año mínimo legal restando 18 años al año actual.
int minimunLegalYear = int.parse(getYears) - 18;

// Reemplazar el año actual en la fecha formateada con el año mínimo legal.
String legalDate =
    formattedDate.replaceRange(6, null, minimunLegalYear.toString());

// Mostrar el resultado (para depuración, si es necesario).
print("Fecha actual: $formattedDate"); 
print("Fecha legal mínima: $legalDate");

// -----------------------------------------
// Lógica para validar datos de fechas ingresadas
// -----------------------------------------


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

            Row(
  children: [
    // Bucle que recorre cada elemento de la lista 'dateFields' para generar los campos de texto.
    for (int i = 0; i < dateFields.length; i++) ...[
      Expanded(
        child: TextFormField(
          keyboardType: TextInputType.number, // Define el teclado numérico.
          inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Solo permite números.
          maxLength: dateFields[i]["maxLength"], // Define la longitud máxima del campo.
          textAlign: TextAlign.center, // Alinea el texto al centro.
          focusNode: dateFields[i]["focusNode"], // Asigna el nodo de enfoque actual.
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
            TextOne(
              message: AppLocalizations.of(context)!
                  .translate('BirthdayViewDescription'),
              xfontColor: textColor,
            ),

            WidgetButton(
              topPadding: Styl.respoHeightMedium(context),
              bottomPadding: Styl.respoHeightSmall(context),
              acceptOrContinue: false,
              isGradient: true,
              logicHere: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const GenderQs()));
                print(formattedDate);
                print(minimunLegalYear);
                print(legalDate);
              },
            ),
          ],
        ),
      ),
    );
  }
}
