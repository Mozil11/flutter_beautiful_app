import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginDes extends StatefulWidget {
  @override
  _LoginDesState createState() => _LoginDesState();
}

class _LoginDesState extends State<LoginDes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
        child: SizedBox(
          width: ScreenUtil().setWidth(220),
          height: ScreenUtil().setHeight(200),
          child: TypewriterAnimatedTextKit(
            onTap: (){},
            text: ['Be young','Be beautiful'],
            textStyle: TextStyle(
                fontSize: ScreenUtil().setSp(40),
                fontFamily: "webfont",
                decoration: TextDecoration.none,
                color: Color.fromRGBO(254, 67, 101, 1),
            ),
            textAlign: TextAlign.start,
          ),
        ),
    );
  }
}