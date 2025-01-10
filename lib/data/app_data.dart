import 'package:flutter/material.dart';
import 'package:matching/data/app_localizations.dart';
import 'package:logger/logger.dart';



var logger = Logger();
class OptionsData {
  final List<String> _career = [
    'QuestionOptionsLbladmin',
    'QuestionOptionsLblCont',
    'QuestionOptionsLblBio',
    'QuestionOptionsLblInd',
    'QuestionOptionsLblSis',
    "QuestionOptionsLblCareers",
  ];
  
  final List<String> _gender = [
    "QuestionOptionsLblMan",
    "QuestionOptionsLblWoman",
    "QuestionOptionsLblGenders",
  ];

  final List<String> _height = [
    "HeightViewLblHighQ",
    "HeightViewLblMidQ",
    "HeightViewLblLowQ",
    "HeightViewLblAllQ",
  ];

  final List<String> _skinColor = [
    "ColorDePielUno",
  "ColorDePielDos",
  "ColorDePielTres",
  "ColorDePielCuatro",
  "ColorDePielCinco",
  "ColorDePielSeis",
  "ColorDePielSiete",
  "ColorDePielOcho",
  ];
  final List<String> _bodyType = [
    "ComplexionUno",
    "ComplexionDos",
    "ComplexionTres",
  ];

  final List<String> _personalityType=[
    "PersonalidadUno",
    "PersonalidadDos",
  ];
  List<String> get careerOptions => _career;

  List<String> get genderOptions => _gender;
  
  List<String> get heightOptions => _height;

  List<String> get skinColorOptions => _skinColor;

  List<String> get bodyTypeOptions => _bodyType;

  List<String> get personalityTypeOptions => _personalityType;
  
}

class OptionsHelper{
    late BuildContext context;
    late List<String> optionMap;
    late bool isPreference;
    late int? buttonIndex;
    List<int>? selectedPreferencesInput;
      OptionsHelper({
    required this.context,
    required this.optionMap,
    required this.isPreference,
    required this.buttonIndex,    
  });

    List<Map<String, dynamic>> generateOptionMap() {
    int optionMapLength = isPreference? optionMap.length : optionMap.length-1;
      return List<Map<String, dynamic>>.generate(
        optionMapLength,
          (index) => {
            'label': AppLocalizations.of(context)!.translate(optionMap[index]),
            'index': index + 1,
          },
      );
    }
  late List<Map<String, dynamic>> optionMapGenerated = generateOptionMap();
    
  void onMultipleButtonSelected(){
    
    int newButtonIndex = buttonIndex ?? 0;
    List<int> selectedPreferences = selectedPreferencesInput ?? [];
    if (selectedPreferences.contains(buttonIndex)) {
      selectedPreferences.remove(buttonIndex); // Deselect
    } else {
      selectedPreferences.add(newButtonIndex); // Select
    }
    Map<String, dynamic> lastElement = optionMapGenerated.last;
    dynamic lastItem = lastElement['index'];
    
    if (buttonIndex == lastItem) {
      selectedPreferences.clear();
      selectedPreferences.add(lastItem);
    } else {
      // If lastItem was in there before, remove it once another is selected
      if (selectedPreferences.contains(lastItem)) {
        selectedPreferences.remove(lastItem);
      }
    }

    logger.i( "last item $lastItem");
    logger.i( "button index $buttonIndex");
  }
  
  

  String singleListParser() {
    final option = optionMapGenerated.firstWhere((element) => element['index'] == buttonIndex);
    return option['label'] as String;
  }

  late String? setSingleData= singleListParser();


List<String> multiplelistParser(
    List<int>? selectedIndices,
  ) {
    if (selectedIndices == null || selectedIndices.isEmpty) {
      return [];
    }

    return selectedIndices.map((index) {
      final option = optionMapGenerated.firstWhere(
        (element) => element['index'] == index,
        orElse: () => {'label': 'N/A'}, // Fallback if not found
      );
      return option['label'] as String;
    }).toList();
  }
  


}

class TypeValidation{
  static const String valsForNames=r"^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s]+$";
}
class Styl {

//   Colores
// Fondo
// #05182d: "Azul Profundo Nocturno"

// Colores principales
// #144daf: "Azul Real Vibrante"
// #e1eaf2: "Cielo Nevado"

// Colores secundarios
// #e789ef: "Rosa Fantasía"
// #f8ff15: "Amarillo Neón"
// #f8680b: "Naranja Lava"
// #aeb7bf: "Gris Nevado"

  static const double topP = 40.0;
  static const double bottomP = 10.0;
  
  static const Color azulProfundo = Color(0XFF05182d);
  static const Color azulReal = Color(0XFF144daf);
  static const Color cieloNevado = Color(0xffe1eaf2);
  static const Color grisNevado =Color(0XFFaeb7bf);
  static const Color rosaFantasia = Color(0xFFe789ef);
  static const Color naranjaLava =Color(0XFFf8680b);
  static const Color amarilloNeon =Color(0XFFf8ff15);

  
// ##################### NOOOOO
  
  
  

  static const double heightSBoxSmall = 0.001;
  static const double heightSBoxMedium = 0.02;
  static const double heightSBoxLarge = 0.03;
  static const double heightSBoxXlarge = 0.04;

  static const double pSizeSmall = 0.35;
  static const double pSizeMedium = 0.04;
  static const double pSizeLarge = 0.06;
  static const double pSizeXLarge = 0.08;
  // ############## YESSS

  static const double headerOneSize =35.0;
  static const double headerTwoSize =20.0;
  static const double textOneSize =18.0;

  static const double letterSpacing =2.0;
  static const double wordSpacing =1.0;

  static const double sizeBoxSpace =24.0;
  static const double buttonHeight =76.0;

  static const double verticalPadding = 4.0;
  static const double horizontalPadding = 24.0;
  static const double horizontalPaddingSmall = 40.0;

  //OPTION BUTTONS
  static const double spaceBetweenButtons= 14;
  


  static double respoLarge(BuildContext context) {
    return MediaQuery.of(context).size.width * Styl.heightSBoxMedium;
  }

  static double respoMedium(BuildContext context) {
    return MediaQuery.of(context).size.width * Styl.heightSBoxSmall;
  }

  static double respoSmall(BuildContext context) {
    return MediaQuery.of(context).size.width * Styl.heightSBoxLarge;
  }

  static double respoXLarge(BuildContext context) {
    return MediaQuery.of(context).size.width * Styl.heightSBoxXlarge;
  }

// Fontsize 16, 18, 20, 24
  static double p4(BuildContext context) {
    return MediaQuery.of(context).size.width * pSizeSmall; // 5% of screen width
  }

  static double p3(BuildContext context) {
    return MediaQuery.of(context).size.width *
        pSizeMedium; // 5% of screen width
  }

  static double p2(BuildContext context) {
    return MediaQuery.of(context).size.width * pSizeLarge; // 5% of screen width
  }

  static double p1(BuildContext context) {
    return MediaQuery.of(context).size.width *
        pSizeXLarge; // 5% of screen width
  }

  static double respoHeightLarge(BuildContext context) {
    return MediaQuery.of(context).size.height * Styl.heightSBoxMedium;
  }

  static double respoHeightMedium(BuildContext context) {
    return MediaQuery.of(context).size.height * Styl.heightSBoxSmall;
  }

  static double respoHeightSmall(BuildContext context) {
    return MediaQuery.of(context).size.height * Styl.heightSBoxLarge;
  }

  static double respoHeightXLarge(BuildContext context) {
    return MediaQuery.of(context).size.height * Styl.heightSBoxXlarge;
  }
}




