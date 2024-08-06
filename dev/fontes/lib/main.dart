import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Fonte',
          style: TextStyle(
            fontSize: 50,
            fontFamily: 'JosefinSans',
          ),
        ),
      ),
    );
  }
}
