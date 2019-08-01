import 'package:flutter/material.dart';

class UserWidth extends ChangeNotifier{
  int myWidth;
  getMywidth(width){
    myWidth = width;
    notifyListeners();
  }
}