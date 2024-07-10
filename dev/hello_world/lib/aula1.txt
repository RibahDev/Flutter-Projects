import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(title: 'Aplicativo Olá Mundo'));
}

class MyApp extends StatelessWidget {
  final String? title;

  const MyApp({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: Center(
          child: Text(
            'olá mundo',
            style: TextStyle(fontSize: 30, color: Colors.greenAccent),
          ),
        ),
      ),
    );
  }
}
