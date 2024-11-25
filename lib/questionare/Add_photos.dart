import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/_Tags.dart';

void main() {
  runApp(const AddPhotosQs());
}

class AddPhotosQs extends StatelessWidget {
  const AddPhotosQs({super.key});
  @override
  Widget build(BuildContext context) {
    const Color textColor = Colors.grey;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const WidgetCloseAppBar(
          goBack: true,
          lastPage: PersonalityTags(),
        ),
        body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderOne(
                  message: "Agrega tus fotos recientes",
                ),
                const SizedBox(width: 10),
                const TextOne(
                  message: "Agrega por lo menos 2 fotos para empezar.",
                  xfontColor: textColor,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, // Adjust spacing between images
                  children: [
                    Flexible(
                      child: Image.asset(
                        'images/imagePlaceholder.png',
                        width: MediaQuery.of(context).size.width *
                            0.35, // 20% of screen width
                        height: MediaQuery.of(context).size.width *
                            0.4, // Keep it square
                        fit: BoxFit.contain, // Adjusts the image scaling
                      ),
                    ),
                    Flexible(
                      child: Image.asset(
                        'images/imagePlaceholder.png',
                        width: MediaQuery.of(context).size.width *
                            0.35, // 20% of screen width
                        height: MediaQuery.of(context).size.width *
                            0.4, // Keep it square
                        fit: BoxFit.contain, // Adjusts the image scaling
                      ),
                    ),
                    Flexible(
                      child: Image.asset(
                        'images/imagePlaceholder.png',
                        width: MediaQuery.of(context).size.width *
                            0.35, // 20% of screen width
                        height: MediaQuery.of(context).size.width *
                            0.4, // Keep it square
                        fit: BoxFit.contain, // Adjusts the image scaling
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, // Adjust spacing between images
                  children: [
                    Flexible(
                      child: Image.asset(
                        'images/imagePlaceholder.png',
                        width: MediaQuery.of(context).size.width *
                            0.35, // 20% of screen width
                        height: MediaQuery.of(context).size.width *
                            0.4, // Keep it square
                        fit: BoxFit.contain, // Adjusts the image scaling
                      ),
                    ),
                    Flexible(
                      child: Image.asset(
                        'images/imagePlaceholder.png',
                        width: MediaQuery.of(context).size.width *
                            0.35, // 20% of screen width
                        height: MediaQuery.of(context).size.width *
                            0.4, // Keep it square
                        fit: BoxFit.contain, // Adjusts the image scaling
                      ),
                    ),
                    Flexible(
                      child: Image.asset(
                        'images/imagePlaceholder.png',
                        width: MediaQuery.of(context).size.width *
                            0.35, // 20% of screen width
                        height: MediaQuery.of(context).size.width *
                            0.4, // Keep it square
                        fit: BoxFit.contain, // Adjusts the image scaling
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                WidgetButton(
                  topPadding: 40.0,
                  bottomPadding: 10.0,
                  message: "Siguiente",
                  isGradient: true,
                  logicHere: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PersonalityTags()));
                  },
                )
              ],
            )));
  }
}
