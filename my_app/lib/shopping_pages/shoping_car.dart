import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provides/index_provide.dart';

class ShoppingCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(100),
      alignment: Alignment.center,
        child: IconButton(
          onPressed: (){
            Provide.value<IndexProvide>(context).changePage(2);
          },
          icon: Image.asset('images/car.png',width: ScreenUtil().setWidth(40),),
        ),
    );
  }
}