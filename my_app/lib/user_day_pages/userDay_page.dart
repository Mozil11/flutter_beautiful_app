import 'package:flutter/material.dart';
import '../router/application.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './userDay_bottom.dart';
import './user_talk.dart';
class UserDay extends StatelessWidget {
  List photo = [
    { 'bsrc':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1243117175,488022012&fm=11&gp=0.jpg',
     'asrc':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1243117175,488022012&fm=11&gp=0.jpg',
     'context':'致力于整合医美机构，为医美用户提供解决方案，并构建医美安全体系的平台网站和App'
    },
    

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: headimage(),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
              child: Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(254, 67, 101, 1),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: <Widget>[
                  Text('关注'),
                  Icon(Icons.add,size: 20,)
                ],
              ),
            ),
            )
            
          ],
          leading: Builder(
            builder: (context){
              return IconButton(
                icon: Icon(Icons.arrow_back,color:Colors.black26),
                onPressed: (){
                  Application.router.pop(context);
                },
              );
            },
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              child: ListView(
                children: <Widget>[
                  Column(
                children: <Widget>[
                  Mainbody(photo[0]),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.black12
                        )
                      )
                    ),
                    child: Text('${photo[0]['context']}'),

                  ),
                 userTalk()
                ],
              ),
                ],
              )
              
            ),
            Positioned(
              child:  UserBottom(),
              bottom: 0,
              left: 0,
              right: 0,
            )
          ],
        )
        
    );
  }

  Widget Mainbody(src){
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: ABphoto(src),
    );
  }

  Widget ABphoto(src){
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
            
              child: Image.network(src['bsrc']),
              padding: EdgeInsets.all(5),
            ),
          ),
          Expanded(
            child: Container(
            
              child: Image.network(src['asrc']),
              padding: EdgeInsets.all(5),
            ),
          ),

          
        ],
      ),
    );
  }
  Widget headimage(){
    return Container(
      child: Row(
        children: <Widget>[
          ClipOval(
            child: Image.network('http://b-ssl.duitang.com/uploads/item/201510/08/20151008192345_uPC5U.jpeg',
            width: 30,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Text('小明',
              maxLines:1,
              overflow:TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black54,
                fontSize: ScreenUtil().setSp(25)
              ),
            ),
          ),
        ],
      ),
    );
  }
}