import 'package:flutter/material.dart';
import '../home_pages/home_search.dart';
import '../shopping_pages/shoping_car.dart';

class HomeMenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Row(
        children: <Widget>[
          Expanded(
            child: SearchBar(),
          ),
          ShoppingCar(),
        ],
      ),
    );
  }
}