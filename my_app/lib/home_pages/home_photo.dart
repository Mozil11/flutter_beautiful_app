import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../tag.dart';
import 'package:provide/provide.dart';
import 'home_diary.dart';
import '../provides/home_provide.dart';
import 'package:like_button/like_button.dart';

class HomePhoto extends StatefulWidget {
  @override
  _HomePhotoState createState() => _HomePhotoState();
}

class _HomePhotoState extends State<HomePhoto> with AutomaticKeepAliveClientMixin{
  @override

get wantKeepAlive => true;
  List photo= [
    {
      'src':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563282932087&di=a9a63f874956f5e39179c85ba10a00f3&imgtype=0&src=http%3A%2F%2Fcdn2.ettoday.net%2Fimages%2F3320%2Fe3320677.jpg'
      ,'islike':false,
      'id':0,
      'count':0
    },
    {
      'src':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563282932082&di=e6e6864244a63c65527d6b819c15bd19&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fbainuo%2Fcrop%3D0%2C6%2C640%2C388%3Bw%3D470%3Bq%3D99%2Fsign%3Db4df2a075e2c11dfca9ee5635e174ee6%2F4034970a304e251f43cc091cae86c9177f3e531f.jpg'
      ,'islike':false,
      'id':1,
      'count':0
    },
    {
      'src':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563282932079&di=62891ab3cebf052c6490dd8eb7a591aa&imgtype=0&src=http%3A%2F%2Fs1.sinaimg.cn%2Fmw690%2F001J8hDjzy6VY2UMhdSe0%26690'
      ,'islike':false,
      'id':2,
      'count':0
    }
  ];
  @override
  Widget build(BuildContext context) {
    // Provide.value<HomeProvide>(context).showphoto(photo);
    return Cardphoto();
    // Provide<HomeProvide>(
    //   builder: (context,child,v){
    //     return ;
    //   },
    // );
    
  }
Widget Cardphoto(){
  return  Container(
          color: Colors.white,
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        height: ScreenUtil().setHeight(733),
        width: ScreenUtil().setWidth(750),
        child: Swiper(
          onTap: (i){
            print(i);
          },
          itemCount: photo.length,
          itemBuilder: (c,i){
            return Card(
              elevation: 20,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: ClipRRect(
              
              borderRadius: BorderRadius.circular(20),
              child: Cardstack(context,photo[i],i),
            ),
            );
            
          },
          itemWidth: 350,
          layout: SwiperLayout.STACK,
        ),
    );
    
}

Widget Cardstack(context,phot,i){
    return Stack(
      children: <Widget>[
         Image.network(phot['src'],height: ScreenUtil().setHeight(733),fit: BoxFit.fill,),
         Positioned(
           height: ScreenUtil().setHeight(250),
           bottom: 0,
           left: 0,
           child: Container(
             width: ScreenUtil().setWidth(635),
             height: ScreenUtil().setHeight(200),
             color: Color.fromRGBO(0, 0, 0, 0.4),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    '后来我总算学会了如何去爱，后来终于在眼泪中明白.后来我总算学会了如何去爱，',
                    maxLines:2,
                    overflow:TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                MyTag('眼部'),
                Container(
                  
                   width: ScreenUtil().setWidth(635),
                  padding: EdgeInsets.only(left: 5),
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: <Widget>[
                      ClipOval(
                        child: Image.network('http://b-ssl.duitang.com/uploads/item/201510/08/20151008192345_uPC5U.jpeg',
                        width: 30,
                        ),
                  
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        width: ScreenUtil().setWidth(335),
                        child: Text('小明',
                          maxLines:1,
                          overflow:TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                      Expanded(
                        child: Talkandgood(context,phot,i),
                        
                      )
                    ],
                  ),
                )
              ],
            ),
           ),
         )
      ],
    );
  }
  
  Widget Talkandgood(context,ph,i){
    //provide管理的 list
    //  List mylist =Provide.value<HomeProvide>(context).mylist;
    return Container(
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.centerRight,
      child: Row(
        children: <Widget>[
          Container(
            child: Icon(
              Icons.message,
              color: Colors.white,
            ),
          ),
          Text('10',
            style: TextStyle(color: Colors.white),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: LikeButton(
                size:ScreenUtil().setWidth(40),

                //渲染点赞 初始已点赞状态
                // isLiked: mylist[i]['islike'],
                likeBuilder: (bool isLiked) {
                 
                  var color = isLiked? Colors.pinkAccent:Colors.white;
                return Icon(
                  Icons.favorite,
                  color: color,
                  size:ScreenUtil().setWidth(40),
                );
              },
                // likeCount: 6,
                countBuilder: (int count, bool isLiked, String text) {
                 
                  var color = isLiked? Colors.pinkAccent : Colors.white;
                  Widget result;
                  if (count == 0) {
                    result = Text(
                      "love",
                      style: TextStyle(color: color),
                    );
                  } else
                    result = Text(
                      text,
                      style: TextStyle(color: color),
                    );
                  return result;
                },
                // onTap: (isLiked){
                //   print('onTap>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$isLiked');
                //   return onLikeButtonTap(isLiked, ph);
                  
                // },
                
              ),
           
          )
          
        ],
      ),
    );
    
  }
    Future<bool> onLikeButtonTap( isLiked,  item) {
    ///send your request here
    ///
    
    final Completer<bool> completer = new Completer<bool>();
    Timer(const Duration(milliseconds: 300), () {
      Provide.value<HomeProvide>(context).like(item['id'],isLiked);
      

      // if your request is failed,return null,
     completer.complete(item['islike']);
    });

    
    return completer.future;
  }


}



  


