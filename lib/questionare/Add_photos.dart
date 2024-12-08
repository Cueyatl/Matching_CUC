import 'package:flutter/material.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/Tags.dart';
import 'package:matching/data/app_data.dart';
void main() {
  runApp(const AddPhotosQs());
}

class AddPhotosQs extends StatelessWidget {
  const AddPhotosQs({super.key});
  @override
  Widget build(BuildContext context) {
    const Color textColor = Styl.textColorShade;
    return Scaffold(
        backgroundColor: Styl.bgBase,
        appBar: const WidgetCloseAppBar(
          goBack: true,
          lastPage: PersonalityTags(),
        ),
        body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: Styl.verticalPadding, horizontal: Styl.horizontalPadding,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderOne(
                  message: PhotosView.title,
                ),
                SizedBox(
                  width: Styl.respoSmall(context),
                  ),
                const TextOne(
                  message: PhotosView.description,
                  xfontColor: textColor,
                ),
                SizedBox(
                  height: Styl.respoHeightMedium(context),
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
                SizedBox(height: Styl.respoHeightMedium(context),),
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
                  topPadding: Styl.respoHeightMedium(context),
                  bottomPadding: Styl.respoHeightSmall(context),
                  acceptOrContinue: false,
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
