// import 'package:matching/widgets/_text_style_widget.dart';

// @override
// Widget build(BuildContext context) {
//   final List<Map<String, dynamic>> dateFields = [
//     {
//       "hint": "DD",
//       "maxLength": 2,
//       "focusNode": _focusNodeDD,
//       "nextFocusNode": _focusNodeMM,
//       "controller": TextEditingController(),
//     },
//     {
//       "hint": "MM",
//       "maxLength": 2,
//       "focusNode": _focusNodeMM,
//       "nextFocusNode": _focusNodeYYYY,
//       "controller": TextEditingController(),
//     },
//     {
//       "hint": "YYYY",
//       "maxLength": 4,
//       "focusNode": _focusNodeYYYY,
//       "nextFocusNode": null,
//       "controller": TextEditingController(),
//     },
//   ];

//   const Color textColor = Styl.textColorShade;

//   void _validateBirthdate() {
//     final String dayStr = dateFields[0]["controller"].text;
//     final String monthStr = dateFields[1]["controller"].text;
//     final String yearStr = dateFields[2]["controller"].text;

//     if (dayStr.isEmpty || monthStr.isEmpty || yearStr.isEmpty) {
//       _showError("All fields are required!");
//       return;
//     }

//     int? day = int.tryParse(dayStr);
//     int? month = int.tryParse(monthStr);
//     int? year = int.tryParse(yearStr);

//     if (day == null || month == null || year == null) {
//       _showError("Please enter valid numbers!");
//       return;
//     }

//     DateTime? birthDate;
//     try {
//       birthDate = DateTime(year, month, day);
//     } catch (_) {
//       _showError("Invalid date entered!");
//       return;
//     }

//     final DateTime today = DateTime.now();
//     int age = today.year - birthDate.year;

//     if (today.month < birthDate.month ||
//         (today.month == birthDate.month && today.day < birthDate.day)) {
//       age--;
//     }

//     if (age < 18) {
//       _showError("You must be at least 18 years old!");
//       return;
//     }
//   }

//   void _showError(String message) {
//     HeaderOne(message: "Invalid fields. Enter a valide date.",);
//   }


//   return Scaffold(
    
//     body: Padding(
      
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Title
        
//           Row(
//             children: [
//               for (int i = 0; i < dateFields.length; i++) ...[
//                 Expanded(
//                   child: TextFormField(
//                     keyboardType: TextInputType.number,
//                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                     maxLength: dateFields[i]["maxLength"],
//                     textAlign: TextAlign.center,
//                     focusNode: dateFields[i]["focusNode"],
//                     controller: dateFields[i]["controller"],
//                     decoration: InputDecoration(
//                       counterText: '',
//                       border: InputBorder.none,
//                       contentPadding: const EdgeInsets.only(bottom: 0.0),
//                       hintText: dateFields[i]["hint"],
//                       hintStyle: TextStyle(
//                         letterSpacing: 8.0,
//                         color: textColor,
//                         fontSize: Styl.p3(context),
//                       ),
//                     ),
//                     onChanged: (value) {
//                       if (value.length == dateFields[i]["maxLength"] &&
//                           dateFields[i]["nextFocusNode"] != null) {
//                         FocusScope.of(context)
//                             .requestFocus(dateFields[i]["nextFocusNode"]);
//                       }
//                     },
//                   ),
//                 ),
//                 if (i < dateFields.length - 1)
//                   const TextOne(
//                     message: "/",
//                   ),
//               ],
//             ],
//           ),
        
//         ],
//       ),
//     ),
//   );
// }

// //

// import 'package:intl/intl.dart';

// void calculateAge(String birthdate) {
//   final DateFormat formatter = DateFormat('dd/MM/yyyy');
//   final DateTime today = DateTime.now();

//   try {
//     DateTime parsedDate = formatter.parse(birthdate);
//     int age = today.year - parsedDate.year;

//     if (today.month < parsedDate.month ||
//         (today.month == parsedDate.month && today.day < parsedDate.day)) {
//       age--;
//     }

//     if (age < 18) {
//       print("Access denied");
//     } else {
//       print("Your age is $age");
//     }
//   } catch (e) {
//     print("Invalid date format. Please use DD/MM/YYYY.");
//   }
// }

