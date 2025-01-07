import 'package:flutter/material.dart';

class CentralStateModel extends ChangeNotifier {
  String? email;
  String? password;
  String? name;
  int? age;
  String? gender;
  String? career;
  int? height;
  String? skinColor;
  String? bodyType;
  String? personalityType;

  List<String> heightPreference = [];
  List<String> bodyTypePreferences = [];
  List<String> skinColorPreferences = [];
  List<String> genderPreferences = [];
  List<String> personalityPreferences = [];
  List<String> careerPreferences = [];

  List<String> tagsChoice = [];

  // Add other fields as necessary.
  void setEmail(String newEmail) {
    email = newEmail;
    notifyListeners();
  }

  //Might need changes.
  void setPassword(String newPassword) {
    password = newPassword;
    notifyListeners();
  }

  void setName(String newName) {
    name = newName;
    notifyListeners();
  }

  void setAge(int newAge) {
    age = newAge;
    notifyListeners();
  }

  void setGender(String? newGender) {
    gender = newGender;
    notifyListeners();
  }

  void setCareer(String? newCareer) {
    career = newCareer;
    notifyListeners();
  }

  void setHeight(int? newHeight) {
    height = newHeight;
    notifyListeners();
  }

  void setSkinColor(String? newSkinColor) {
    skinColor = newSkinColor;
    notifyListeners();
  }

  void setBodyType(String? newBodyType) {
    bodyType = newBodyType;
    notifyListeners();
  }

  void setPersonalityType(String? newPersonalityType) {
    personalityType = newPersonalityType;
    notifyListeners();
  }

  void setHeightPreferences(List<String> newPreferences) {
    heightPreference = newPreferences;
    notifyListeners();
  }

  void setBodyTypePreferences(List<String> newPreferences) {
    bodyTypePreferences = newPreferences;
    notifyListeners();
  }

  void setSkinColorPreferences(List<String> newPreferences) {
    skinColorPreferences = newPreferences;
    notifyListeners();
  }

  void setGenderPreferences(List<String> newPreferences) {
    genderPreferences = newPreferences;
    notifyListeners();
  }

  void setPersonalityPreferences(List<String> newPreferences) {
    personalityPreferences = newPreferences;
    notifyListeners();
  }

  void setCareerPreferences(List<String> newPreferences) {
    careerPreferences = newPreferences;
    notifyListeners();
  }

  void setTagsChoice(List<String> newPreferences) {
    tagsChoice = newPreferences;
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'contrasena': password,
      'nombre': name,
      'edad': age,
      'genero': gender,
      'altura': height,
      'color_piel': skinColor,
      'carrera': career,
      'complexion': bodyType,
      'tipo_de_persona': personalityType,

      
      'genero_interes': genderPreferences,
      'altura_interes': heightPreference,
      'color_piel_interes': skinColorPreferences,
      'personalidad_interes': personalityPreferences,
      'carrera_interes': careerPreferences,
      'complexion_interes': bodyTypePreferences,

      'etiquetas': tagsChoice

      


      // Include other fields
    };
  }
}



// Future<void> _saveUserToBackend() async {
// //DO NOT UPLOAD TO GITHUB DUMBASS!
// const url = 'http://192.168.x.x:5000/create_user';
  
//   final response = await http.post(
//     Uri.parse(url),
//     headers: {'Content-Type': 'application/json'},
//     body: jsonEncode({
//       'id': 1, // Replace with dynamic ID logic
//       'nombre': _nameController.text,
//       'genero': 'N/A',
//       'edad': 'N/A',
//       'altura': 'N/A',
//       'color_piel': 'N/A',
//       'tipo_de_cuerpo': 'N/A',
//       'tipo_de_persona': 'N/A',
//     }),
//   );

//   if (response.statusCode == 200) {
//     logger ('User saved successfully: ${response.body}');
//     if(mounted){
    
//     }
//   } else {
//     logger ('Failed to save user: ${response.body}');
//   }
// }

