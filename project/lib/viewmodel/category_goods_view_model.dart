import 'package:flutter/material.dart';
import 'package:flutter_shop/models/category_goods_model.dart';


class CategoryGoodsViewModel with ChangeNotifier{

    List<CategoryListData> _goodsList = [];
  
    List<CategoryListData> get getGoodsList => _goodsList;

    set setGoodsList(List<CategoryListData> goodsList) {
      _goodsList = goodsList;
      notifyListeners();
    }

    
}