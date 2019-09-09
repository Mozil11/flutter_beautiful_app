import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provides/shop_cart_provide.dart';

class CartCount extends StatelessWidget {
  var item;
  CartCount(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(167),
        margin: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black12
          )
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: delButton(context,item),
            ),
            
            count(item),
            Expanded(
              child: addButton(context,item),
            )
            
          ],
        ),
    );
  }
  //减
  Widget delButton(context,item){
    return InkWell(
      onTap: (){
        Provide.value<ShopCartProvide>(context).changecount(item,'-');
      },
      child: Container(
        // width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(
              color: Colors.black12
            )
          )
        ),
        child: Text('-'),
      ),
    );
  }
  //加
Widget addButton(context,item){
    return InkWell(
      onTap: (){
        Provide.value<ShopCartProvide>(context).changecount(item,'+');
      },
      child: Container(
        // width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
              color: Colors.black12
            )
          )
        ),
        child: Text('+'),
      ),
    );
  }
  //数量显示
  Widget count(item){
    return Container(
      width: ScreenUtil().setWidth(80),
        height: ScreenUtil().setHeight(40),
        alignment: Alignment.center,
        color: Colors.white,
        child: Text('${item['count']}'),
    );
  }
}