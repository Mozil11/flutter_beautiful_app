import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../detail_pages/detail_page.dart';

Handler detailpageHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,dynamic> params){
    String id = params['id'].first;//params传递的参数
    print('======${id}');
    return DetailPage(id);
  }
);