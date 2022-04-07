import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationIndexProvider extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  set index(int value) {
    _index = value;
    notifyListeners();
  }
}

final navigationIndexProvider =
    ChangeNotifierProvider<NavigationIndexProvider>((ref) {
  return NavigationIndexProvider();
});
