import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAdBanner extends StatelessWidget {
  final String adPic;

  const HomeAdBanner({Key key, this.adPic}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(105),
      width: ScreenUtil().setWidth(750),
      child: Image.network(
        adPic,
        fit: BoxFit.fill,
      )
    );
  }
}