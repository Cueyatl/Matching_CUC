import 'package:flutter/material.dart';

// Reusable decoration as a constant
const BoxDecoration gradientDecor = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
        Color.fromARGB(255, 245, 88, 138),
        Color(0xFFED0037),
    ],
    tileMode: TileMode.mirror,
  ),
);
