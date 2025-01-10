import 'package:flutter/material.dart';
import 'package:matching/data/app_data.dart';

class ResponsiveLayout extends StatelessWidget {
  final List<Widget> children;
  final double verticalPadding;
  final double horizontalPadding;
  final double baseFontSize; // Base font size for dynamic scaling

  const ResponsiveLayout({
    Key? key,
    required this.children,
    this.verticalPadding = 16.0,
    this.horizontalPadding = 16.0,
    this.baseFontSize = 12.0, // Default font size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate dynamic font size
        double fontSize = constraints.maxWidth > 600
            ? baseFontSize * 1.5 // Increase font size for wider screens
            : baseFontSize;

        double imageScale = constraints.maxWidth > 600 ? 2.0 : 2.4;
        double headerSpacing =
            constraints.maxWidth > 600 ? 16.0 : Styl.respoHeightMedium(context);

        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children.map((child) {
              if (child is Spacer) return child; // Preserve Spacers as-is

              // Apply dynamic spacing and font size if it's a text widget
              if (child is Text) {
                return Padding(
                  padding: EdgeInsets.only(bottom: headerSpacing),
                  child: DefaultTextStyle.merge(
                    style: TextStyle(fontSize: fontSize),
                    child: child,
                  ),
                );
              }
              return Padding(
                padding: EdgeInsets.only(bottom: headerSpacing),
                child: child,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
