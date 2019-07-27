import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './home_menu_router.dart';//引入子路由

//配置总路由
class Routes {
  //定义路由路径
  static String root = '/';//默认路由
  static String homeMenuPage = '/homeMenuPage';//首页菜单页路由
  //定义方法  传递路由
  static void congfigRoutes(Router router){
    //配置找不到路由的情况
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context,Map<String,dynamic> params){
        print('页面不存在');
      }
    );
    //配置路由
    router.define(homeMenuPage,handler: homeMenuHandler);

  }


}