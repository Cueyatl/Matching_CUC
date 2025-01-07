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
    "QuestionOptionsLblOther",
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
  static const double topP = 40.0;
  static const double bottomP = 10.0;
  
  static const Color textColorShade =Color(0XFF2C3958);
  static const Color languageToggleColor =Color(0XFFE75469);
  static const Color languageToggleBG =Color(0XFFD6BD8E);

  static const Color textColorBase = Color.fromARGB(255, 21, 27, 42);
  static const Color textColorPink = Color(0xFFF5588A);
  static const Color textColorPinkAccent = Color(0xFFED0037);
  static const Color bgBase = Color(0XFFF2F2F2);
  static const Color bgShade = Color(0XFFF2F2F2);

  static const double verticalPadding = 4.0;
  static const double horizontalPadding = 24.0;
  
  

  static const double heightSBoxSmall = 0.001;
  static const double heightSBoxMedium = 0.02;
  static const double heightSBoxLarge = 0.03;
  static const double heightSBoxXlarge = 0.04;

  static const double pSizeSmall = 0.35;
  static const double pSizeMedium = 0.04;
  static const double pSizeLarge = 0.06;
  static const double pSizeXLarge = 0.08;

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




