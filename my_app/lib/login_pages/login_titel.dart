import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTitel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(200)),
        child: Text(
          '轻美',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(100),
            color: Color.fromRGBO(254, 67, 101, 1),
            fontFamily: 'webfont',
            decoration:TextDecoration.none,
            letterSpacing: 10
          ),
        ),
    );
  }
}