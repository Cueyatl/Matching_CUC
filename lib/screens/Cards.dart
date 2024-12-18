import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:matching/data/app_data.dart';

void main() {
  runApp(TinderCardApp());
}

class TinderCardApp extends StatelessWidget {
  const TinderCardApp ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TinderCloneScreen(),
    );
  }
}

class TinderCloneScreen extends StatefulWidget {
  @override
  _TinderCloneScreenState createState() => _TinderCloneScreenState();
}

class _TinderCloneScreenState extends State<TinderCloneScreen> {
  List<Map<String, dynamic>> profiles = [];
  int currentIndex = 0;
  Offset cardOffset = Offset.zero;
  double rotationAngle = 0;
  bool isLike = false;

  @override
  void initState() {
    super.initState();
    loadProfiles();
  }

  Future<void> loadProfiles() async {
    String data = await rootBundle.loadString('assets/dummyJson/dummy_data.json');
    setState(() {
    profiles = List<Map<String, dynamic>>.from(json.decode(data)).map((item) {
    return {
      "name": item["Nombre"],
      "age": DateTime.now().year - DateTime.parse(item["Fecha de Nacimiento"]).year,

      "observations": item["Observaciones"],
      "image": item["image"]
  };
}).toList();

    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Tinder Clone"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: profiles.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Stack(
              alignment: Alignment.center,
              children: [
                // Cards stack
                ...List.generate(
                  profiles.length - currentIndex,
                  (index) {
                    final cardPosition = profiles.length - currentIndex - index - 1;

                    return Positioned(
                      top: 20.0 * cardPosition,
                      left: 10.0 * cardPosition,
                      right: 10.0 * cardPosition,
                      child: currentIndex + index < profiles.length
                          ? Transform.scale(
                              scale: cardPosition == 0 ? 1 : 1 - 0.05 * cardPosition,
                              child: buildCard(profiles[currentIndex + index]),
                            )
                          : Container(),
                    );
                  },
                ),

                // Draggable top card
                currentIndex < profiles.length
                    ? GestureDetector(
                        onPanUpdate: (details) {
                          setState(() {
                            cardOffset += details.delta;
                            rotationAngle = cardOffset.dx / size.width * 0.5;
                            isLike = cardOffset.dx > 0;
                          });
                        },
                        onPanEnd: (details) {
                          if (cardOffset.dx.abs() > 150) {
                            // Card is swiped away
                            setState(() {
                              currentIndex++;
                              cardOffset = Offset.zero;
                              rotationAngle = 0;
                            });
                          } else {
                            // Reset card
                            setState(() {
                              cardOffset = Offset.zero;
                              rotationAngle = 0;
                            });
                          }
                        },
                        child: Transform.translate(
                          offset: cardOffset,
                          child: Transform.rotate(
                            angle: rotationAngle,
                            child: buildCard(profiles[currentIndex], isTop: true),
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          "No more profiles!",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
              ],
            ),
    );
  }

  Widget buildCard(Map<String, dynamic> profile, {bool isTop = false}) {
    return Stack(
      children: [
        // Profile card
            Container(
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0, 5),
            ),
          ],
          image: DecorationImage(
            image: AssetImage(profile['image']), // For local images
            // Or use NetworkImage for online images:
            // image: NetworkImage(profile['image']),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        bottom: 20,
        left: 20,
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "${profile['name']}, ${profile['age']}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    
        if (isTop)
          // Like/Dislike indicators
          Positioned(
            top: 40,
            left: cardOffset.dx > 0 ? 30 : null,
            right: cardOffset.dx < 0 ? 30 : null,
            child: Transform.rotate(
              angle: cardOffset.dx > 0 ? -0.3 : 0.3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: cardOffset.dx > 0
                      ? Colors.green.withOpacity(0.8)
                      : Colors.red.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  cardOffset.dx > 0 ? "LIKE" : "NOPE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
