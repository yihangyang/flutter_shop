import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// homepage swiper
class HomeSwiper extends StatelessWidget {
  final List swiperDataLst;

  const HomeSwiper({Key key, this.swiperDataLst}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(240),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (context, index) {
          return Image.network(
            "${swiperDataLst[index]['img']}",
            fit: BoxFit.fill,
          );
        },
        itemCount: swiperDataLst.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}