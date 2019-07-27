import 'package:flutter/material.dart';

class IndexProvide with ChangeNotifier{
  int currentindex = 0;
  changePage(index){
    currentindex = index;
    notifyListeners();
  }
}