import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/fecha_nacimiento.dart';
import 'package:matching/questionare/preferencia_genero.dart';
import 'package:matching/widgets/_selectable_option_widget.dart';
import 'package:matching/data/app_data.dart';
import 'package:matching/data/app_localizations.dart';

void main() {
  runApp(const GenderQs());
}

class GenderQs extends StatefulWidget {
  const GenderQs({super.key});
  @override
  GenderQsState createState() => GenderQsState();
}

class GenderQsState extends State<GenderQs> {
  Color textColor = Colors.grey;
  int? selectedButton;

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
            left: Styl.horizontalPadding,
            right: Styl.horizontalPadding,
            // top: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom +
                16.0, // Handle keyboard overlap
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Adjust height based on content
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
              HeaderThree(
                message: AppLocalizations.of(context)!.translate('GenderViewTitleBottomSheet'),
                xTextAlign: TextAlign.start,
              ),
              SizedBox(height: Styl.respoHeightMedium(context)),
              TextOne(
                message: AppLocalizations.of(context)!.translate('GenderViewDescriptionBottomSheet'),
                xfontColor: Styl.textColorShade,
              ),
              SizedBox(height: Styl.respoHeightMedium(context)),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.translate('nameVal');
                  }
                  // Regex for names only acceted vocals and letters and spaces.
                  if (!RegExp(TypeValidation.valsForNames).hasMatch(value)) {
                    return AppLocalizations.of(context)!
                        .translate('nameValSpecification');
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!
                      .translate('GenderViewLblGenderBottomSheet'),
                  hintStyle: const TextStyle(color: Styl.textColorShade),
                  border: const OutlineInputBorder(),
                ),
              ),
              SizedBox(height: Styl.respoHeightMedium(context)),
              WidgetButton(
                acceptOrContinue: false,
                isGradient: true,
                logicHere: () {
                  // Navigator.pop(context); //Return to genderQs
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SearchGenderQs())); //Advance to next questions
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final options = [
      {'label': AppLocalizations.of(context)!.translate('QuestionOptionsLblMan'), 'index': 1},
      {'label': AppLocalizations.of(context)!.translate('QuestionOptionsLblWoman'), 'index': 2},
      {'label': AppLocalizations.of(context)!.translate('QuestionOptionsLblOther'), 'index': 3},
    ];

    return Scaffold(
      backgroundColor: Styl.bgBase,
      appBar: const WidgetCloseAppBar(
        goBack: true,
        lastPage: BirthdayQs(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Styl.verticalPadding,
          horizontal: Styl.horizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderOne(
              message: AppLocalizations.of(context)!.translate('GenderViewTitle'),
            ),
            TextOne(
              message: AppLocalizations.of(context)!.translate('GenderViewDescription'),
              xfontColor: Styl.textColorShade,
            ),
            SizedBox(height: Styl.respoHeightMedium(context)),
            Column(
              children: options
                  .map<Widget>((option) => Column(
                        children: [
                          SelectableButton(
                            label: option['label'].toString(),
                            isSelected: selectedButton == option['index'],
                            onPressed: () => _onButtonSelected(
                                int.parse(option['index'].toString())),
                          ),
                          const SizedBox(height: Styl.heightSBoxSmall),
                        ],
                      ))
                  .toList(),
            ),
            const Spacer(),
            WidgetButton(
              topPadding: Styl.respoHeightMedium(context),
              bottomPadding: Styl.respoHeightSmall(context),
              acceptOrContinue: false,
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
