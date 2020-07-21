import 'package:flutter/material.dart';
import 'package:flutter_shop/models/category_goods_model.dart';


class CategoryGoodsViewModel with ChangeNotifier{

    List<Kleider> _goodsList = [];
  
    List<Kleider> get getGoodsList => _goodsList;

    set setGoodsList(List<Kleider> goodsList) {
      _goodsList = goodsList;
      notifyListeners();
    }

    set setGoodsItems(List<List<Kleider>> goodsList) {
      for(var k in _goodsList) {
        _goodsList.add(k);
      }
      notifyListeners();
    }

    
}