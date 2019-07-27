import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './fatie_page.dart';
import './riji_page.dart';
class AddPage extends StatelessWidget {
  List tab = [
    {'name':'发帖','page':Tie()},
    {'name':'日记','page':Ri()},
    {'name':'提问','page':Tie()}
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          body: DefaultTabController(
            length: tab.length,
            child: NestedScrollView(
              headerSliverBuilder: (context,bool innerBoxIsScrolled){
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    child: SliverAppBar(
                      title: Text('玩美生活'),
                      pinned: true,
                      expandedHeight: ScreenUtil().setHeight(250),
                      forceElevated:innerBoxIsScrolled,
                      // flexibleSpace: FlexibleSpaceBar(

                      // ),
                      bottom: TabBar(
                        tabs: tab.map((f){
                          return Text('${f['name']}');
                        }).toList(),
                      ),
                    ),
                  )
                ];
              },
              body: TabBarView(
                children: tab.map((f){
                  return SafeArea(
                    top: false,
                    bottom: false,
                    child: Builder(
                      builder: (context){
                        return CustomScrollView(
                          key: PageStorageKey(f['name']),
                          slivers: <Widget>[
                              SliverOverlapInjector(
                                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                              ),
                              SliverToBoxAdapter(
                                child:f['page']
                              )

                          ],
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
    );
  }
}