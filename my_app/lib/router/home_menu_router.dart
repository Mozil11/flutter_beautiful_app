import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../home_menu_page/home_menu_page.dart';

//HomeMenuPage页的路由配置
Handler homeMenuHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,dynamic> params){
    String goodid = params['id'].first;//params传递的参数
    print('======${goodid}');
    return HomeMenuPage(goodid);
  }
);