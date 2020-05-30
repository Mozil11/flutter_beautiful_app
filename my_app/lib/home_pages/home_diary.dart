import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_app/router/application.dart';
import '../tag.dart';
import 'package:provide/provide.dart';
import '../provides/home_provide.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';//上拉下拉加载
import 'package:flutter_easyrefresh/taurus_footer.dart';

class HomeDiary extends StatefulWidget {
  @override
  _HomeDiaryState createState() => _HomeDiaryState();
}

class _HomeDiaryState extends State<HomeDiary> with AutomaticKeepAliveClientMixin{
  ScrollController _scrollController = new ScrollController();
  GlobalKey<RefreshFooterState> _footerKey = GlobalKey<RefreshFooterState>();//自定义上拉加载的固定key
GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
    @override

get wantKeepAlive => true;

  List diary = [
    {
      'src':'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1243117175,488022012&fm=11&gp=0.jpg'
      ,'islike':false,
      'id':3,
      'count':0
    },
    {
      'src':'https://5b0988e595225.cdn.sohucs.com/images/20171107/f9ea65cb453947f299dea65dd0d5c541.jpeg',
      'islike':false,
      'id':4,
      'count':0
    },
    {
      'src':'http://5b0988e595225.cdn.sohucs.com/images/20170827/41e9820351a84b90a0130f70f91a097c.jpeg',
      'islike':false,
      'id':5,
      'count':0
    }
  ];
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        
        // controller: _scrollController,
        shrinkWrap: true,//异步加载 父级可以不需要高
        itemCount: diary.length,
        primary: false,
        
        crossAxisCount: 4,
         mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
           staggeredTileBuilder: (index) => StaggeredTile.fit(2),
          itemBuilder: (context,i){
            return CardDiary(diary[i],i);
          },
          
      );
    // Container(
    //   // height: ScreenUtil().setHeight(1034),
    //   padding: const EdgeInsets.all(4.0),
    //   color: Colors.white,
    //   child: EasyRefresh(
    //     key: _easyRefreshKey,
    //     refreshFooter: TaurusFooter(
    //       key: _footerKey,
    //     ),
    //     child: ,
    //     loadMore: (){
    //       print('jiazai');
    //     },
    //   ),
      
    // );
  }
  Widget CardDiary(v,i){
    
    return 
       Card(
         
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6.0),
                    topRight: Radius.circular(6.0),
                    bottomLeft: Radius.circular(6.0),
                    bottomRight: Radius.circular(6.0),
        )),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: (){
                Application.router.navigateTo(context, '/userdayPage?i=$i');
              },
              child:  ClipRRect(
              child: Image.network(v['src'],fit: BoxFit.cover,),
              borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(6.0),
                    topRight: Radius.circular(6.0),
              ),
            ),
            ),
           
            
            Container(
              height: 130,
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      'Card接受单个widget，但该widget可以是Row，Column或其他包含子级列表的widget',
                      maxLines:2,
                      overflow:TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black54
                      ),
                    ),

                  ),
                  MyTag('眼部'),
                  Container(
                  
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
                        child: Text('小明',
                          maxLines:1,
                          overflow:TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black54
                          ),
                        ),
                      ),
                      Expanded(
                        child: Taplike(),
                        
                      )
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

  Widget Taplike(){
    return Container(
      padding: EdgeInsets.only(left: 20),
      alignment: Alignment.centerRight,
      child: Row(
        children: <Widget>[
          Container(
            child: Icon(
              Icons.message,
              color: Colors.black38,
            ),
          ),
          
          Text('10',
            style: TextStyle(color: Colors.black38),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
           
              child:  LikeButton(
                size:ScreenUtil().setWidth(40),
                likeCount: 6,
                countBuilder: (int count, bool isLiked, String text) {
                  var color = isLiked ? Colors.pinkAccent : Colors.grey;
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
                // onTap: (isLike){
                //   return ;
                // },
              ),
              
       
           
          )
          
        ],
      ),
    );
  }
}
