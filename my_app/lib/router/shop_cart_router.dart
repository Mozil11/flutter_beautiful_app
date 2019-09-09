import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../shop_cart/shop_cart.dart';

Handler shopcartHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,dynamic> params){
    // String gid= params['i'].first;
    return ShopCart();
  }
);


