import 'package:flutter/material.dart';

class counternum extends ChangeNotifier {
  int counts = 0;

  int get count => counts;

  void increments() {
    counts++;
    notifyListeners();
  }

  void decrements() {
    counts--;
    notifyListeners();
  }
}
