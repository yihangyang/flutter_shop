import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DetailTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector(
      
    );
  }

  Widget _goodImage(url) {
    return Image.network(
      url,
      width: ScreenUtil().setWidth(740),
    );
  }

  Widget _goodsName(name) {
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15),
      child: Text(
        name,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30)
        ),
      ),
    );
  }

  Widget _goodsNum(num) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(top: 8),
      child: Text(
        'Itemnum: $num',
        style: TextStyle(
          color: Colors.black12
        ),
      ),
    );
  }
} 