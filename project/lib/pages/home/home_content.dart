import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/models/sneaker_model.dart';
import 'package:flutter_shop/pages/home/widgets/home_ad_banner.dart';
import 'package:flutter_shop/pages/home/widgets/home_call.dart';
import 'package:flutter_shop/pages/home/widgets/home_floor.dart';
import 'package:flutter_shop/pages/home/widgets/home_hot_good.dart';
import 'package:flutter_shop/pages/home/widgets/home_swiper.dart';
import 'package:flutter_shop/pages/home/widgets/home_top_nav.dart';
import 'package:flutter_shop/pages/home/widgets/home_recommend.dart';
import 'package:flutter_shop/service/service_methods.dart';

class HomeContent extends StatefulWidget {
  // final SneakerModel sneakerModel;
  

  // const HomeContent({Key key, this.sneakerModel}) : super(key: key);

  // const HomeContent(this._sneakerModel);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int page = 1;
  List<Map> hotGoodsList = [];
  @override
  void initState() {
    _getHotGoods();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FutureBuilder(
            future: request('homePageContent'),
            builder: (context, snapshot) {
              if(!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              if(snapshot.hasData){
                // print(snapshot.data['sneaker'].toString());
                // var data = json.decode(snapshot.data['sneaker'].toString());
                var data = snapshot.data;
                // List<Map> swiper = (data['banner'] as List).cast();
                // List<Map> navgatorLst = (data['category'] as List).cast();
                String adPic  = data['adPic'][0]['url'];
                // String leaderImage = data['shopInfo'][0]['leaderImage'];
                // String leaderPhone = data['shopInfo'][0]['leaderPhone'];
                // List<Map> recommendLst = (data['sneaker'] as List).cast();
                // String floor1Title = data['floor'][0]['pictitle1'];
                // String floor2Title = data['floor'][0]['pictitle2'];
                // String floor3Title = data['floor'][0]['pic1'];
                // List floorLst = data['floor'][0]['lst'];
                // print(data);
                
                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      // HomeSwiper(swiperDataLst: swiper,),
                      // HomeTopNav(navLst: navgatorLst,),
                      // HomeAdBanner(adPic: adPic,),
                      // HomeCall(leaderImage: leaderImage, leaderPhone: leaderPhone,),
                      // HomeRecommend(recommendLst: recommendLst,),
                      // HomeFloor(pictureAdress: floor1Title, floorGoodsList: floorLst,),
                      // _hotGoods()
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text("loading..."),
                );
              }
            },
          ),
        ],
      )
    );
  }

  void _getHotGoods() {
    // var formPage = {'page': page};
    request('homePageBelowContent').then((val) {
      // var data = json.decode(val.toString());
      var data = val;
      List<Map> newGoodsList = (data['data']['item'] as List).cast();
      setState(() {
        hotGoodsList.addAll(newGoodsList);
        page++;
      });
      print(data);
    });
  }

  Widget _hotTitle = Container(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.center,
    color: Colors.transparent,
    child: Text('hot sales'),
  );

  Widget _wrapLst() {
    if(hotGoodsList.length != 0) {
      List<Widget> _listWidget = hotGoodsList.map((val) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 3),
            child: Column(
              children: <Widget>[
                Image.network(val['image'], width: ScreenUtil().setWidth(370),),
                Text(
                  val['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  children: <Widget>[
                    Text('\$ ${val['newPrice']}'),
                    Text(
                      '\$ ${val['price']}',
                      style: TextStyle(
                        color: Colors.black26,
                        decoration: TextDecoration.lineThrough,
                      )
                    ),
                  ],
                ),
              ],
            )
          ),
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: _listWidget,
      );
    } else {
      return Text('no data, since hotGoodsList.length == 0');
    }
  }
  Widget _hotGoods() {
    return Container(
      child: Column(
        children: <Widget>[
          _hotTitle,
          _wrapLst()
        ],
      ),
    );
  }
}