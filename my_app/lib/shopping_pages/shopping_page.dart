import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './shopping_local.dart';
import './shopping_search.dart';
import './shoping_car.dart';
import './shopping_menu.dart';
import './shopping_item.dart';
class ShoppingPage extends StatelessWidget {
  List a = ['全部项目','智能排序','筛选','全部项目','智能排序','筛选'];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: DefaultTabController(
          length: a.length,
          child: NestedScrollView(
          headerSliverBuilder:(context,bool innerBoxIsScrolled){
            return <Widget>[
              SliverOverlapAbsorber(
                 // 传入 handle 值，直接通过 `sliverOverlapAbsorberHandleFor` 获取即可
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  backgroundColor: Colors.white,
                title: Row(
                    children: <Widget>[
                      Location(),
                      Expanded(
                        child: ShoppingSearchBar(),
                      )
                      ,
                      ShoppingCar()
                    ],
                  ),
                pinned: true,//如果设置了 pinned 属性，那么 AppBar 就会在界面上不会消失
                expandedHeight: 300.0,// 展开的高度
                forceElevated: innerBoxIsScrolled,//阴影
                flexibleSpace:FlexibleSpaceBar(
                  centerTitle: true,background: ShoppingMenu(),
                  collapseMode:CollapseMode.pin,//背景折叠动画
                ),
                bottom: TabBar(
                  isScrollable: true,
                  // labelColor: Colors.yellow,
                  // indicatorColor: Colors.yellow,下划线颜色
                  tabs: a.map((a){
                    return Container(
                      height: ScreenUtil().setHeight(80),
                      alignment: Alignment.center,
                      child: Text('$a',
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
            children:a.map((a){
              return Builder(
                builder: (context){
                  return CustomScrollView(
                    
                    key: PageStorageKey(a), // key 保证唯一性
                    slivers: <Widget>[
                        // 将子部件同 `SliverAppBar` 重叠部分顶出来，否则会被遮挡
                        SliverOverlapInjector(
                          handle:  NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                          
                        ),
                        //类似gridview
                        // SliverGrid(
                        //   delegate:SliverChildBuilderDelegate(
                        //     (_,index){
                        //       return Image.asset('images/car.png');
                        //     },
                        //     childCount:8
                        //   ),
                        //   gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                        //     crossAxisCount: 4,mainAxisSpacing:10,crossAxisSpacing:10
                        //   )
                        // ),
                        SliverFixedExtentList(
                          
                          delegate:SliverChildBuilderDelegate(
                            
                            (_,index){
                              return ShoppingItem();
                            },
                            childCount:15

                          ),
                          itemExtent:150,

                        )

                    ],
                  );
                },
              );
            }).toList()
              
        
          ),
        ),
        )
        
      ),
    );
    // return Container(
    //     child: Scaffold(
    //       appBar: AppBar(
    //         backgroundColor: Colors.white,
    //         title: Row(
    //           children: <Widget>[
    //             Location(),
    //             Expanded(
    //               child: ShoppingSearchBar(),
    //             )
    //             ,
    //             ShoppingCar()
    //           ],
    //         ),
    //       ),
    //     ),
    // );
  }
}