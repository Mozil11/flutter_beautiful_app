import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './login_titel.dart';
import './login_des.dart';
import './login_input_phone.dart';
import './login_input_password.dart';
import './login_button.dart';
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    return Scaffold(
      body: Container(
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          LoginTitel(),
          LoginDes(),
          InputPhone(),
          InputPassword(),
          LoginButton()
        ],
      ),
    ),
    
    );
    
  }
}