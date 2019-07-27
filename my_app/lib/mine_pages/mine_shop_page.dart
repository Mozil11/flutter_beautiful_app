import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MineShop extends StatelessWidget {
  List item = [
    {'item':'images/dingdan.png','name':'我的订单'},
     {'item':'images/gouwuche.png','name':'购物车'},
      {'item':'images/juan.png','name':'美卷'},
       {'item':'images/dianpu.png','name':'美分商城'},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
     height: ScreenUtil().setHeight(230),
    //  width: ScreenUtil().setWidth(720),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child:Column(
        children: <Widget>[
            Title(),
            ShopItem()
        ],
      ),
    );
  }
  Widget Title(){
    return Container(
      height: ScreenUtil().setHeight(80),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      alignment: Alignment.centerLeft,
      child: Text('我的商品',style: TextStyle(fontSize:ScreenUtil().setSp(30),fontWeight: FontWeight.w500),),
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
  Widget ShopItem(){
    return Container(
      child: Row(
        children: item.map((f){
          return Expanded(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Image.asset(f['item'],width: ScreenUtil().setWidth(50),),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 3),
                    child: Text('${f['name']}',style: TextStyle(fontSize: ScreenUtil().setSp(25),fontWeight: FontWeight.w300),),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}