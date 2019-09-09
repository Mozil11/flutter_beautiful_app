import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UserBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 255, 255, 0.9),
      height: 100,
      width: 100,
       alignment:Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyInput(),
            InkWell(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                color: Color.fromRGBO(254, 67, 101, 1),
                borderRadius: BorderRadius.circular(5)

                ),
                alignment: Alignment.center,
                height: 40,
                child: Text('发表',style: TextStyle(color: Colors.white),),
              ),
              onTap: (){
                print('发表');
              },
            )
            
          ],
        ),
    );
  }

  Widget MyInput(){
    return Container(
      padding: EdgeInsets.all(5),
     
      height: 50,
      width: ScreenUtil().setWidth(500),
      alignment: Alignment.center,
      child: TextFormField(
        
        onChanged: (v){

        },
        style: TextStyle(
          fontSize: ScreenUtil().setSp(25)
        ),
        maxLines: 1,
        decoration: InputDecoration(   
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black12
            )
          ),
          
          labelText:'添加评论',
          
        ),
        
      ),
    );
  }

}