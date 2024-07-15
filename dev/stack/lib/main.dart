import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Imagens',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Image.network('https://upload.wikimedia.org/wikipedia/commons/2/23/Paisagem_no_Inhotim.jpg', fit: BoxFit.cover, width: double.infinity, height: double.infinity,),
      ),
    );
  }
}




















//Positions
/* class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Stack App',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
            Positioned(
              right: -70,
              child: Container(
                width: 100,
                height: 200,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/