import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
class HomeProvide extends ChangeNotifier{
  bool islike = false;
  int current = 0;
  String photos = '[]';
  List mylist = [];
  int indexPage = 0;
  
  // 展示photo
  showphoto(List list)async{
    //初始化持久化变量
    SharedPreferences pre = await SharedPreferences.getInstance();
    //先取出持久化里面的值
    photos = pre.getString('photoInfo');
     mylist = list;
     photos = json.encode(list).toString();
      pre.setString('photoInfo', photos);
     notifyListeners();
  }
//  点赞
like(id,like)async{
   //初始化持久化变量
    SharedPreferences pre = await SharedPreferences.getInstance();
    //先取出持久化里面的值
    photos = pre.getString('photoInfo');
    //将取出的值转化为数组   先decode 再转化
    var item = photos == null?[]:json.decode(photos);
    //转化
    List<Map> photoList = (item as List).cast();
    current = 0;
    //判断点击的哪个图片
    photoList.forEach((v){
      if(id==v['id']){
        print('id');
        if(like){
          print('>>>>>>>>>>>>>>>1');
         
          photoList[current]['islike'] = false;
          
         
        }else{
          photoList[current]['islike'] = true;
          
        }
       
      }
        current++;
    });
     mylist = photoList;
    photos = json.encode(photoList).toString();
    print(photos);
    pre.setString('photoInfo', photos);
    notifyListeners();
}


  //点赞
  taplike(id)async{
    //初始化持久化变量
    SharedPreferences pre = await SharedPreferences.getInstance();
    //先取出持久化里面的值
    photos = pre.getString('photoInfo');
    //将取出的值转化为数组   先decode 再转化
    var item = photos == null?[]:json.decode(photos);
    //转化
    List<Map> photoList = (item as List).cast();
    current = 0;
    //判断点击的哪个图片
    photoList.forEach((v){
      if(id==v['id']){
        if(v['islike']){
          print('>>>>>>>>>>>>>>>1');
         
          photoList[current]['islike'] = false;
          photoList[current]['count']--;
         
        }else{
          photoList[current]['islike'] = true;
          photoList[current]['count']++;
        }
      }
        current++;
    });
     mylist = photoList;
    photos = json.encode(photoList).toString();
    print(photos);
    pre.setString('photoInfo', photos);
    notifyListeners();
  }

  //精选导航
  changeMychoose(index){
    indexPage = index;
    notifyListeners();
  }
}