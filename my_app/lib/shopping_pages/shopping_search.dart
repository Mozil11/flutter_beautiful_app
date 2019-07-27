import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../home_pages/search_data.dart';
class ShoppingSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         //展示搜索条
                showSearch(context: context,delegate:searchBarDelegate() );
      },
      child: Container(
        width: ScreenUtil().setWidth(400),
        height: ScreenUtil().setHeight(50),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(240, 240, 250, 1.0),
          borderRadius: BorderRadius.circular(25),
        ),
          child: Row(
            children: <Widget>[
              Image.asset('images/search.png',width: ScreenUtil().setWidth(40),),
              Text('手术瘦脸',style:TextStyle(fontSize: ScreenUtil().setSp(25),fontWeight: FontWeight.w200,color: Colors.black45))
            ],
          ),
          ),
      
    );
    
  }
}

class searchBarDelegate extends SearchDelegate<String>{
  //重写搜索框右侧图标按钮
  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      )
    ];
  }
    //重写返回箭头
  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress:transitionAnimation,
      ),
      onPressed: (){
          close(context, null);
      },
    );
  }
  @override
  //重写结果展示
  Widget buildResults(BuildContext context){
    return Container(
      height: 100.0,
      width: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Text(query),
      ),
    );
  }
  @override
  //重写输入提示
  Widget buildSuggestions(BuildContext context){
    final suggestionList = query.isEmpty?recentSearch: searchList.where((input)=>input.startsWith(query)).toList();//判断输入参数是否与数据匹配
    return ListView.builder(//返回动态列表
      itemCount: suggestionList.length,//列表长度
      itemBuilder:(context,index){//构建下拉搜索列表
        return ListTile(
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].substring(0,query.length),//截取字符串
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey)
                )
              ],
            ),
          ),
        );

      },
    );
  }

}