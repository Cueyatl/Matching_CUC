import 'package:flutter/material.dart';
import 'package:matching/data/app_data.dart';


class HeaderOne extends StatelessWidget {
  final double topPadding;
  final double bottomPadding;
  final String message;
  final TextAlign xTextAlign;

  const HeaderOne({
    super.key,
    this.topPadding = 0.0, // default values
    this.bottomPadding = 0.0,
    this.message ="",
    this.xTextAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child:  Text(
        message,
        style:const TextStyle(
          color: Styl.cieloNevado,
          fontSize: Styl.headerOneSize,
          fontWeight: FontWeight.w700,
          letterSpacing: Styl.letterSpacing,
          wordSpacing: Styl.wordSpacing,
  ),
  textAlign: xTextAlign,
),
      
    );
  }
}


class HeaderTwo extends StatelessWidget {
  final double topPadding;
  final double bottomPadding;
  final String message;
  
  
  final TextAlign xTextAlign;

  const HeaderTwo({
    super.key,
    this.topPadding = 0.0, // default values
    this.bottomPadding = 0.0,
    this.message ="",
    this.xTextAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child:  Text(
        message,
        style:const TextStyle(
          color: Styl.cieloNevado,
          fontSize: Styl.headerTwoSize,
          fontWeight: FontWeight.w700,
          letterSpacing: Styl.letterSpacing,
          wordSpacing: Styl.letterSpacing,
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
    this.xfontColor =Styl.grisNevado,
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
          fontSize: Styl.textOneSize,
  ),
  textAlign: xTextAlign,
),    
    );
  }
}

