import 'package:flutter/material.dart';
import '../widgets/_selectable_option_widget.dart'; // Example import
import 'package:matching/data/app_data.dart';
// Import or define Styl.heightSBoxSmall accordingly

class SelectableOptionListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> options;
  final int? selectedButton;
  final Function(int) onButtonSelected;
  // final void Function(List<int> selectedButtons, List<Map<String, dynamic>> options)
  //     centralStateUserData;

  const SelectableOptionListWidget({
    super.key,
    required this.options,
    required this.selectedButton,
    required this.onButtonSelected,
    // required this.centralStateUserData,
  });

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
            Padding(padding: EdgeInsets.symmetric(vertical: Styl.spaceBetweenButtons)),
            SelectableButton(

              label: option['label'].toString(),
              isSelected: widget.selectedButton == index,
              onPressed: () => _handleSelection(index),
            ),
            // or Styl.heightSBoxSmall
          ],
        );
      }).toList(),
    );
  }
}
