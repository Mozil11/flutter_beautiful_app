import 'package:flutter/material.dart';
import './provides/index_provide.dart';
import 'package:provide/provide.dart';
import './login_pages/login_page.dart';
import './provides/login_provide.dart';
import './index_page.dart';
import './provides/home_provide.dart';
import 'package:fluro/fluro.dart';//路由插件
import './router/application.dart';//引入静态配置
import './router/main_router.dart';//引入主路由


void main(){
  //状态管理变量
  var loginProvide = LoginProvide();
  var indexProvide = IndexProvide();
  var homeProvide = HomeProvide();

  var providers = Providers();

providers
..provide(Provider<HomeProvide>.value(homeProvide))

..provide(Provider<LoginProvide>.value(loginProvide))
..provide(Provider<IndexProvide>.value(indexProvide));

  
  
  
  runApp(ProviderNode(child: MyApp(),providers: providers,));
  
  
  }

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    //定义一个路由
  final router = Router();
  //注册
    Routes.congfigRoutes(router);
    Application.router = router;
    // bool islog = Provide.value<LoginProvide>(context).isLogin;
    return Container(
      child: MaterialApp(
        onGenerateRoute: Application.router.generator,//app中引入路由
        title: '轻美',
        home: IndexPage(),
        theme: ThemeData(
          primarySwatch:Colors.pink
        ),
         debugShowCheckedModeBanner: false,//除去debug
      ),
    );
  }
}

