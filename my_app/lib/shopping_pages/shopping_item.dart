import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShoppingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(10),
      // width: ScreenUtil().setWidth(750),
      decoration: BoxDecoration(
      color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
        child: Row(
          children: <Widget>[
            Image.network('https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3792086489,366048775&fm=26&gp=0.jpg',
                width: ScreenUtil().setWidth(190),
            ),
            Container(
               width: ScreenUtil().setWidth(510),
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      '深圳医美——专业发制品及美发用品展览会',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(30),
                        
                      ),
                     maxLines:2,
                    overflow:TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Text(
                      '王勇   杭州业发制品及美发用品展览会',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: ScreenUtil().setSp(20)
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      '￥12000',
                      style: TextStyle(
                        color: Colors.pink,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
    );
  }
}