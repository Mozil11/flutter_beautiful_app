import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
class ShopCartProvide extends ChangeNotifier{
  //定义点击购物车变量
  String cart = '[]';
  //购物车中的list
  List cartList = [];
  //总价格
  double allprice = 0;
  //总数量
  int allcount = 0;
  //全选
  bool allcheck = true;
  //加入购物车
  save(goodsId,goodsName,count,price,images) async{
    allcount = 0;
    allprice = 0;
    //初始化持久化变量
    SharedPreferences pre =  await SharedPreferences.getInstance();
    //先取出持久化里面的值
    cart = pre.getString('cartInfo');
    //将取出的值转化为数组   先decode 再转化
    //decode
    var test = cart == null?[]:json.decode(cart);
    //转化
    List<Map> testList = (test as List).cast();
    //判断是否重复
    bool isHave = false;
    int index = 0;
    testList.forEach((v){
      if(v['goodsId']==goodsId){

        testList[index]['count']++; 
        print(testList[index]['count']);
        cartList[index]['count']++;
        isHave = true;
      }
      if(v['isAction']){
             allprice += (v['count']*v['price']);
             allcount +=v['count'];
           }
      index++;
    });
    if(!isHave){
      var map = {
          'goodsId':goodsId,
          'goodsName':goodsName,
          'count':count,
          'price':price,
          'images':images,
          'isAction':true
        };
        testList.add(map);
        cartList.add(map);
        print(cartList);
         allprice += (price*count);
          allcount +=count;
        
      }
      //给cart赋值回字符串
    cart = json.encode(testList).toString();
    //最后持久化cart
    pre.setString('cartInfo', cart);
    notifyListeners();
  }
  //查询
  getgoodsinfo()async{
      SharedPreferences pre =await SharedPreferences.getInstance();
       cart = pre.getString('cartInfo');
       print(cart);
       cartList = [];
       if(cart==null){
         cartList = [];
       }else{
         allcount = 0;
         allprice = 0;
         allcheck = true;
         List<Map> testList = (json.decode(cart.toString()) as List).cast();
         testList.forEach((v){
           if(v['isAction']){
             allprice += (v['count']*v['price']);
             allcount +=v['count'];
           }else{
             allcheck = false;
           }
           cartList.add(v);
         });
       }
       notifyListeners();
  }
  //清空
  remove()async{
        SharedPreferences pre =await SharedPreferences.getInstance();
      pre.remove('cartInfo');
      cartList = [];

     
      allcount = 0;
       allprice = 0;
      print('清空。。。。。。');
      notifyListeners();
  }
  //删除单个购物车商品
  delgoods(goodsId)async{
      SharedPreferences pre =await SharedPreferences.getInstance();
      cart = pre.getString('cartInfo');
      List<Map> testList = (json.decode(cart.toString()) as List).cast();
      var tempindex = 0;
      var delindex = 0;

      testList.forEach((f){
          if(f['goodsId']==goodsId){
            delindex = tempindex;
          }
          tempindex++;
      });
      //dart中删除数组中元素 的方法
      testList.removeAt(delindex);
      //持久化必须string
      cart = json.encode(testList).toString();
      pre.setString('cartInfo', cart);
      //调用显示
      await getgoodsinfo();
  }
  //商品单选操作
  changeAction(item)async{
     SharedPreferences pre =await SharedPreferences.getInstance();
      cart = pre.getString('cartInfo');
      List<Map> testList = (json.decode(cart.toString()) as List).cast();
      var tempindex = 0;
      var changeindex = 0;
      testList.forEach((f){
          if(f['goodsId']==item['goodsId']){
            changeindex = tempindex;
          }
          tempindex++;
      });
      testList[changeindex] = item;
      cart = json.encode(testList).toString();
      pre.setString('cartInfo', cart);
      await getgoodsinfo();

  }
  //全选按钮点击
  actionAll(isAction) async{
      SharedPreferences pre =await SharedPreferences.getInstance();
      cart = pre.getString('cartInfo');
      List<Map> testList = (json.decode(cart.toString()) as List).cast();
      List<Map> newList = [];
      testList.forEach((f){
        var newitem = f;
        newitem['isAction'] = isAction;
        newList.add(newitem);
      });
      cart = json.encode(newList).toString();
      pre.setString('cartInfo', cart);
      await getgoodsinfo();
      
      }
    //商品数量加减
    changecount(item,adddel)async{
      SharedPreferences pre =await SharedPreferences.getInstance();
      cart = pre.getString('cartInfo');
      List<Map> testList = (json.decode(cart.toString()) as List).cast();
      var tempindex = 0;
      var changeindex = 0;
      testList.forEach((f){
        if(f['goodsId']==item['goodsId']){
             changeindex = tempindex;
        }
        tempindex++;
      });
      if(adddel=='+'){
        testList[changeindex]['count']++;
      }else if(item['count']>1){
        testList[changeindex]['count']--;
      }
       cart = json.encode(testList).toString();
        pre.setString('cartInfo', cart);
        await getgoodsinfo();
    }
}