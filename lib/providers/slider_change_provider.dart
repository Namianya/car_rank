import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SliderChange extends ChangeNotifier {
  int _currentValue = 0;
  int get currentValue => _currentValue;

   set currentValue(int value) {
    _currentValue = value;
    notifyListeners();
  }
}

final sliderChangeProvider = ChangeNotifierProvider<SliderChange>((ref) {
  return SliderChange();
});
