import 'package:flutter/material.dart';

class _Counter extends ChangeNotifier {
  final ValueNotifier<int> count = ValueNotifier(0);

  increment() {
    count.value++;
  }
}

final counterState = _Counter();