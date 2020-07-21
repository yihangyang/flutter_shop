import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/home/widgets/home_ad_banner.dart';
import 'package:flutter_shop/pages/home/widgets/home_call.dart';
import 'package:flutter_shop/pages/home/widgets/home_floor.dart';
import 'package:flutter_shop/pages/home/widgets/home_swiper.dart';
import 'package:flutter_shop/pages/home/widgets/home_top_nav.dart';
import 'package:flutter_shop/pages/home/widgets/home_recommend.dart';
import 'package:flutter_shop/routers/application.dart';
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
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: request('homePageContent'),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasData){
            var data = json.decode(snapshot.data.toString());
            // var data = snapshot.data.toList();
            List<Map> swiper = (data['banner'] as List).cast();
            List<Map> navgatorLst = (data['category'] as List).cast();
            String adPic  = data['adPic'][0]['url'];
            String leaderImage = data['shopInfo'][0]['leaderImage'];
            String leaderPhone = data['shopInfo'][0]['leaderPhone'];
            List<Map> recommendLst = (data['sneaker'] as List).cast();
            String floor1Title = data['floor']['pictitle1'];
            String textTitle = data['floor']['pic1'];

            String floor2Title = data['floor']['pictitle2'];
            String floor3Title = data['floor']['pic1'];
            Map floorMap = data['floor']['lst'];
            
            return EasyRefresh(
              footer: ClassicalFooter(
                bgColor: Colors.white,
                textColor: Colors.pink,
                infoColor: Colors.pink,
                showInfo: true,
                noMoreText: 'no more',
                loadText: 'waiting...',
                loadReadyText: 'Slipe Up To Load'
              ),
              child: ListView(
                children: <Widget>[
                  HomeSwiper(swiperDataLst: swiper,),
                  HomeTopNav(navLst: navgatorLst,),
                  HomeAdBanner(adPic: adPic,),
                  HomeCall(leaderImage: leaderImage, leaderPhone: leaderPhone,),
                  HomeRecommend(recommendLst: recommendLst,),
                  HomeFloor(pictureAdress: floor1Title, floorGoodsMap: floorMap,),
                  _hotGoods()
                ],
              ),
              onRefresh: () async {
                print('onRefresh');
              },
              onLoad: () async {
                print("onload");
                await request('homePageBelowContent').then((val) {
                var data = json.decode(val.toString());
                List<Map> newGoodsList = (data['item'] as List).cast();
                setState(() {
                  if(page < 2){
                    hotGoodsList.addAll(newGoodsList);
                  }
                  page++;
                });
              });
              },
            );
          } else {
            return Center(
              child: Text("loading..."),
            );
          }
        },
      )
    );
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
          onTap: () {
            Application.router.navigateTo(context, "/detail?id=${val['goodsId']}");
          },
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