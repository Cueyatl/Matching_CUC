import 'package:flutter/material.dart';
import 'package:matching/data/app_data.dart';

// 
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SwipeCardScreen(),
    );
  }
}

class SwipeCardScreen extends StatefulWidget {
  @override
  _SwipeCardScreenState createState() => _SwipeCardScreenState();
}

class _SwipeCardScreenState extends State<SwipeCardScreen> {
  double _offsetX = 0;
  double _offsetY = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Swipe Cards")),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 100,
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    _offsetX = details.localPosition.dx;
                    _offsetY = details.localPosition.dy;
                  });
                },
                onPanEnd: (details) {
                  if (_offsetX > 100) {
                    _swipeRight();
                  } else if (_offsetX < -100) {
                    _swipeLeft();
                  } else {
                    setState(() {
                      _offsetX = 0;
                      _offsetY = 0;
                    });
                  }
                },
                child: Transform.translate(
                  offset: Offset(_offsetX, _offsetY),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      width: 300,
                      height: 450,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image:const DecorationImage(
                          image: AssetImage('assets/your_image.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Styl.textColorBase.withOpacity(0.4), Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "John Doe, 25",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "#fun #adventure #outgoing",
                                  style: TextStyle(
                                    fontSize: Styl.p3(context),
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: _swipeLeft,
                                child: Text("Pass"),
                              ),
                              ElevatedButton(
                                onPressed: _swipeRight,
                                child: Text("Smash"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _swipeLeft() {
    setState(() {
      _offsetX = -500;
    });
    // Add your pass logic here (e.g., move to next card)
  }

  void _swipeRight() {
    setState(() {
      _offsetX = 500;
    });
    // Add your smash logic here (e.g., move to next card)
  }
}
