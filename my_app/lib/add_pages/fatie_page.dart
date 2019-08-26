import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:async';
// import '../provides/user_width.dart';
// import 'package:provide/provide.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Tie extends StatefulWidget {
  @override
  _TieState createState() => new _TieState();
}

class _TieState extends State<Tie> {
  List img;
  List<Widget>  imgItem;
  List<Widget> imgItems;
  int current;
String _error;
  

  

   //选择图片并上传
  _pickImageUpLoad() async {
    var  index=0;
    setState(() {
      current++;
      img =[];
    });
     String error;
     List requestList;
    //通过MultiImagePicker插件从本地相册选取图片，配置一次最多选择12张，禁止摄像头拍照
    try {
     print('我的数据：$requestList');
      requestList = await MultiImagePicker.pickImages(
      maxImages: 12,
      enableCamera: false,
    );
    print('我的数据：$requestList');
    } on PlatformException catch (e) {
      error = e.message;
    }
    
    
    if (!mounted) return;
    
    //这里进行一下判断，是否选择了图片，如果没有选择图片不进行任何操作。
    if (requestList.length != 0) {
      for (int i = 0; i < requestList.length; i++) {
        var _path;
        var item;
        //获得一个uuud码用于给图片命名
        final String uuid ="$current+$i";
        //请求原始图片数据
        item= await requestList[i].requestOriginal();
        
         //获取图片数据，并转换成uint8List类型
         Uint8List imageData = await item.buffer.asUint8List();
          var result = await FlutterImageCompress.compressWithList(
            imageData,
           
            quality: 80,
           
          );
        //获得应用临时目录路径
        
        final Directory _directory = await getTemporaryDirectory();
        final Directory _imageDirectory =await new Directory('${_directory.path}/image/')
        .create(recursive: true);
        _path = _imageDirectory.path;
        print('本次获得路径：${_imageDirectory.path}');
        //将压缩的图片暂时存入应用缓存目录
        File imageFile = new File('${_path}originalImage_$uuid.png')
          ..writeAsBytesSync(result);
          
          setState(() {
            
            img.add(imageFile);
            
          });
          
        print('图片$i的 本地路径是：${imageFile.path}');
        print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$_error');
        //释放图片原始数据资源
        // requestList[i].releaseOriginal();
      }
      setState(() {
        imgItem = [];

        imgItem.addAll(img.map((f){
          index++;
          return imageToDo(f);
          
        }).toList());
        imgItem..add(addimagebutton());
        imgItems = imgItem;
          if (error == null) _error = 'No Error Dectected';
      });
      
    }
  }
  Widget imageToDo(f){
    var i= 0;
    i++;
    return Container(
      
      child: Stack(
        
        children: <Widget>[
          ClipRRect(
            
            borderRadius: BorderRadius.all(
              Radius.circular(6.0)
            ),
            child: Image.file(f,fit: BoxFit.cover,width: ScreenUtil().setWidth(216),height: ScreenUtil().setWidth(216),),
          ),
          Positioned(
            right: -5,
            top: -5,
            child: InkWell(
              onTap: (){
                setState(() {
                  print(i);
                 
                 
                  imgItems.removeAt(i-1);
                  print(imgItems);
                });
              },
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.white,
                      width: 1
                    ),
                    left: BorderSide(
                      color: Colors.white,
                      width: 1
                    ),
                    right: BorderSide(
                      color: Colors.white,
                      width: 1
                    ),
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 1
                    )
                  ),
                  color: Color.fromRGBO(199, 237, 233, 1),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Icon(Icons.close,color:Colors.white,size: 10,),
              ),
            ),
          )
        ],
      ),
    );
  }
  @override
  void initState() {
    img=[];
    current=0;
    imgItems =List<Widget>()..add(addimagebutton());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.only(top:20),
      padding: EdgeInsets.all(10),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            runSpacing: ScreenUtil().setWidth(25),
            spacing: ScreenUtil().setWidth(25),
            children: imgItems,
          ),
          
          Container(
            margin: EdgeInsets.only(top: 10),
            child: TextFormField(
              onChanged: (v){
                
              },
              style: TextStyle(fontSize: ScreenUtil().setSp(30)),
              maxLines: 4,
              decoration: InputDecoration(
                
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12
                  )
                ),
                helperText:'分享你的点滴',
                labelText:'你想分享点什么呢？',
                
              ),
              maxLength: 1000,
            ),
          )
          
        ],
      ),
    );
  }
  Widget addimagebutton(){
    return OutlineButton(
                padding: EdgeInsets.all(ScreenUtil().setWidth(80)),
                child: Icon(Icons.add,color: Colors.black26,),
                onPressed: (){
                  _pickImageUpLoad();
                },
              );
  }
}
