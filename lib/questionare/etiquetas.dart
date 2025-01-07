import 'package:flutter/material.dart';
import 'package:matching/data/central_state.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';


import 'package:matching/questionare/fotos.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_gradient_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/bienvenida.dart';
import 'package:matching/questionare/fecha_nacimiento.dart';
import 'package:choice/choice.dart';
import 'package:matching/data/app_data.dart';
import 'package:matching/data/app_localizations.dart';

void main() {
  runApp(const PersonalityTags());
}

class PersonalityTags extends StatefulWidget {
  const PersonalityTags({super.key});
  @override
  // State<PersonalityTags>
  PersonalityTagsState createState() => PersonalityTagsState();
}

class PersonalityTagsState extends State<PersonalityTags> {
  //Debug info, warning and error logs 
  var logger = Logger();

  String? selectedValue; // A nullable string to hold the last selected value
Set<String> selectedValues = {}; // A set to manage multiple selections

void setSelectedValue(String? value) {
  if (value == null) return; // Ensure the value is not null

  setState(() {
    selectedValue = value; // Update the last selected value (if needed elsewhere)
    if (selectedValues.contains(value)) {
      selectedValues.remove(value); // Remove the value if it's already selected
    } else {
      selectedValues.add(value); // Add the value if it's not selected
    }
    logger.t(selectedValue);
    
  }
  );
}

    //TESTS NEEDED.
    Future<void> _sendUserData() async {
    final user = Provider.of<CentralStateModel>(context, listen: false);
      const url = 'http://192.168.1.66:5000/create_user';
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200) {
        logger.i('User saved successfully: ${response.body}');
        if (mounted){
        Navigator.pushNamed(context, '/SwipeCardsClass');
        }
      } else {
        logger.e('Failed to save user: ${response.body}', error: 'Send user data failure');
      }
    } 


  @override
  Widget build(BuildContext context) {


    const List<String> choices = TagsView.matchTags;
    return Scaffold(
        backgroundColor: Styl.bgBase,
        appBar: const WidgetCloseAppBar(
          goBack: true,
        ),
        body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: Styl.verticalPadding, horizontal: Styl.horizontalPadding,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderOne(message: AppLocalizations.of(context)!.translate('TagsViewTitle'),),
                SizedBox(height: Styl.respoHeightSmall(context)),
                TextOne(message: AppLocalizations.of(context)!.translate('TagsViewDescription'),),
                SizedBox(height: Styl.respoHeightMedium(context)),
                  Expanded(
              child: SingleChildScrollView(
                child:Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Choice<String>.inline(
                    multiple: true,
                    clearable: true,
                    value: ChoiceSingle.value(selectedValue),
                    onChanged: ChoiceSingle.onChanged(setSelectedValue),
                    itemCount: choices.length,
                    itemBuilder: (state, i) {
                      return ChoiceChip(
                        selectedColor:const Color(0xFFF5588A),
                        backgroundColor: Colors.white,
                        selected: selectedValues.contains(choices[i]), // Check if the choice is selected
                        onSelected: (isSelected) {setSelectedValue(choices[i]);},
                        label: Text(choices[i],),
                        labelStyle:const TextStyle(fontSize: 12.0),
                      );
                    },
                    listBuilder: ChoiceList.createWrapped(
                      spacing: 2,
                      runSpacing: 2,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),

                // const Spacer(),
                WidgetButton(
                  isEnabled: true,  
                  // topPadding: Styl.respoHeightMedium(context),
                  // bottomPadding: Styl.respoHeightSmall(context),
                  // acceptOrContinue: false,
                  // isGradient: true,
                  logicHere: () async {
                  //Also this sends us directly to cards.
                  await _sendUserData();
              },
                )
              ],
              
            )
            )
            );
  }
}
