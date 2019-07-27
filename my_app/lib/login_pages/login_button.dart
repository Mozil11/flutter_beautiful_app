import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provide/provide.dart';
import '../provides/login_provide.dart';
import 'package:toast/toast.dart';

import '../index_page.dart';
class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool isloading= false;
  
  @override
  void initState() {
    isloading= false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Container(
        width: ScreenUtil().setWidth(300),
        height: ScreenUtil().setHeight(70),
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(80)),
        padding:EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: RaisedButton(
          color: Color.fromRGBO(254, 67, 101, 1),
          onPressed: (){
            String phone = Provide.value<LoginProvide>(context).phone;
            String paw = Provide.value<LoginProvide>(context).password;
            setState(() {
              isloading = !isloading;
            });
            if(phone!=''&&paw!=''){
              Provide.value<LoginProvide>(context).login().then(
                (val){
                      if(val){
                        Navigator.of(context).pushAndRemoveUntil(
                        new MaterialPageRoute(builder: (context) => IndexPage()
                        ), (route) => route == null);
                      }
                }
              );
              
              
            }else{
              Toast.show("输入正确的手机号或密码", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER,backgroundColor: Color.fromRGBO(254, 67, 101, 0.7),textColor: Colors.white,backgroundRadius: 5);

            }
            
          },
          child:!isloading? Text('登录',
          style: TextStyle(
            letterSpacing: 20,
            fontSize: ScreenUtil().setSp(30),
            color: Colors.white
          ),
          
          ):SpinKitPumpingHeart(
            color: Colors.white,
            size: ScreenUtil().setWidth(40),
          )
        ),
    );
  }
}