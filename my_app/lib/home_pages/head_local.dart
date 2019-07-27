import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(100),
      alignment: Alignment.center,
       child: Text('杭州',style: TextStyle(color: Colors.black54,fontSize: ScreenUtil().setSp(30),fontWeight: FontWeight.w300),),
    );
  }
}