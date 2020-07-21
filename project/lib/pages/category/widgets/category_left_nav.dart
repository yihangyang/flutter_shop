import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/models/category_goods_model.dart';
import 'package:flutter_shop/models/category_model.dart';
import 'package:flutter_shop/service/service_methods.dart';
import 'package:flutter_shop/viewmodel/category_goods_view_model.dart';
import 'package:flutter_shop/viewmodel/category_view_model.dart';
import 'package:provider/provider.dart';

class CategoryLeftNav extends StatefulWidget {
  @override
  _CategoryLeftNavState createState() => _CategoryLeftNavState();
}

class _CategoryLeftNavState extends State<CategoryLeftNav> {
  List list = [];
  var listIndex = 0;
  @override
  void initState() {
    _getCategory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 1,color: Colors.black12)
        )
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _leftInkWell(index);
        },
      )
    );
  }

  Widget _leftInkWell(int index) {
    bool isClick = false;
    isClick = (index == listIndex) ? true:false;
    return Consumer<CategoryViewModel>(
      builder: (ctx, catVM, child) {
        return InkWell(
          onTap: () {
            setState(() {
              listIndex = index;
            });
            List<SubCategory> childList = list[index].subCategory;
            String categoryId = list[index].mallCategoryId;
            catVM.getCategorys(childList, categoryId);
            _getGoodList(categoryId: categoryId);
          },
          child: Container(
            height: ScreenUtil().setHeight(100),
            padding: EdgeInsets.only(left: 10, top: 20),
            decoration: BoxDecoration(
              color: isClick?Colors.grey[200]:Colors.white,
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.black12)
              ),
            ),
            child: Text(list[index].mallCategoryName, style: TextStyle(fontSize: ScreenUtil().setSp(26)),),
          ),
        );
      },
    );
  }
  void _getCategory() async{
    await request('category').then((val) {
      var data = json.decode(val.toString());
      CategoryModel category =  CategoryModel.fromJson(data);
      setState(() {
        list = category.data;
      });
      Provider.of<CategoryViewModel>(context, listen: false).getCategorys(list[0].subCategory, list[0].mallCategoryId);
    });
  }

  void _getGoodList({String categoryId})  {
    var data = {
      'categoryId': categoryId==null ? '1' : categoryId,
      'categorySubId': '',
      'page': 1
    };
    request('kleider').then((val) {
      var data = json.decode(val.toString());
      CategoryGoodsModel goodsList = CategoryGoodsModel.fromJson(data);
      Provider.of<CategoryGoodsViewModel>(context, listen: false).setGoodsList = goodsList.data[int.parse(categoryId)-1];
    });
  }
}