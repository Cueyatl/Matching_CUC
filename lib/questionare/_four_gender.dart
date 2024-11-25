import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/_three_birthday.dart';
import 'package:matching/questionare/_five_lookingGenre.dart';
import 'package:matching/widgets/_selectable_option_widget.dart';

void main() {
  runApp(const GenderQs());
}

class GenderQs extends StatefulWidget {
  const GenderQs({super.key});
  @override
  GenderQsState createState() => GenderQsState();
}

class GenderQsState extends State<GenderQs> {
  int? selectedButton;
  final double actualButtonWidth = 120.0;

  void _onButtonSelected(int buttonIndex) {
    setState(() {
      selectedButton = buttonIndex;

      // Show Modal Bottom Sheet when "Otro" is selected
      if (selectedButton == 3) {
        _showSpecifyOtherBottomSheet();
      }
    });
  }

  void _showSpecifyOtherBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Makes the sheet expand dynamically
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20), // Rounded top corners
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.0, // Handle keyboard overlap
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Adjust height based on content
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
              const HeaderThree(message: "Enriquece tu perfil con tu identidad",xTextAlign: TextAlign.start,),
              const SizedBox(height: 20,),
              const TextOne(message: "Por favor cuentanos cómo te idenficicas Intentamos ser inclusivxs para todos los géneros.",xfontColor: Colors.grey,),
              const SizedBox(height: 20,),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Escribe aquí tu género',
                  hintStyle: TextStyle(color:Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              WidgetButton(message: "Siguiente", isGradient: true,logicHere:  () { 
                // Navigator.pop(context); //Return to genderQs
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchGenderQs()));//Advance to next questions
                },)
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color textColor = Colors.grey;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPage: BirthdayQs(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 24.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderOne(
              message: "¿Qué género te representa mejor?",
            ),
            const SizedBox(height: 10),
            const TextOne(
              message:
                  "Elige la opción que mejor te represente para que podamos brindarte la mejor experiencia.",
              xfontColor: textColor,
            ),
            const SizedBox(height: 18),
            SelectableButton(
              label: 'Hombre',
              isSelected: selectedButton == 1,
              onPressed: () => _onButtonSelected(1),
              
            ),
            const SizedBox(width: 20), // Add some spacing between buttons
            SelectableButton(
              label: 'Mujer',
              isSelected: selectedButton == 2,
              onPressed: () => _onButtonSelected(2),
              
            ),
            SelectableButton(
              label: 'Otro',
              isSelected: selectedButton == 3,
              onPressed: () => _onButtonSelected(3),
              
            ),
            const Spacer(),
            WidgetButton(
              topPadding: 40.0,
              bottomPadding: 10.0,
              message: "Siguiente",
              isGradient: true,
              logicHere: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchGenderQs(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
