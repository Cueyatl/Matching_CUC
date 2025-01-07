import 'package:flutter/material.dart';
import '../widgets/_selectable_option_widget.dart'; // Example import
// Import or define Styl.heightSBoxSmall accordingly

class MultipleOptionListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> options;
  final List<int> selectedButtons;
  final ValueChanged<int> onButtonsSelected;

  const MultipleOptionListWidget({
    Key? key,
    required this.options,
    required this.selectedButtons,
    required this.onButtonsSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: options.map((option) {
        final buttonIndex = option['index'] as int;
        final label = option['label'] as String;
        final bool isSelected = selectedButtons.contains(buttonIndex);

        return ChoiceChip(
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
