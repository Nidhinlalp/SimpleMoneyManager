import 'package:flutter/material.dart';

class OnBoardingProvider extends ChangeNotifier {
  bool onLastPage = false;

  bool isVisible = true;

  void pageChanging(index) {
    onLastPage = (index == 2);
    // notifyListeners();
    isVisible = (index != 2);
    notifyListeners();
  }
}
