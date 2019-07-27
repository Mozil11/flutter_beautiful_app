import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './mine_shop_page.dart';
import './mine_user_page.dart';
class MinePage extends StatelessWidget {
  List<Map> val = [
    {'count':'0','name':'日记'},
    {'count':'0','name':'帖子'},
    {'count':'0','name':'问题'},
    {'count':'0','name':'收藏'}
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: Scaffold(
          
          appBar: AppBar(
            
          ),
          body: SingleChildScrollView(
            
            child: Column(
              
              children: <Widget>[
                Head(),
                Stack(
                  children: <Widget>[
                      Textdata(),
                      Positioned(
                        child: MineShop(),
                        left: 10,
                        right: 10,
                        bottom: ScreenUtil().setWidth(-40),
                      )
                  ],
                ),
                MineUser()
              ],
            ),
          ),
        ),
    );
        
    
  }
  Widget Head(){
    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      color:Colors.pink,
      child: Row(
        children: <Widget>[
            Container(
               // color: Colors.white,
              padding: EdgeInsets.all(10),
              child: ClipOval(
                child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563721978806&di=6a3908da3b7ec0a877ad9648de4f42ea&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Ftieba%2Fios%2Fpost%2F20190719%2F4%2Fc21b875997da8185469fc0e45f51838c_570.jpg',
                  fit: BoxFit.fill,
                  
                  width: ScreenUtil().setWidth(150),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text('轻美用户',style: TextStyle(color: Colors.white,fontSize:ScreenUtil().setSp(35),fontWeight: FontWeight.w700),),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          
                          onTap: (){},
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Colors.black12),
                              borderRadius: BorderRadius.circular(40)
                            ),
                            width: ScreenUtil().setWidth(150),
                            height: 30,
                            child: Text('粉丝 0',style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        
                        Padding(
                          padding: EdgeInsets.all(5),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Colors.black12),
                              borderRadius: BorderRadius.circular(40)
                            ),
                            width: ScreenUtil().setWidth(150),
                            height: 30,
                            child: Text('关注 0',style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  )
                
                ],
              ),
            )
        ],
      ),
    );
  }
  Widget Textdata(){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          color:Colors.pink,
          child: Row(
            children: val.map((f){
              return Expanded(
                child: Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: <Widget>[
                      Text('${f['count']}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: ScreenUtil().setSp(35)),),
                      Text('${f['name']}',style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(50),
            
          ),
        )
      ],
    );
    
      
  }

}