import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MineUser extends StatelessWidget {
  List user = [
    {'name':'签到','item':'images/qiandao.png'},
    {'name':'任务中心','item':'images/renwu.png'},
    {'name':'优惠买单','item':'images/youhui.png'},
    {'name':'我的预约','item':'images/yuyue.png'},
    {'name':'客服中心','item':'images/kefu.png'},
    {'name':'用户保障','item':'images/baozhang.png'},
    {'name':'分享购','item':'images/fenxianggou.png'},
    {'name':'余额','item':'images/yue.png'},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
        child: Column(
          children: <Widget>[
            Title(),
            Itemwarp()
          ],
        ),
    );
  }

  Widget Title(){
    return Container(
       height: ScreenUtil().setHeight(80),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      alignment: Alignment.centerLeft,
      child: Text('工具',style: TextStyle(fontSize:ScreenUtil().setSp(30),fontWeight: FontWeight.w500),),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1
          )
        )
      ),
    );
  }
  Widget Itemwarp(){
    return Wrap(
      runSpacing: ScreenUtil().setHeight(20),
      spacing: ScreenUtil().setWidth(20),
      children: user.map((f){
        return Container(
          width: ScreenUtil().setWidth(150),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                child: Image.asset(f['item'],width: ScreenUtil().setWidth(50),),
              ),
              Container(
                child: Text('${f['name']}',style: TextStyle(fontSize: ScreenUtil().setSp(25),fontWeight: FontWeight.w300),),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}