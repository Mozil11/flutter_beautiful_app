import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_star_rating/flutter_star_rating.dart';
import 'package:url_launcher/url_launcher.dart';
class DetailCompany extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child:Row(
                children: <Widget>[
                  companyImage(),
                
                  Expanded(
                    child: companyInfo(),
                  ),
                  local()
                ],
              ),
            ),
            
            doctor()
          ],
        ),
        
    );
  }
  Widget companyImage(){
    return Container(
      child: ClipOval(
        child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564650277425&di=c0ad4d1a2f3ab3c691a95c9ca13efb54&imgtype=0&src=http%3A%2F%2Fpic148.nipic.com%2Ffile%2F20171208%2F24487626_162547831038_2.jpg',fit:BoxFit.fill,width: 50,),

      ),
    );
  }
  Widget companyInfo(){
    return Container(
      padding: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text('杭州医美医疗机构',style: TextStyle(fontSize: ScreenUtil().setSp(30)),),
            ),
            Container(
              child: Text('资质：医疗美容',style: TextStyle(color: Colors.black38),),
            ),
            Container(
              child: Text('地址：杭州西湖区',style: TextStyle(color: Colors.black38),),
            ),
            call(),
            Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.centerLeft,
              // color: Colors.yellow,
              child: StarRating(
                
                rating: 3.0,
                starConfig: StarConfig(
                  fillColor: Colors.pink,
                  strokeColor:Colors.pink,
                  size: 18
                  // other props
                )
              ),
            ),
            
          ],
        ),
    );
  }

  Widget local(){
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
       
        border: Border(
          left: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Image.asset('images/daohang.png',fit: BoxFit.fill,width: 20,),
          ),
          Container(
            child: Text('导航'),
          )
        ],
      ),
    );
  }
  //利用url_launcher插件拨打电话,定义一个内部方法
  void _call() async{

    String numb = 'http://baidu.com';
    // String numb = 'tel:13682027255';
    print(numb);
    print(canLaunch(numb).toString());
    if(await canLaunch(numb)){//canLaunch判断定义的numb值是否有效
      await launch(numb);
    }else{
      throw '不能访问';
    }
  }
  Widget call(){
    return InkWell(
      onTap: _call,
      child: Container(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color.fromRGBO(199, 237, 233, 1),
                    width: 1
                  ),
                  bottom: BorderSide(
                    color: Color.fromRGBO(199, 237, 233, 1),
                    width: 1
                  ),
                  left: BorderSide(
                    color: Color.fromRGBO(199, 237, 233, 1),
                    width: 1
                  ),
                  right: BorderSide(
                    color: Color.fromRGBO(199, 237, 233, 1),
                    width: 1
                  ),
                ),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: <Widget>[
                  Container(

                    child: Icon(Icons.phone_android,color: Color.fromRGBO(179, 227, 233, 1),size: 20,),
                  ),
                  Container(
                    child: Text('电话咨询',style: TextStyle(color: Color.fromRGBO(179, 227, 233, 1)),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    
  }
  Widget doctor(){
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 10),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(

              child: Text('赵医生'),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text('·',style: TextStyle(color: Colors.black26, ),),
            ),
            Container(
              child: Text('擅长：'),
            ),
            Expanded(
              child: Container(
                child: Text('瘦身、轮廓、微调'),
              ),
            ),
            Container(
              child: Icon(Icons.chevron_right),
            )
            
          ],
        ),
      ),
    );
    
  }
}