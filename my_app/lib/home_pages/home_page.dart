import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provides/home_provide.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';//上拉下拉加载
import 'package:flutter_easyrefresh/phoenix_header.dart';
import 'home_search.dart';
import 'head_add.dart';
import 'head_local.dart';
import 'home_swiper.dart';
import 'home_menu.dart';
import 'home_nav.dart';
import 'home_photo.dart';
import 'home_diary.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<EasyRefreshState> _easyRefreshKey = GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey = GlobalKey<RefreshHeaderState>();//自定义下拉刷新key
  List item = [
    {'name':'精选','it':HomeDiary()},
    {'name':'眼部','it':HomeDiary()},
    {'name':'鼻部','it':HomeDiary()},
    {'name':'脂肪填充','it':HomeDiary()},
    {'name':'美肤','it':HomeDiary()},
    {'name':'瘦身塑形','it':HomeDiary()},
    {'name':'植发脱毛','it':HomeDiary()},
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: item.length,
      child: Scaffold(
         body: NestedScrollView(
           headerSliverBuilder: (context,bool innerBoxIsScrolled){
             return <Widget>[
               SliverOverlapAbsorber(
                 handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                 child: SliverAppBar(
                    backgroundColor: Colors.white,
                    title: Row(
                        children: <Widget>[
                          Location(),
                          Expanded(
                            child: SearchBar(),
                          )
                          ,
                          HeadAdd()
                        ],
                      ),
                    pinned: true,//appbar始终显示
                    expandedHeight:400,//z展开高度
                    forceElevated:innerBoxIsScrolled,//阴影随innerBoxIsScrolled是否滚动改变
                    //展开填充的内容
                    flexibleSpace:FlexibleSpaceBar(
                      centerTitle:true,
                      background: Column(children: <Widget>[
                        HomeSwiper(),
                        HomeMenu(),

                      ],),
                      
                      collapseMode:CollapseMode.pin,//展开动画
                    ),
                    bottom: TabBar(
                       isScrollable: true,
                       tabs: item.map((v){
                         return Container(
                           height: ScreenUtil().setHeight(80),
                           alignment: Alignment.center,
                           child: Text('${v['name']}',
                            style: TextStyle(color: Colors.black45,),
                           ),
                         );
                       }).toList(),
                    ),
                 ),
               )
             ];
           },
           body: TabBarView(
             children: item.map((f){
               return Builder(
                 builder: (context){
                   return CustomScrollView(
                     key: PageStorageKey(f['name']),
                     slivers: <Widget>[
                       SliverOverlapInjector(
                          handle:  NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                          
                        ),
                        SliverToBoxAdapter(
                          child: f['it'],
                        )
                     ],
                   );
                 },
               );
             }).toList(),
           ),
         ),
         
         
       ),
    );
  }
}
// body: EasyRefresh(
//            key: _easyRefreshKey,
//            refreshHeader: PhoenixHeader(
//                 key: _headerKey,
                
                
                
//               ),
//               child: ListView(
//               children: <Widget>[
//                 HomeSwiper(),
//                 HomeMenu(),
//                 HomeNav(),
//                 HomePhoto()
//               ],
//             ),
//              onRefresh:() async{//下拉刷新
//                 print('刷新');
//               }
//          ),
              
         
         

