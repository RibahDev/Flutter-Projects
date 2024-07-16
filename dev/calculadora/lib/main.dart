import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String numero = 'Número';

  void calcular(String tecla) {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case '/':
      case 'X':
      case '-':
      case '+':
      case ',':
        setState(() {
          numero += tecla;
        });
        break;

      case 'AC':
        setState(() {
          numero = '0';
        });
        break;

      default:
        numero += tecla;

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'Calculadora',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  numero,
                  style: TextStyle(fontSize: 72),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calcular('AC'),
                  child: Text(
                    'AC',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                Text(''),
                Text(''),
                GestureDetector(onTap: () => calcular('<X'),
                  child: Text(
                    '<X',
                    style: TextStyle(fontSize: 48),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () => calcular('7'),
                    child: Text(
                      '7',
                      style: TextStyle(fontSize: 48),
                    )),
                GestureDetector(
                  onTap: () => calcular('8'),
                  child: Text(
                    '8',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(onTap: () => calcular('9'),
                  child: Text(
                    '9',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(onTap: () => calcular('/'),
                  child: Text(
                    '/',
                    style: TextStyle(fontSize: 48),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(onTap: () => calcular('4'),
                  child: Text(
                    '4',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(onTap: () => calcular('5'),
                  child: Text(
                    '5',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(onTap: () => calcular('6'),
                  child: Text(
                    '6',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(onTap: () => calcular('X'),
                  child: Text(
                    'X',
                    style: TextStyle(fontSize: 48),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(onTap: () => calcular('1'),
                  child: Text(
                    '1',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(onTap: () => calcular('2'),
                  child: Text(
                    '2',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(onTap: () => calcular('3'),
                  child: Text(
                    '3',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(onTap: () => calcular('-'),
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 48),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(onTap: () => calcular('0'),
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(onTap: () => calcular(','),
                  child: Text(
                    ',',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(onTap: () => calcular('='),
                  child: Text(
                    '=',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(onTap: () => calcular('+'),
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 48),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
