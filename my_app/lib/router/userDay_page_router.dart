import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../user_day_pages/userDay_page.dart';

//userday页的路由配置
Handler userdayHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,dynamic> params){
    String gid = params['i'].first;//params传递的参数
    print('======${gid}');
    return UserDay();
  }
);