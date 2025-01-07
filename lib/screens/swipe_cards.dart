import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:logger/logger.dart';

import 'package:swipe_cards/swipe_cards.dart';

void main() {
  runApp(SwipeCardsClass());
}

class SwipeCardsClass extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe Cards Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Swipe Cards Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Content {
  final String? text;
  final String? description;
  final String? image;

  Content({this.text, this.description, this.image});
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  List<Map<String, dynamic>> profiles = [];

  @override
  void initState() {
    super.initState();
    loadProfiles();
  }

  Future<void> loadProfiles() async {
    String data = await rootBundle.loadString('assets/dummyJson/dummy_data.json');
    setState(() {
      profiles = List<Map<String, dynamic>>.from(json.decode(data));
      for (var profile in profiles) {
        _swipeItems.add(SwipeItem(
          content: Content(
            text: profile['Nombre'],
            description: "${profile['Observaciones']} (${profile['Altura']})",
            image: profile['image'] ?? 'assets/default_placeholder.png',
          ),
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Liked ${profile['Nombre']}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Nope ${profile['Nombre']}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Superliked ${profile['Nombre']}"),
              duration: Duration(milliseconds: 500),
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
    var logger = Logger();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: profiles.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Stack(children: [
              SwipeCards(
                matchEngine: _matchEngine!,
                itemBuilder: (BuildContext context, int index) {
                  final content = _swipeItems[index].content as Content;
                  return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
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
                        content.image != null
                            ? Image.asset(content.image!, height: 150)
                            : Container(),
                        SizedBox(height: 20),
                        Text(
                          content.text!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          content.description!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
                onStackFinished: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("No more profiles!"),
                    duration: Duration(milliseconds: 500),
                  ));
                },
                itemChanged: (SwipeItem item, int index) {
                  logger.i("item: ${item.content.text}, index: $index");
                },
                leftSwipeAllowed: true,
                rightSwipeAllowed: true,
                upSwipeAllowed: true,
                fillSpace: true,
              ),
            ]),
    );
  }
}
