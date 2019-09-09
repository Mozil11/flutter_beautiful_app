import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provides/shop_cart_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './cart_count.dart';
class Cartitem extends StatelessWidget {
  var item;
  Cartitem(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
          border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12
          )
        ),
      ),
        child: Row(
          children: <Widget>[
            _cartActionButton(context,item),
            _goodImage(item),

             _goodsName(item),
             Expanded(
               child:  _goodprice(context,item),
             )
            
          ],
        ),
    );
  }
  //选中按钮
  Widget _cartActionButton(context,item){
    return Container(
      child: Checkbox(
        value: item['isAction'],
        activeColor: Colors.pink,
        onChanged: (val){
          item['isAction'] = val;
          Provide.value<ShopCartProvide>(context).changeAction(item);
        },
      ),
    );
  }
  //商品图片
  Widget _goodImage(item){
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: Colors.black12)
      ),
      child: Image.network(item['images']),
    );
  }
//商品名称
Widget _goodsName(item){
  return Container(
    // color: Colors.blue,
    width: ScreenUtil().setWidth(280),
    padding: EdgeInsets.all(10),
    alignment: Alignment.topLeft,
    child: Column(
      children: <Widget>[
        Text(item['goodsName']),
        CartCount(item)
      ],
    ),
  );
}

//商品价格
Widget _goodprice(context,item){
  return Container(
    // width: ScreenUtil().setWidth(150),
    // color: Colors.blue,
    alignment: Alignment.centerRight,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

            Text('价格：'),
            Text('￥${item['price']}',style: TextStyle(color: Colors.pink),),
          ],
        ),
        Container(
          child: InkWell(
            child: Icon(Icons.delete,color: Colors.black26,size: 20,),
            onTap: (){
              Provide.value<ShopCartProvide>(context).delgoods(item['goodsId']);
            },
          ),
        )
      ],
    ),
  );
}

}