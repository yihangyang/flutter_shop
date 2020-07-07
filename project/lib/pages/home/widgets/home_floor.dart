import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFloor extends StatelessWidget {
  final String pictureAdress;
  final List floorGoodsList;

  const HomeFloor({Key key, this.pictureAdress, this.floorGoodsList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          HomeFloorContent(
            floorGoodsList: floorGoodsList,
          ),
        ],
      )
    );
  }
}

class HomeFloorContent extends StatelessWidget {
  final List floorGoodsList;

  const HomeFloorContent({Key key, this.floorGoodsList}) : super(key: key);
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
        _goodItem(floorGoodsList[0]['image1'],450),
        Column(
          children: <Widget>[
            _goodItem(floorGoodsList[0]['image2'],300),
            _goodItem(floorGoodsList[0]['image3'],150),
          ],
        ),
      ],
    );
  }

  Widget _sencondRow() {
    return Row(
      children: <Widget>[
        _goodItem(floorGoodsList[0]['image4'],450),
        _goodItem(floorGoodsList[0]['image5'],450),
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