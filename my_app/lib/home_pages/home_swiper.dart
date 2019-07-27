import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(150)),
      color: Colors.white,
        height: 100,
          width: ScreenUtil().setWidth(750),
          padding: EdgeInsets.only(top: 10),
        child: Swiper(
          onTap: (i){},
          itemCount: 3,
          itemBuilder: (BuildContext context,int index){
            
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563273841527&di=d66096046fb349b1923f159a3937b76c&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Ff9bbb70e6caa3723f6609c3a00b51051fb9caf30137f4-yqlJgA_fw658',fit: BoxFit.fill,)
,
            );
          },
          pagination: new SwiperPagination(),
          autoplay: true,
          viewportFraction: 0.9,
          scale: 0.8,
          duration: 600,
        ),
    );
  }
}