import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
     
      
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Price(),
          Titel(),
          FangXinGou(context)
        ],
      ),
    );
  }
  Widget Price(){
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('￥500-19800',style: TextStyle(fontSize: ScreenUtil().setSp(35),color: Colors.red),),
          Text('原价 ￥2980-39800',style: TextStyle(color: Colors.black26, decoration: TextDecoration.lineThrough,decorationColor: Colors.black26),)
        ],
      ),
    );
  }
  Widget Titel(){
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('【面部/吸脂】2天消肿，3天面套！吸出脂肪可回填凹陷，脂肪填充修复',style: TextStyle(fontSize: ScreenUtil().setSp(37),),),
          Container(
            child:Text('杭州·已购买 699',style: TextStyle(fontSize: ScreenUtil().setSp(25),color: Colors.black38),)
,           margin: EdgeInsets.only(top: 10),
          )
        ],
      ),
    );
  }
  Widget FangXinGou(context){
    return InkWell(
      onTap: (){
        showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child: Text('服务说明'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text('分期服务'),
                          ),
                          Container(
                            child: Text('支持花呗',style: TextStyle(color: Colors.black38,fontSize: ScreenUtil().setSp(20)),),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text('美丽保'),
                          ),
                          Container(
                            child: Text('支持花呗',style: TextStyle(color: Colors.black38,fontSize: ScreenUtil().setSp(20)),),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text('急速退款'),
                          ),
                          Container(
                            child: Text('支持花呗',style: TextStyle(color: Colors.black38,fontSize: ScreenUtil().setSp(20)),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            });
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
            
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text('放心购',style: TextStyle(color: Colors.black38),),
            ),
            Expanded(
              child: Container(
              child: Text('美丽购·极速退款·先行赔付'),
            ),
            ),
            Expanded(child:
              Container(
                alignment: Alignment.centerRight,
                child: Icon(Icons.chevron_right),
              ) ,
            )
            
          ],
        ),
      ),
    );
    
  }
  
}