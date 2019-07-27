import 'package:flutter/material.dart';
import '../router/application.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './home_menu_bar.dart';
import './menu_nav.dart';
import '../shopping_pages/shopping_item.dart';
import '../home_pages/home_swiper.dart';

import '../down_menu/down_menu.dart';
import 'package:dropdown_menu/dropdown_menu.dart';
import '../down_menu/down_menu_head.dart';

class HomeMenuPage extends StatefulWidget {
  String goodid;
  HomeMenuPage(this.goodid);
  @override
  _HomeMenuPageState createState() => _HomeMenuPageState();
}

class _HomeMenuPageState extends State<HomeMenuPage> {
  List item =[
    {'name':'美购'},
    {'name':'日记'},
    {'name':'帖子'},
    {'name':'问答'},
    {'name':'百科'},
    {'name':'医生'},
    {'name':'医院'},
  ];
   ScrollController scrollController;
  @override
  void initState() {
    scrollController = new ScrollController();
    globalKey = new GlobalKey();
    super.initState();
  }
  void _onTapHead(int index) {
    RenderObject renderObject = globalKey.currentContext.findRenderObject();
    DropdownMenuController controller =
        DefaultDropdownMenuController.of(globalKey.currentContext);
    //
    scrollController
        .animateTo(scrollController.offset + renderObject.semanticBounds.height,
            duration: new Duration(milliseconds: 150), curve: Curves.ease)
        .whenComplete(() {
      controller.show(index);
    });
  }
    GlobalKey globalKey;
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
       
        body: DefaultTabController(
          length: item.length,
          child: NestedScrollView(
            headerSliverBuilder: (context,bool innerBoxIsScrolled){
              return <Widget>[
                SliverOverlapAbsorber(
                  // 传入 handle 值，直接通过 `sliverOverlapAbsorberHandleFor` 获取即可
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  child: SliverAppBar(
                    backgroundColor: Colors.white,
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
                    title: HomeMenuBar(),
                    pinned: true,//如果设置了 pinned 属性，那么 AppBar 就会在界面上不会消失
                    expandedHeight: 250.0,// 展开的高度
                    forceElevated: innerBoxIsScrolled,//阴影
                    flexibleSpace:FlexibleSpaceBar(
                      centerTitle: true,
                      background: Column(children: <Widget>[
                        // HomeSwiper(),
                         MenuNav(widget.goodid)
                      ],)
                     ,
                      collapseMode:CollapseMode.pin,//背景折叠动画
                    ),
                    bottom: TabBar(
                      isScrollable: true,
                      tabs: item.map((f){
                        return Container(
                          height: ScreenUtil().setHeight(80),
                          alignment: Alignment.center,
                          child: Text('${f['name']}',
                            style: TextStyle(color: Colors.black45),
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
                return  Builder(
                  builder: (context){
                    return DefaultDropdownMenuController(
                      onSelected: ({int menuIndex, int index, int subIndex, dynamic data}) {
                        print(
                            "menuIndex:$menuIndex index:$index subIndex:$subIndex data:$data");
                      },
                      child: Stack(
                          children: <Widget>[
                            CustomScrollView(
                               controller: scrollController,
                              key: PageStorageKey(f['name']),
                              slivers: <Widget>[
                                // 将子部件同 `SliverAppBar` 重叠部分顶出来，否则会被遮挡
                                SliverOverlapInjector(
                                  handle:  NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                                  
                                ),
                                new SliverPersistentHeader(
                                  delegate: new DropdownSliverChildBuilderDelegate(
                                      builder: (BuildContext context) {
                                    return new Container(
                                        color: Theme.of(context).scaffoldBackgroundColor,
                                        child: MenuHeader(onTap: _onTapHead,));
                                  }),
                                  pinned: true,
                                  floating: false,
                                ),
                                 SliverToBoxAdapter(
                                  child:ShoppingItem(),
                                )
                              ],

                            ),
                            new Padding(
                              
                            padding: new EdgeInsets.only(top: ScreenUtil().setWidth(350)),
                            child: DownMenu()),
                            

                          ],
                        ),
                    );
                    
                    
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

