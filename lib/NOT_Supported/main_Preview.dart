import 'package:flutter/material.dart';

void main() {
  runApp( const NeinApp());
}

class NeinApp extends StatelessWidget {
  const NeinApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scrollable Section Example'),
        ),
        body: Column(
          children: [
            // A static header or other content
            Container(
              color: Colors.blue,
              height: 100,
              child: Center(
                child: Text(
                  'Static Header',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            // Scrollable section
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(30, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Item ${index + 1}',
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            // A static footer or other content
            Container(
              color: Colors.green,
              height: 100,
              child: Center(
                child: Text(
                  'Static Footer',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
