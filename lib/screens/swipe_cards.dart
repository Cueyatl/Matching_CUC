import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:logger/logger.dart';
import 'package:matching/data/app_localizations.dart';
import 'package:matching/widgets/_responsive_layout_widget.dart';
import 'package:matching/widgets/_text_style_widget.dart';
import 'package:matching/data/app_data.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:matching/widgets/_button_widget.dart';

import 'package:matching/data/central_state.dart';
import 'package:provider/provider.dart';



import 'package:matching/widgets/_close_appbar_widget.dart';


import 'package:matching/questionare/preferencia_genero.dart';
import 'package:matching/questionare/preferencia_altura.dart';


void main() {
  runApp(const SwipeCardsClass());
}

class SwipeCardsClass extends StatelessWidget {
  const SwipeCardsClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe Cards Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Swipe Cards Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Content {
  final String? text;
  final String? description;

  Content({this.text, this.description});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title});

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  List<Map<String, dynamic>> profiles = [];

  @override
  void initState() {
    super.initState();
    loadProfiles();
  }

  Future<void> loadProfiles() async {
    String data =
        await rootBundle.loadString('assets/dummyJson/dummy_data.json');
    setState(() {
      profiles = List<Map<String, dynamic>>.from(json.decode(data));
      for (var profile in profiles) {
        _swipeItems.add(SwipeItem(
          content: 
            Column(children: [

            HeaderTwo(message: profile['nombre'],),
            TextOne(message: "${profile['carrera']} - ${profile['altura']} cm",
              bottomPadding: Styl.sizeBoxSpace,
            ),
            TextOne(message: "${profile['carrera']} - ${profile['altura']} cm",
              bottomPadding: Styl.sizeBoxSpace,
            )

            ],),

            
            // text: profile['nombre'],
            // description: "${profile['carrera']} - ${profile['altura']} cm",
          


          likeAction: () {
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: Text("Liked ${profile['nombre']}"),
            //   duration: const Duration(milliseconds: 500),
            // ));
          },
          nopeAction: () {
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: Text("Nope ${profile['nombre']}"),
            //   duration: const Duration(milliseconds: 500),
            // ));
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Superliked ${profile['nombre']}"),
              duration: const Duration(milliseconds: 500),
            ));
          },
        ));
      }
      _matchEngine = MatchEngine(swipeItems: _swipeItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    //Debug info, warning and error logs

    return Scaffold(
      backgroundColor: Styl.azulProfundo,

    
body: SafeArea(child: 
profiles.isEmpty
    ? const Center(child: CircularProgressIndicator())
    : Padding(
        padding: const EdgeInsets.symmetric(vertical: Styl.verticalPadding*2, horizontal: Styl.horizontalPadding), // Adjust the padding as needed
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
              SwipeCards(
                matchEngine: _matchEngine!,
                itemBuilder: (BuildContext context, int index) {
                  final content = _swipeItems[index].content as Content;
                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          content.text!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          content.description!,
                          textAlign: TextAlign.center,
                          style:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
                onStackFinished: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("No more profiles!"),
                    duration: Duration(milliseconds: 500),
                  ));
                },
                itemChanged: (SwipeItem item, int index) {
                  // logger.i("item: ${item.content.text}, index: $index");
                },
                leftSwipeAllowed: true,
                rightSwipeAllowed: true,
                upSwipeAllowed: false,
                fillSpace: true,
              ),
            ],
              ),
            ),
          ],
        ),
      ),

),

      bottomNavigationBar: Container(
        color: Styl.azulProfundo, // Add a background color if needed
        padding: const EdgeInsets.symmetric(vertical: Styl.spaceBetweenButtons),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [
                      Styl.naranjaLava,
                      Styl.rosaFantasia
                    ], // Define your gradient colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                child: const Icon(
                  Icons.favorite,
                  size: Styl.headerOneSize, // Your custom size
                  color: Styl.cieloNevado, // Required to make gradient visible
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [
                      Styl.naranjaLava,
                      Styl.rosaFantasia
                    ], // Define your gradient colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                child: const Icon(
                  Icons.chat,
                  size: Styl.headerOneSize, // Your custom size
                  color: Colors.white, // Required to make gradient visible
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/BodyTypeQs');
              },
              icon: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [
                      Styl.naranjaLava,
                      Styl.rosaFantasia
                    ], // Define your gradient colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
                },
                child: const Icon(
                  Icons.person,
                  size: Styl.headerOneSize, // Your custom size
                  color: Styl.cieloNevado, // Required to make gradient visible
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
