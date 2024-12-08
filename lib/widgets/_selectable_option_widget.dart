import 'package:flutter/material.dart';
import 'package:matching/data/app_data.dart';

class SelectableButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;
  final double? buttonWidth;

  const SelectableButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
    this.buttonWidth, // Optional: default
  });

  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(
       width: buttonWidth ?? double.infinity, // Full width by default
      child:ElevatedButton(
      onPressed: onPressed,
      
      style: ElevatedButton.styleFrom(
        
        backgroundColor: isSelected ? const Color(0xFFED0037) : const Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color:isSelected? Colors.white: Styl.textColorBase,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    );
  }
}
