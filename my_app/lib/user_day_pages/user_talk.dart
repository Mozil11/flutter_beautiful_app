import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class userTalk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            _title(),
            _talk()
          ],
        ),
    );
  }
  Widget _title(){
    return Container(
       margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      child: Text('评论',style: TextStyle(fontSize: ScreenUtil().setSp(35),fontWeight: FontWeight.w500),),
    );
  }

  Widget _talk(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          _imagename(),
          _mycontext()
        ],
      ),
    );
  }
  Widget _imagename(){
    return Container(
      child: Row(
        children: <Widget>[
          ClipOval(
            child: Image.network('http://b-ssl.duitang.com/uploads/item/201510/08/20151008192345_uPC5U.jpeg',
            width: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text('小明'),
          )
        ],
      ),
    );
  }
  Widget _mycontext(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text('致力于整合医美机构，为医美用户提供解决方案，并构建医美安全体系的平台网站和App致力于整合医美机构，为医美用户提供解决方案，并构建医美安全体系的平台网站和App'),
    );
  }
  Widget _icon(){
    
  }
}