import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provides/home_provide.dart';

class HomeNav extends StatelessWidget {
  List item = [
    {'name':'精选'},
    {'name':'眼部'},
    {'name':'鼻部'},
    {'name':'脂肪填充'},
    {'name':'美肤'},
    {'name':'瘦身塑形'},
    {'name':'植发脱毛'},
  ];
  bool isA  = false;
  
  @override
  Widget build(BuildContext context) {
    return Provide<HomeProvide>(
      builder: (context,child,v){
        int indexpage = Provide.value<HomeProvide>(context).indexPage;
        return Container(
          height: ScreenUtil().setHeight(55),
          width: ScreenUtil().setWidth(750),
          // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ListView.builder(
              itemBuilder: (c,i){
                
                isA = indexpage == i ? true:false;
                return Container(
                  child: RaisedButton(
                    
                    color: Colors.white,
                    onPressed: (){
                    
                      Provide.value<HomeProvide>(context).changeMychoose(i);
                  

                    },
                    child: Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                      child: Column(
                      
                      children: <Widget>[
                        Text('${item[i]['name']}',style: TextStyle(fontWeight:isA?FontWeight.w600: FontWeight.w300),),
                        Container(
                          width: ScreenUtil().setWidth(30),
                          height: ScreenUtil().setHeight(4),
                          color: isA? Color.fromRGBO(199, 237, 233, 1):Colors.white,
                        )
                      ],
                    ),
                    )
                    
                  ),
                );
              },
              itemCount: item.length,
              scrollDirection: Axis.horizontal,
            ),
        );
      },
    );
    
  }
}

