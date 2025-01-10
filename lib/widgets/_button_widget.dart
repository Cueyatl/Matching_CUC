import 'package:flutter/material.dart';
import 'package:matching/data/app_data.dart'; // Archivo con datos de la aplicación.
import 'package:matching/data/app_localizations.dart'; // Clase para manejar traducciones de la app.

class WidgetButton extends StatelessWidget {
  final String message; // Mensaje personalizado que se muestra en el botón.
  final VoidCallback? logicHere; // Función lógica opcional que se ejecuta al presionar el botón.
  final bool isEnabled; // Determina si el botón está habilitado.

  const WidgetButton({
    super.key,
    this.message = "", // Valor por defecto del mensaje.
    this.logicHere, // Función opcional a ejecutar.
    this.isEnabled = false, // Por defecto, el botón está deshabilitado.
  });

  @override
  Widget build(BuildContext context) {
    // Define el mensaje predeterminado si no se proporciona.
    final buttonText = message.isNotEmpty
        ? message
        : AppLocalizations.of(context)!.translate('ButtonTextDefault');

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Styl.azulProfundo,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
          ), // Remove padding for full gradient effect.
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners for the button.
        ),
      ),
      onPressed: isEnabled ? logicHere : null, // Activa o desactiva el botón.
      child: Ink(
        decoration: BoxDecoration(
          gradient:const LinearGradient(
            colors: [Styl.rosaFantasia, Styl.azulReal], // Gradient colors.
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12), // Match the shape of the button.
        ),
        child: Container(
          alignment: Alignment.center, // Centers the text.
          padding: const EdgeInsets.symmetric(vertical: 16), // Button height.
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Styl.cieloNevado, // Text color.
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
