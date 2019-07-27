import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import './provides/index_provide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home_pages/home_page.dart';
import 'add_pages/add_page.dart';
import 'mine_pages/mine_page.dart';
import 'msg_pages/msg_page.dart';
import 'shopping_pages/shopping_page.dart';
// import './provides/login_provide.dart';
class IndexPage extends StatelessWidget {
  
  List<Widget> bottombars = [
     Icon(CupertinoIcons.home),
      Icon(CupertinoIcons.shopping_cart),
      Icon(CupertinoIcons.add),
      Icon(CupertinoIcons.conversation_bubble),
      Icon(CupertinoIcons.person),
  ];
  List<Widget> tabPages = [
    HomePage(),
    ShoppingPage(),
    AddPage(),
    MsgPage(),
    MinePage()
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    return Provide<IndexProvide>(
      builder: (context,child,val){
        int current = Provide.value<IndexProvide>(context).currentindex;
        return Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            height: 60,
            animationCurve: Curves.easeInOut,
            backgroundColor: Color.fromRGBO(254, 67, 101, 1),
            items: bottombars,
            index: current,
            animationDuration: Duration(milliseconds: 300),
            onTap: (index){
              Provide.value<IndexProvide>(context).changePage(index);
            },
          ),
          body: IndexedStack(
            index: current,
            children:tabPages,
          ),
        );
      },
    );
    
  }
}