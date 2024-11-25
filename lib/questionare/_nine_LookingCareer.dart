import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/_eigth_Career.dart';
import 'package:matching/questionare/_six_height.dart';
import 'package:matching/widgets/_selectable_option_widget.dart';
import 'package:matching/questionare/Add_photos.dart';

void main() {
  runApp(const LookingCareerQs());
}

class LookingCareerQs extends StatefulWidget {
  const LookingCareerQs({super.key});
  @override
  LookingCareerQsState createState() => LookingCareerQsState();
}

class LookingCareerQsState extends State<LookingCareerQs> {
  // Track which button is selected (1 for Button 1, 2 for Button 2, null if none)
  int? selectedButton;
  Set<int> selectedButtons = {};


  void _onButtonSelected(int buttonIndex) {
    setState(() {

      if (selectedButtons.contains(buttonIndex)) {
        selectedButtons.remove(buttonIndex); // Deselect if already selected
      } else {
        selectedButtons.add(buttonIndex); // Add to selected buttons
      }
      
      if (buttonIndex==6){
        selectedButtons.clear();
        selectedButtons.add(6);
      } else {
        if(selectedButtons.contains(6)){
          selectedButtons.remove(6);
        }
      }


          print(selectedButtons);
      
    });
  }


  @override
  Widget build(BuildContext context) {
    const Color textColor = Colors.grey;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPage: CareerQs(),
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
              message: "¿Qué carreras te gustaría ver?",
            ),
            const SizedBox(height: 10),
            const TextOne(
              message:
                  "Selecciona las carreras que quieras, así sabremos a quién recomendarte",
              xfontColor: textColor,
            ),
            const SizedBox(height: 18),
            SelectableButton(
              label: 'Lic. Administración 📋',
              isSelected:  selectedButtons.contains(1), 
              onPressed: () => _onButtonSelected(1),              
            ),
            const SizedBox(width: 20), // Add some spacing between buttons
            SelectableButton(
              label: 'Lic. Contabilidad 📊',
              isSelected: selectedButtons.contains(2),
              onPressed: () => _onButtonSelected(2),
              
            ),
            SelectableButton(
              label: 'Ing. Biotecnología 🧬',
              isSelected: selectedButtons.contains(3),
              onPressed: () => _onButtonSelected(3),
            ),
            SelectableButton(
              label: 'Ing. Industrial 🏭',
              isSelected: selectedButtons.contains(4),
              onPressed: () => _onButtonSelected(4),
            ),
            SelectableButton(
              label: 'Ing. en Sistemas 💻',
              isSelected: selectedButtons.contains(5),
              onPressed: () => _onButtonSelected(5),
            ),
            SelectableButton(
              label: 'Todas las carreras 🎓',
              isSelected: selectedButtons.contains(6),
              onPressed: () => _onButtonSelected(6),
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
                    builder: (context) => const AddPhotosQs(),
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
