// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MultiSelectButtons extends StatefulWidget {
  @override
  _MultiSelectButtonsState createState() => _MultiSelectButtonsState();
}

class _MultiSelectButtonsState extends State<MultiSelectButtons> {
  Set<int> selectedButtons = {};

  void _onButtonSelected(int buttonIndex) {
    setState(() {
      if (selectedButtons.contains(buttonIndex)) {
        selectedButtons.remove(buttonIndex);
      } else {
        selectedButtons.add(buttonIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multi-Select Buttons')),
      body: Center(
        child: Wrap(
          spacing: 10,
          children: List.generate(5, (index) {
            final isSelected = selectedButtons.contains(index);
            return ElevatedButton(
              onPressed: () => _onButtonSelected(index),
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Colors.blue : Colors.grey,
              ),
              child: Text('Button ${index + 1}'),
            );
          }),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: MultiSelectButtons()));
