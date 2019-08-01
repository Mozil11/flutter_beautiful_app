import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailAppraise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            top(),
            des(),
            usershow()
          ],
        ),
    );
  }

  Widget top(){
    return Container(
      
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Text('5.0',style:TextStyle(color: Colors.pink,fontSize: ScreenUtil().setSp(40))),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text('非常好',style: TextStyle(fontSize: ScreenUtil().setSp(30),fontWeight: FontWeight.w700),),
          )
        ],
      ),
    );
  }
  Widget des(){
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Container(
            child: Text('术后效果：',style:TextStyle(color: Colors.black38)),
          ),
          Container(
            child: Text('4.8',style:TextStyle(color: Colors.black38)),
          ),
          Container(
            child: Text('就医环境：',style:TextStyle(color: Colors.black38)),
          ),
          Container(
            child: Text('5.0',style:TextStyle(color: Colors.black38)),
          ),
          Container(
            child: Text('医生态度：',style:TextStyle(color: Colors.black38)),
          ),
          Container(
            child: Text('5.0',style:TextStyle(color: Colors.black38)),
          )
        ],
      ),
    );
  }
  Widget usershow(){
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
      margin: EdgeInsets.only(top: 5),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child:ClipOval(

                    child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563721978806&di=6a3908da3b7ec0a877ad9648de4f42ea&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Ftieba%2Fios%2Fpost%2F20190719%2F4%2Fc21b875997da8185469fc0e45f51838c_570.jpg',
                      fit: BoxFit.fill,
                      width: 30,
                    ),
                  ),
                ),
                Container(
                  child: Text('轻美用户',style: TextStyle(color: Colors.black38,fontWeight:FontWeight.w400 ),),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1243117175,488022012&fm=11&gp=0.jpg',width: ScreenUtil().setWidth(300),),
                    ),
                  ),
                ),
                
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1243117175,488022012&fm=11&gp=0.jpg',width: ScreenUtil().setWidth(300),),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(5),
            child: Text('天气'),
          )
          
        ],
      ),
    );
  }
}