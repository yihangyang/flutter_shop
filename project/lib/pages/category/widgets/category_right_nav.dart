import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/models/category_goods_model.dart';
import 'package:flutter_shop/models/category_model.dart';
import 'package:flutter_shop/service/service_methods.dart';
import 'package:flutter_shop/viewmodel/category_goods_view_model.dart';
import 'package:flutter_shop/viewmodel/category_view_model.dart';
import 'package:provider/provider.dart';

class CategoryRightNav extends StatefulWidget {
  @override
  _CategoryRightNavState createState() => _CategoryRightNavState();
}

class _CategoryRightNavState extends State<CategoryRightNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(80),
      width: ScreenUtil().setWidth(570),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 1, color: Colors.black12))
      ),
      child: Consumer<CategoryViewModel>(
        builder: (ctx, catVM, child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: catVM.getCategoryList.length,
            itemBuilder: (context, index) {
              return _rightInkWell(catVM.getCategoryList[index], index);
            }
          );
        }
      )
    );
  }

  Widget _rightInkWell(SubCategory item, int index) {
    bool isClick = false;
    return Consumer<CategoryViewModel>(
      builder: (ctx, cVM, child) {
        isClick = (index == cVM.childIndex) ? true:false;
        return InkWell(
          onTap: () {
            print(item.mallSubName + '_rightInkWell');
            cVM.changeChildIndex(index, item.mallCategoryId);
            _getGoodList(item.mallSubId);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Text(
              item.mallSubName,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: isClick ? Colors.pink : Colors.black
              ),
            ),
          ),
        );
      }
    );
  }
  
  void _getGoodList(String categorySubId)  {
    var data = {
      'categoryId': Provider.of<CategoryViewModel>(context, listen: false).categoryId,
      'categorySubId': categorySubId,
      'page': 1
    };
    request('kleider').then((val) {
      var data = json.decode(val.toString());
      // print(goodsList.data.kleider);
      // print(data['data'][1] + " _getGoodList");
      CategoryGoodsModel goodsList = CategoryGoodsModel.fromJson(data);
      print(goodsList.data.sale);
      print(Fruit.values[1]);
      Provider.of<CategoryGoodsViewModel>(context, listen: false).setGoodsList = goodsList.data.sale;
    });
  }
}

enum Fruit {
  apple, banana
}