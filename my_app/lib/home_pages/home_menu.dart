import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../router/application.dart';
class HomeMenu extends StatelessWidget {
  int current = 0;
  List swiperList = [
    {'src':'images/bizi.png','name':'鼻部'},
    {'src':'images/eye.png','name':'眼部'},
    {'src':'images/shoushen.png','name':'美体瘦身'},
    {'src':'images/lunkuo.png','name':'面部轮廓'},
    {'src':'images/pifu.png','name':'医学美肤'},
    {'src':'images/kouqiang.png','name':'口腔齿科'},
    {'src':'images/bo.png','name':'玻尿酸'},
    {'src':'images/ban.png','name':'半永久'},
    {'src':'images/xiong.png','name':'胸部'},
    {'src':'images/xiaba.png','name':'修复'},
    {'src':'images/zuichun.png','name':'唇部'},
    {'src':'images/zhifa.png','name':'植发脱毛'},
    {'src':'images/jinzhi.png','name':'抗衰紧致'},
    {'src':'images/simi.png','name':'私密'},
    {'src':'images/all.png','name':'全部'},
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Wrap(
          runSpacing: ScreenUtil().setWidth(10),
          spacing: ScreenUtil().setHeight(10),
          children: swiperList.map((v){
            var i = current;
            current++;
            return InkWell(
              onTap: (){
                //字符串编码
                var val = jsonEncode(Utf8Encoder().convert(v['name']));
                Application.router.navigateTo(context, '/homeMenuPage?id=$val');
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width/6,
                child: Column(
                   mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      child: Container(
                        child: Image.asset(v['src']),
                        height: MediaQuery.of(context).size.width * 0.08,
                        width: MediaQuery.of(context).size.width * 0.08,
                      ),
                    ),
                    Padding(padding: new EdgeInsets.only(top:6.0),child: new Text("${v['name']}",style: TextStyle(fontSize: ScreenUtil().setSp(25),fontWeight: FontWeight.w300),),)
                  ],
                ),
              ),
            );
          }).toList(),
        ),
    );
  }
}