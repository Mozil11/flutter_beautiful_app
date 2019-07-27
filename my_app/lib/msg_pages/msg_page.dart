import 'package:flutter/material.dart';
import './foucs_page.dart';
class MsgPage extends StatefulWidget {
  @override
  _MsgPageState createState() => _MsgPageState();
}

class _MsgPageState extends State<MsgPage> with SingleTickerProviderStateMixin{
  //定义一个组件
  TabController _controller;
  List tabs = [
    {'name':'通知'},
    {'name':'赞/收藏'},
    {'name':'回复'},
    {'name':'关注'}
  ];
  List<Widget> item = [
    FoucsPage(),
    FoucsPage(),
    FoucsPage(),
    FoucsPage(),
  ];
//重写初始化方法
  @override
  void initState() {

    super.initState();
    //初始化_controller  上部导航的个数
    _controller = TabController(length: tabs.length,vsync: this);
  }
  //重写销毁方法
  @override
  void dispose() { 
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
        appBar: AppBar(
          title: Text('消息'),
          bottom: TabBar(
            controller: _controller,
            tabs: tabs.map((f){
              return Text('${f['name']}');
            }).toList(),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children:item.map((f){
            return f;
          }).toList(),
        ),
      ),
    );
  }
}