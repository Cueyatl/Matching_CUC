import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_gradient_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/three_birthday.dart';
import 'package:matching/questionare/one_welcome.dart';
import 'package:choice/choice.dart';
import 'package:matching/data/app_data.dart';

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
  List<String> choices = TagsView.matchTags;

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
    print(selectedValues);
  }
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styl.bgBase,
        appBar: const WidgetCloseAppBar(
          goBack: true,
          lastPage: WelcomeQs(),
        ),
        body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: Styl.verticalPadding, horizontal: Styl.horizontalPadding,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderOne(
                  message: TagsView.title,
                ),
                SizedBox(height: Styl.respoHeightSmall(context)),
                const TextOne(message: TagsView.description,),
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
                  topPadding: Styl.respoHeightMedium(context),
                  bottomPadding: Styl.respoHeightSmall(context),
                  acceptOrContinue: false,
                  isGradient: true,
                  logicHere: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BirthdayQs()));
                  },
                )
              ],
              
            )
            )
            );
  }
}
