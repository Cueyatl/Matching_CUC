import 'package:flutter/material.dart';
import 'package:matching/data/app_data.dart';

class CircularButton extends StatefulWidget {
  final List<Map<String, dynamic>> options;
  final int? selectedButton;
  final Function(int) onButtonSelected;
  final double buttonSize; // Parameter to specify the size of the buttons
  final double paddingBetweenButtons; // Spacing between buttons

  const CircularButton({
    super.key,
    required this.options,
    required this.selectedButton,
    required this.onButtonSelected,
    this.buttonSize = 50, // Default size
    this.paddingBetweenButtons = 8.0, // Default spacing
  });

  @override
  State<CircularButton> createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton> {
  void _handleSelection(int buttonIndex) {
    // Notify the parent which button got selected
    widget.onButtonSelected(buttonIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center the row
      children: widget.options.map<Widget>((option) {
        final index = option['index'] as int;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.paddingBetweenButtons / 2),
          child: _StyledCircularButton(
            label: option['label'].toString(),
            isSelected: widget.selectedButton == index,
            onPressed: () => _handleSelection(index),
            size: widget.buttonSize, // Use the specified button size
            circularPadding: 0, // Padding inside each button
          ),
        );
      }).toList(),
    );
  }
}

class _StyledCircularButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;
  final double size;
  final double circularPadding;

  const _StyledCircularButton({
    required this.label,
    required this.isSelected,
    required this.onPressed,
    this.size = 50,
    this.circularPadding = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Padding(
        padding: EdgeInsets.all(circularPadding),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected
                ? Styl.azulReal
                :  Styl.cieloNevado,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100), // Fully rounded
            ),
            padding: EdgeInsets.zero,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Styl.cieloNevado :(Styl.azulProfundo), // Example color
                fontWeight: FontWeight.bold,
                fontSize: Styl.textOneSize
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
