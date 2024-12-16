import 'package:flutter/material.dart';
import 'package:matching/data/app_data.dart'; // Archivo con datos de la aplicación.
import 'package:matching/data/app_localizations.dart'; // Clase para manejar traducciones de la app.

// Widget personalizado para un botón reutilizable en la aplicación.
class WidgetButton extends StatelessWidget {
  // Propiedades del botón (parámetros).
  final double topPadding; // Espaciado superior.
  final double bottomPadding; // Espaciado inferior.
  final String message; // Mensaje personalizado que se muestra en el botón.
  final bool acceptOrContinue; // Define si el botón será de tipo 'Aceptar' o 'Continuar'.
  final double? buttonWidth; // Ancho del botón (opcional, por defecto ocupa todo el ancho).
  final bool isGradient; // Define si el botón tendrá un fondo con gradiente o no.
  final String printMessage; // Mensaje impreso en consola cuando se presiona el botón.
  final VoidCallback? logicHere; // Función lógica opcional que se ejecuta al presionar el botón.

  // Constructor con parámetros opcionales y valores por defecto.
  const WidgetButton({
    super.key,
    this.topPadding = 0.0, // Valor por defecto del espaciado superior.
    this.message = "", // Valor por defecto del mensaje.
    this.acceptOrContinue = true, // Por defecto, el botón es del tipo "Aceptar".
    this.buttonWidth, // Si no se proporciona, el ancho será infinito.
    this.bottomPadding = 0.0, // Valor por defecto del espaciado inferior.
    this.isGradient = false, // Por defecto, no tiene un fondo con gradiente.
    this.printMessage = "Button Pressed", // Mensaje predeterminado para la consola.
    this.logicHere, // Función opcional a ejecutar.
  });

  @override
  Widget build(BuildContext context) {
    // Definir el mensaje a mostrar en el botón.
    String message;

    // Si no se proporciona un mensaje, se usa un texto predeterminado traducido.
    if (this.message == "") {
      message = acceptOrContinue
          ? AppLocalizations.of(context)!
              .translate('ButtonTextAcString') // Texto para botón "Aceptar".
          : AppLocalizations.of(context)!
              .translate('ButtonTextConString'); // Texto para botón "Continuar".
    } else {
      // Si se proporciona un mensaje, se usa directamente.
      message = this.message;
    }

    // Devuelve un botón estilizado con espaciados y estilos definidos.
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding, // Aplica espaciado superior.
        bottom: bottomPadding, // Aplica espaciado inferior.
      ),
      child: Center(
        child: Container(
          width: buttonWidth ?? double.infinity, // Si no se proporciona, ocupa todo el ancho.
          height: 50.0, // Altura fija del botón.
          decoration: isGradient
              ? BoxDecoration(
                  // Estilo de fondo con gradiente.
                  gradient: const LinearGradient(
                    colors: [
                      Styl.textColorPink, // Color inicial del gradiente.
                      Styl.textColorPinkAccent, // Color final del gradiente.
                    ],
                  ),
                  borderRadius: BorderRadius.circular(14), // Bordes redondeados.
                )
              : BoxDecoration(
                  // Estilo de fondo sólido (blanco) con borde gris.
                  color: Colors.white,
                  border: Border.all(color: Colors.grey), // Borde gris.
                  borderRadius: BorderRadius.circular(14), // Bordes redondeados.
                ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent, // Fondo transparente para permitir gradientes.
              shadowColor: Colors.transparent, // Elimina sombra para mantener estilo plano.
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14), // Bordes redondeados del botón.
              ),
            ),
            onPressed: () {
              print(printMessage); // Imprime un mensaje en consola al presionar el botón.
              if (logicHere != null) {
                logicHere!(); // Ejecuta la función lógica si se proporciona.
              }
            },
            child: Text(
              message, // Mensaje del botón.
              style: TextStyle(
                fontSize: Styl.p3(context), // Tamaño de fuente dinámico.
                fontWeight: FontWeight.bold, // Texto en negrita.
                color: isGradient
                    ? Colors.white // Texto blanco para botones con gradiente.
                    : Styl.textColorBase, // Color base del texto para botones sólidos.
              ),
            ),
          ),
        ),
      ),
    );
  }
}
