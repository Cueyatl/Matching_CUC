import 'package:flutter/material.dart';

class WidgetLogo extends StatelessWidget {
  final double topPadding;
  final double bottomPadding;
  final double logoWidth;
  final double logoHeight;
  final bool gradient;

  const WidgetLogo({
    super.key,
    this.topPadding = 0.0, // default values
    this.logoWidth = 100.0,
    this.logoHeight = 100.0,
    this.bottomPadding = 0.0,
    this.gradient = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
      child: Center(
        
        child: Image.asset(
           gradient ?   'images/logo.png':'images/logo_pink_variant.png', // Conditional 
          
          width: logoWidth,
          height: logoHeight,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
