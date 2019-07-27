import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuNav extends StatelessWidget {
  String goodid;
  MenuNav(this.goodid);
  List item = [
    {'name':'光纤溶脂'},
    {'name':'射频溶脂'},
    {'name':'冷冻溶脂'},
    {'name':'超声溶脂'},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 100, 10, 10),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(200),
      decoration: BoxDecoration(
        color: Color.fromRGBO(199, 237, 233, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        
        children: <Widget>[
          ImageIcon(),
          Expanded(child: GoodItem(),)
          
        ],
      ),
    );
  }
  Widget ImageIcon(){
    ///字符串解码
    var list = List<int>();
    jsonDecode(goodid).forEach(list.add);

    var val =  Utf8Decoder().convert(list);
    return Container(
      width: ScreenUtil().setWidth(200),
      height: ScreenUtil().setHeight(200),
      // color: Colors.yellow,
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Image.asset('images/rongzhi.png',width: ScreenUtil().setWidth(80),fit: BoxFit.fill,),
          ),
          Container(
            child: Text('$val',style: TextStyle(color: Color.fromRGBO(80, 100, 80, 1)),),
          )
        ],
      ),
    );
  }
  Widget GoodItem(){
   
    return Container(
     
      // height: ScreenUtil().setHeight(200),
      child: Wrap(
        runSpacing: ScreenUtil().setHeight(20),
        spacing: ScreenUtil().setWidth(20),
        children: item.map((f){
          return InkWell(
            onTap: (){
              print('1');
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromRGBO(240,255, 250, 1),
                borderRadius: BorderRadius.circular(5)
              ),
              padding: EdgeInsets.all(5),
               
              width: ScreenUtil().setWidth(200),
              child: Text('${f['name']}',style: TextStyle(color: Color.fromRGBO(80, 100, 80, 1))),
            ),
          );
        }).toList(),
      ),
    );
  }
}