import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvide with ChangeNotifier{
  bool isLogin = false;
  String phone='' ;
  String password = '';
  //获取判断手机号
  getPhone(ph){
      phone = ph;
      print('>>>>>>>>>>>>>>>>>>>>$phone');
     notifyListeners();
  }
  //获取密码
  getpassword(paw){
    password = paw;
    print('>>>>>>>>>>>>>>>>>>>>$password');
    notifyListeners();
  }
  //登录
  login()async{
    //初始化持久化
    SharedPreferences pre = await  SharedPreferences.getInstance();
    //先取出持久化的值
    isLogin = pre.getBool('isLoginState');
    print('isLogin>>>>>>>>>>>>>>>>>>>>>$isLogin');
    isLogin = true;
    pre.setBool('isLoginState', isLogin);
    print(isLogin);
    
    notifyListeners();
    return isLogin;
  }
  //退出
  outlog()async{
    SharedPreferences pre = await  SharedPreferences.getInstance();
    pre.remove('isLoginState');
    notifyListeners();
  }

}