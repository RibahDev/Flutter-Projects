import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                color: Colors.red,
              )),
          Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container(
                color: Colors.blue,
              )),
        ],
      ),
    );
  }
}