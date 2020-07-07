import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class HomeTopNav extends StatelessWidget {
  final List navLst;

  const HomeTopNav({Key key, this.navLst}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(this.navLst.length > 10) {
       this. navLst.removeRange(10, navLst.length);
    }
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(5),
        children: navLst.map((item) {
           return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['img'],width: ScreenUtil().setWidth(95),
          ),
          Text(item['name'])
        ],

      ),
    );
  }
}