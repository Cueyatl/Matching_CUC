import 'package:flutter/material.dart';
import 'package:matching/data/app_data.dart';
// Recommended to use fitbox, scale the text to fit its container.
// Ensures the text scales down if it overflows its container. Useful for layouts where space is constrained.
// Base Font Size:
// You set a base size (24.0 in this case), and FittedBox will reduce it as needed
// Or use the commented line in headerone's fontsize.

// child: FittedBox(
//   fit: BoxFit.scaleDown,
//   child: Text(
//     message,
//     style: TextStyle(
//       color: xfontColor,
//       fontSize: 24, // Base font size (FittedBox scales it)
//       fontWeight: FontWeight.w700,
//       letterSpacing: 1.0,
//       wordSpacing: 2.0,
//     ),
//     textAlign: xTextAlign,
//   ),
// ),


class HeaderOne extends StatelessWidget {
  final double topPadding;
  final double bottomPadding;
  final String message;
  final double xfontSize;
  final double xletterSpacing;
  final double xwordSpacing;
  final Color xfontColor;
  final TextAlign xTextAlign;

  const HeaderOne({
    super.key,
    this.topPadding = 0.0, // default values
    this.bottomPadding = 0.0,
    this.message ="",
    this.xfontSize =10.0,
    this.xletterSpacing = 2.0,
    this.xwordSpacing=5.0,
    this.xfontColor=Styl.textColorBase,
    this.xTextAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child:  Text(
        message,
        style: TextStyle(
          color: xfontColor,
          //  fontSize: MediaQuery.of(context).size.width * 0.06, // 6% of screen width
          fontSize: Styl.p2(context),
          fontWeight: FontWeight.w700,
          letterSpacing: 1.0,
          wordSpacing: 2.0,
  ),
  textAlign: xTextAlign,
),
      
    );
  }
}


class HeaderThree extends StatelessWidget {
  final double topPadding;
  final double bottomPadding;
  final String message;
  final double xletterSpacing;
  final double xwordSpacing;
  final Color xfontColor;
  final TextAlign xTextAlign;

  const HeaderThree({
    super.key,
    this.topPadding = 0.0, // default values
    this.bottomPadding = 0.0,
    this.message ="",
    this.xletterSpacing = 2.0,
    this.xwordSpacing=5.0,
    this.xfontColor=Styl.textColorBase,
    this.xTextAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child:  Text(
        message,
        style: TextStyle(
          color: xfontColor,
          fontSize: Styl.p3(context),
          fontWeight: FontWeight.w700,
          letterSpacing: 1.0,
          wordSpacing: 2.0,
  ),
  textAlign: xTextAlign,
),
      
    );
  }
}




class TextOne extends StatelessWidget {
  final double topPadding;
  final double bottomPadding;
  final String message;
  final Color xfontColor;
  final TextAlign xTextAlign;
  final FontWeight xfontWeight;

  const TextOne({
    super.key,
    this.topPadding = 0.0, // default values
    this.bottomPadding = 0.0,
    this.message ="",
    this.xfontColor=Styl.textColorShade,
    this.xTextAlign = TextAlign.start,
    this.xfontWeight =FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child:  Text(
        message,
        style: TextStyle(
          fontWeight: xfontWeight,
          color: xfontColor,
          fontSize: Styl.p3(context),
  ),
  textAlign: xTextAlign,
),
      
    );
  }
}

