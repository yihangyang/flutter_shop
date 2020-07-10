import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFloor extends StatelessWidget {
  final String pictureAdress;
  final Map floorGoodsMap;

  const HomeFloor({Key key, this.pictureAdress, this.floorGoodsMap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          HomeFloorContent(
            floorGoodsMap: floorGoodsMap,
          ),
        ],
      )
    );
  }
}

class HomeFloorContent extends StatelessWidget {
  final Map floorGoodsMap;

  const HomeFloorContent({Key key, this.floorGoodsMap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _firstRow(),
        _sencondRow(),
      ],
    );
  }
  Widget _firstRow() {
    return Row(
      children: <Widget>[
        _goodItem(floorGoodsMap['image1'],450),
        Column(
          children: <Widget>[
            _goodItem(floorGoodsMap['image2'],300),
            _goodItem(floorGoodsMap['image3'],150),
          ],
        ),
      ],
    );
  }

  Widget _sencondRow() {
    return Row(
      children: <Widget>[
        _goodItem(floorGoodsMap['image4'],450),
        _goodItem(floorGoodsMap['image5'],450),
      ],
    );
  }
  Widget _goodItem(String goods,int height) {
    return Container(
      padding: EdgeInsets.all(5),
      width: ScreenUtil().setWidth(360),
      height: ScreenUtil().setHeight(height),
      child: InkWell(
        child: Image.network(goods, fit: BoxFit.fill,),
        onTap: () {
          print("click");
        },
      ),
    );
  }
}