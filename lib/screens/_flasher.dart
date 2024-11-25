import 'package:flutter/material.dart';
import 'package:matching/widgets/_gradient_widget.dart';
import 'package:matching/widgets/_logo_widget.dart';

void main() => runApp(const Logo());

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Flasher());
  }
}
class Flasher extends StatelessWidget {
  const Flasher({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      decoration:  gradientDecor,
      child: 
  const WidgetLogo(topPadding: 50, logoWidth: 200, logoHeight: 150, gradient:true),

    ),
    );
  }
}