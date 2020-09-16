import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeRecommend extends StatelessWidget {
  final List recommendLst;

  const HomeRecommend({Key key, this.recommendLst}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: ScreenUtil().setHeight(480),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommendLst(),
        ],
      ),
    );
  }

  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 2, 0, 5),
      decoration: BoxDecoration(
        color:Colors.white,
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.black12) 
        ),
      ),
      child: Text(
        'Recommend',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }
  Widget _item(index) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        // height: ScreenUtil().setHeight(340),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: .5,color: Colors.black12)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendLst[index]['img']),
            Text("${recommendLst[index]['price']}"),
            Text(
              "${recommendLst[index]['price']}",
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _recommendLst() {
    return Container(
      height: ScreenUtil().setHeight(400),
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendLst.length,
        itemBuilder: (context, index) {
          return _item(index);
        }
      )
    );
  }
}