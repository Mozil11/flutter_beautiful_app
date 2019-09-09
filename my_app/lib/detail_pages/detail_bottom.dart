import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provides/shop_cart_provide.dart';
class DetailBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
      padding: EdgeInsets.only(top: 20),
      // color: Colors.blue,
      child: 
          Container(
            color: Colors.white,
            height: 60,
            child: Row(
                children: <Widget>[
                  Addshopcart(context),
                  Buybutton(context)
                ],
            ),
          ),
    ),
        Positioned(
            top: 0,
            right: 20,
            child: Ask(),
          )
      ],
    );
    
    
  }
  Widget Buybutton(context){
    return InkWell(
      onTap: (){
        Provide.value<ShopCartProvide>(context).remove();
      },
      child: Container(
     
        padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
        decoration: BoxDecoration(
          color: Color.fromRGBO(254, 67, 101, 1),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20)
          ),
        ),
        child: Text('立即支付',style: TextStyle(color: Colors.white),),
      ),
    );
    
  }
  Widget Addshopcart(context){
    return InkWell(
        onTap: (){
          Provide.value<ShopCartProvide>(context).save(1, '整容', 1, 500, 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3792086489,366048775&fm=26&gp=0.jpg');
        },
        child: Container(
        margin: EdgeInsets.only(left: 20),
        padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
        decoration: BoxDecoration(
          color: Color.fromRGBO(252, 157, 154, 1),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            topLeft: Radius.circular(20)
          ),
        ),
        child: Text('加购物车',style: TextStyle(color: Colors.white),),
      ),
    );
    
  }
  Widget Ask(){
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color.fromRGBO(199, 237, 233, 0.5),
        borderRadius: BorderRadius.circular(10),
        
      ),
      child: Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color.fromRGBO(199, 237, 233, 1),
        borderRadius: BorderRadius.circular(10),
        
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 5),
            child: Image.asset('images/zixun.png',fit: BoxFit.fill,width: 30,),
          ),
          Container(
            child: Text('私信咨询',style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    ),
    );
    
  }
}