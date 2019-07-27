import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provides/login_provide.dart';

class InputPassword extends StatefulWidget {
  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool isLook = false;
  @override
  void initState() {
    isLook = false;
    super.initState();
  }
    TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: ScreenUtil().setWidth(30)),
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: ScreenUtil().setWidth(300),
        child: TextField(
          controller: _controller,
          autofocus: false,
          onChanged: (val){
            if(val!=''){
              Provide.value<LoginProvide>(context).getpassword(val);
            }
          },
          obscureText:!isLook,
          decoration: InputDecoration(
            
            labelText: '请输入密码',
            prefixIcon: Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(isLook?Icons.visibility:Icons.visibility_off),
              onPressed: (){
                setState(() {
                  isLook = !isLook;
                });
              },
            )
          ),
        ),
    );
  }
}