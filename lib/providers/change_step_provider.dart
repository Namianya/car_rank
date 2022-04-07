import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeStep extends ChangeNotifier {
  int _step = 0;
  int get step => _step;
  // set step

  void nextStep() {
    if (_step < 10) {
      _step++;
      notifyListeners();
    }
    
    notifyListeners();
  }
  // previos step
  void prevStep() {
    if (_step > 0) {
      _step--;
      notifyListeners();
    }
    notifyListeners();
  }
}

final stepsProvider = ChangeNotifierProvider<ChangeStep>((ref) {
  return ChangeStep();
});