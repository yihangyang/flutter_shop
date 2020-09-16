import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:flutter_shop/viewmodel/category_goods_view_model.dart';
import 'package:flutter_shop/viewmodel/category_view_model.dart';
import 'package:provider/provider.dart';

class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: ScreenUtil().setWidth(570),
        child: Consumer<CategoryGoodsViewModel>(
          builder: (context, cVM, child) {
            return ListView.builder(
              itemCount: cVM.getGoodsList.length,
              itemBuilder: (context, index){
                return _listWidget(cVM.getGoodsList, index);
              },
            );
          },
        ),
      ),
    );
    
  }

  

  Widget _listWidget(List newList, int index){
    return InkWell(
      onTap: (){
        Application.router.navigateTo(context, "/detail?id=${newList[index].itemId}");
      },
      child: Container(
        padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0,color: Colors.black12)
          )
        ),
        
        child: Row(
          children: <Widget>[
            _goodsImage(newList, index)
           ,
            Column(
              children: <Widget>[
                _goodsName(newList, index),
                _goodsPrice(newList, index)
              ],
            )
          ],
        ),
      )
    );
  }

  Widget _goodsImage(List newList,int index){
    return  Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(newList[index].image),
    );
  }

  Widget _goodsName(List newList,int index){
    return Container( 
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        newList[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  Widget _goodsPrice(List newList,int index){
    return  Container( 
      margin: EdgeInsets.only(top:20.0),
      width: ScreenUtil().setWidth(370),
      child:Row(
        children: <Widget>[
          Text(
            'Price: \$ ${newList[index].presentPrice}',
            style: TextStyle(color:Colors.pink,fontSize:ScreenUtil().setSp(30)),
            ),
          Text(
            '\$ ${newList[index].oriPrice}',
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough
            ),
          )
        ]
      )
    );
  }    
}