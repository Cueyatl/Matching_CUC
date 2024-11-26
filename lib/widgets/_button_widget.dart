import 'package:flutter/material.dart';
import 'package:matching/data/app_data.dart';
class WidgetButton extends StatelessWidget {
  final double topPadding;
  final double bottomPadding;
  final String message;
  final bool acceptOrContinue; //Not best practice but does the job.
  final double? buttonWidth; // Optional to allow full width by default
  final bool isGradient;
  final String printMessage;
  final VoidCallback? logicHere; // Optional function

  const WidgetButton({
    super.key,
    this.topPadding = 0.0, // default values
    this.message="",
    this.acceptOrContinue=true,
    this.buttonWidth, // Optional: default to full width
    this.bottomPadding = 0.0,
    this.isGradient = false,
    this.printMessage = "Button Pressed",
    this.logicHere,
  }
  );

  @override
  Widget build(BuildContext context) {
    String message;
    if (this.message==""){
    message = acceptOrContinue? ButtonText.acString: ButtonText.conString;
    }else{
      message= this.message;
    }




    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        bottom: bottomPadding,
      ),
      child: Center(
        child: Container(
          width: buttonWidth ?? double.infinity, // Full width by default
          height: 50.0,
          decoration: isGradient
              ? BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFF5588A),
                      Color(0xFFED0037),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(14),
                )
              : BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(14),
                ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              
              backgroundColor: Colors.transparent, // Important for gradients
              shadowColor: Colors.transparent, // Remove shadow to match style
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onPressed: () {
              print(printMessage);
              if (logicHere != null) {
                logicHere!();
              }
            },
            child: Text(
              message,
              style:  TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isGradient? 
                 Colors.white : Colors.black, // Adjust text color for visibility
              ),
            ),
          ),
        ),
      ),
    );
  }
}
