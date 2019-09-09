import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provides/shop_cart_provide.dart';
import './cart_item.dart';
import './cart_bottom.dart';
class ShopCart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('购物车',style: TextStyle(fontSize: ScreenUtil().setSp(30)),),
        ),
        body: FutureBuilder(
          future: _getinfo(context),
          builder: (context,snapshot){
            if (snapshot.hasData) {
                  List cartList = Provide.value<ShopCartProvide>(context).cartList;
                  print('购物车========================$cartList');
                  return Stack(
                    children: <Widget>[
                      Provide<ShopCartProvide>(
                        builder: (context,child,val){
                           //每次构建重新获得carlist
                          cartList = Provide.value<ShopCartProvide>(context).cartList;
                          return ListView.builder(
                              itemCount: cartList.length,
                              itemBuilder: (context,index){
                                return Cartitem(cartList[index]);
                              },
                          );
                        },
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          
                          child: CartBottom(),
                        ),
                      )


                    ],
                  );
            } else {
              return Text('正在加载');
            }
          },
        ),
      ),
    );
  }

  Future<String> _getinfo(BuildContext context)async{
    print(1);
    await Provide.value<ShopCartProvide>(context).getgoodsinfo();
    return 'end';
  }


}