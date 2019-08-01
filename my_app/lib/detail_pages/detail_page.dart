import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './detail_info.dart';
import '../router/application.dart';
import './detail_bottom.dart';
import './detail_appraise.dart';
import './detail_company.dart';
class DetailPage extends StatelessWidget {
  List a = [
      {'name':'美购','item':DetailInfo()},
      {'name':'评价','item':DetailAppraise()},
      {'name':'机构','item':DetailCompany()},
      {'name':'详情','item':DetailInfo()},
      {'name':'推荐','item':DetailInfo()},
      
    ];

  String id;
  DetailPage(this.id);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          body: DefaultTabController(
            length: a.length,
            child: NestedScrollView(
              headerSliverBuilder: (context,bool innerBoxIsScrolled){
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    child: SliverAppBar(
                      title:!innerBoxIsScrolled?Text(''): Text('商品详情',style: TextStyle(color: Colors.black45,fontSize: ScreenUtil().setSp(30)),),
                      backgroundColor: Colors.white,
                      pinned: true,
                      
                      // snap: true,
                      // floating: true,
                      actions: <Widget>[
                        Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                            borderRadius: BorderRadius.circular(60)
                          ),
                          child: IconButton(
                            padding: EdgeInsets.all(4),
                          icon: Icon(Icons.shopping_cart,color:Colors.black45),
                          tooltip: 'Open shopping cart',
                          onPressed: () {
                            // handle the press
                          },
                        ),
                        ),
                        
                      ],
                      leading: Builder(
                      builder: (context){
                        return Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          borderRadius: BorderRadius.circular(50)
                          ),
                          child: IconButton(
                          padding: EdgeInsets.all(4),
                          icon: Icon(Icons.arrow_back,color:Colors.black45),
                          onPressed: (){
                            Application.router.pop(context);
                          },
                        ),
                        );
                        
                      },
                    ),

                      expandedHeight: 300.0,
                      forceElevated: innerBoxIsScrolled,//阴影
                      flexibleSpace:FlexibleSpaceBar(
                        
                        centerTitle: true,
                        background: Image.network('https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3792086489,366048775&fm=26&gp=0.jpg'),
                        collapseMode:CollapseMode.pin,
                      ),
                      bottom: TabBar(
                        isScrollable: true,
                  // labelColor: Colors.yellow,
                  // indicatorColor: Colors.yellow,下划线颜色
                  tabs: a.map((a){
                    return Container(
                          height: ScreenUtil().setHeight(80),
                          alignment: Alignment.center,
                          child: Text('${a['name']}',
                            style: TextStyle(color: Colors.black45),
                          ),
                        
                        );
                        
                      }).toList(),
                      ),
                    ),
                  )
                ];
              },
              body: Stack(
                children: <Widget>[
                  TabBarView(
                    children: a.map((f){
                      return Builder(
                        builder: (context){
                          return CustomScrollView(
                            key: PageStorageKey(f['name']),
                            slivers: <Widget>[
                              SliverOverlapInjector(
                                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),

                              ),
                              SliverToBoxAdapter(
                                child: 
                                    f['item'],
                                    
                                  
                                
                              )
                            ],
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Positioned(
                    child: DetailBottom(),
                    bottom: 0,
                    left: 0,
                    right: 0,
                  )
                ],
              )
              
            ),
          ),
        ),
    );
  }
}