import 'package:flutter/material.dart';
import '../widgets/_selectable_option_widget.dart'; // Example import
import 'package:matching/data/app_data.dart';
// Import or define Styl.heightSBoxSmall accordingly


class MultipleOptionListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> options;
  final List<int> selectedButtons;
  final ValueChanged<int> onButtonsSelected;
  final double textFontSize;
  final double spacing;
  final double runSpacing;

  const MultipleOptionListWidget({
    super.key,
    required this.options,
    required this.selectedButtons,
    required this.onButtonsSelected,
    this.textFontSize=16,
    this.spacing=18.0,
    this.runSpacing= 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: options.map((option) {
        final buttonIndex = option['index'] as int;
        final label = option['label'] as String;
        final bool isSelected = selectedButtons.contains(buttonIndex);

        return ChoiceChip(

          selectedColor: Styl.azulReal,
          labelStyle: TextStyle(
            fontSize: textFontSize,
          color: isSelected ? Styl.cieloNevado: Styl.azulProfundo,
    ),
          label: Text(label),
          selected: isSelected,
          onSelected: (selected) {
            onButtonsSelected(buttonIndex);
          },
        );
      }).toList(),
    );
  }
}
