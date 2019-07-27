import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTag extends StatelessWidget {
  String name = '';
  MyTag(this.name);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child:Row(
        children: <Widget>[
          Image.asset('images/tag.png',width: ScreenUtil().setWidth(60),),
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border(
                right: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(147, 224, 255, 1)
                ),
                top: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(147, 224, 255, 1)
                ),
                bottom: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(147, 224, 255, 1)
                ),
                left: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(147, 224, 255, 1)
                ),
                
              )
            ),
            child: Text(
              name,
              style: TextStyle(color: Color.fromRGBO(147, 224, 255, 1),fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}