import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matching/widgets/_button_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/widgets/_close_appbar_widget.dart';
import 'package:matching/questionare/etiquetas.dart';
import 'package:matching/data/app_data.dart';
import 'package:matching/data/app_localizations.dart';

void main() {
  runApp(const AddPhotosQs());
}

class AddPhotosQs extends StatefulWidget {
  const AddPhotosQs({super.key});

  @override
  AddPhotosQsState createState() => AddPhotosQsState();
}

class AddPhotosQsState extends State<AddPhotosQs> {
  final ImagePicker _picker = ImagePicker();
  final List<File?> _images = List.generate(6, (_) => null);

  Future<void> _showBottomSheet(int index) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: Styl.horizontalPadding,
            right: Styl.horizontalPadding,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
                HeaderOne(message:AppLocalizations.of(context)!
                  .translate('PhotoAddMenu'),),
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                      onPressed: () async {
                        Navigator.pop(context); // Close the bottom sheet
                        final XFile? pickedImage = await _picker.pickImage(
                            source: ImageSource.gallery);
                        if (pickedImage != null) {
                          setState(() {
                            _images[index] = File(pickedImage.path);
                          });
                        }
                      },
                      child: HeaderThree(message:
                      AppLocalizations.of(context)!
                  .translate('Gallery'),),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.pop(context); // Close the bottom sheet
                        final XFile? capturedImage =
                            await _picker.pickImage(source: ImageSource.camera);
                        if (capturedImage != null) {
                          setState(() {
                            _images[index] = File(capturedImage.path);
                          });
                        }
                      },
                      child: HeaderThree(message: 
                      AppLocalizations.of(context)!
                  .translate('Camera'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageButton(int index) {
    return Flexible(
      child: GestureDetector(
        onTap: () => _showBottomSheet(index),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            image: _images[index] != null
                ? DecorationImage(
                    image: FileImage(_images[index]!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: _images[index] == null
              ? const Center(
                  child: Icon(Icons.add_a_photo, color: Colors.grey),
                )
              : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color textColor = Styl.textColorShade;

    return Scaffold(
      backgroundColor: Styl.bgBase,
      appBar: const WidgetCloseAppBar(
        goBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Styl.verticalPadding,
          horizontal: Styl.horizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderOne(
              message:
                  AppLocalizations.of(context)!.translate('PhotosViewTitle'),
            ),
            SizedBox(width: Styl.respoSmall(context)),
            TextOne(
              message: AppLocalizations.of(context)!
                  .translate('PhotosViewDescription'),
              xfontColor: textColor,
            ),
            SizedBox(height: Styl.respoHeightMedium(context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) => _buildImageButton(index)),
            ),
            SizedBox(height: Styl.respoHeightMedium(context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                  List.generate(3, (index) => _buildImageButton(index + 3)),
            ),
            const Spacer(),
            WidgetButton(
              topPadding: Styl.respoHeightMedium(context),
              bottomPadding: Styl.respoHeightSmall(context),
              acceptOrContinue: false,
              isGradient: true,
              logicHere: () {
                  Navigator.pushNamed(context, '/PersonalityTags');
              },
            ),
          ],
        ),
      ),
    );
  }
}
