import 'package:flutter/material.dart';
import '../widgets/_selectable_option_widget.dart'; // Example import
// Import or define Styl.heightSBoxSmall accordingly

class SelectableOptionListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> options;
  final int? selectedButton;
  final Function(int) onButtonSelected;
  // final void Function(List<int> selectedButtons, List<Map<String, dynamic>> options)
  //     centralStateUserData;

  const SelectableOptionListWidget({
    Key? key,
    required this.options,
    required this.selectedButton,
    required this.onButtonSelected,
    // required this.centralStateUserData,
  }) : super(key: key);

  @override
  State<SelectableOptionListWidget> createState() =>
      _SelectableOptionListWidgetState();
}

class _SelectableOptionListWidgetState
    extends State<SelectableOptionListWidget> {
    
  void _handleSelection(int buttonIndex) {
    // Notify the parent which button got selected
    widget.onButtonSelected(buttonIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.options.map<Widget>((option) {
        final index = option['index'] as int;
        return Column(
          children: [
            SelectableButton(
              label: option['label'].toString(),
              isSelected: widget.selectedButton == index,
              onPressed: () => _handleSelection(index),
            ),
            const SizedBox(height: 8.0), // or Styl.heightSBoxSmall
          ],
        );
      }).toList(),
    );
  }
}
