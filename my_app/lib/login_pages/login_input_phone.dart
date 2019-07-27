import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provides/login_provide.dart';

class InputPhone extends StatelessWidget {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: ScreenUtil().setWidth(300),
        child: TextField(
          controller: _controller,
          autofocus: false,
          keyboardType: TextInputType.number,
          onChanged: (val){
            var emailReg = RegExp(r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
            print(emailReg.hasMatch(val));
            if(emailReg.hasMatch(val)){
              Provide.value<LoginProvide>(context).getPhone(val);
            }
            
          },
          decoration: InputDecoration(
            
            labelText: '请输入手机号',
            prefixIcon: Icon(Icons.phone)
          ),
        ),
    );
  }
  
}