
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/models/category_model.dart';

class CategoryViewModel extends ChangeNotifier {
  List<BxMallSubDto> _categoryList = [];

  List<BxMallSubDto> get categoryList => _categoryList;

  set categorys(List<BxMallSubDto> list){
    BxMallSubDto all = BxMallSubDto(
      mallSubId: '00',
      mallCategoryId: '00',
      mallSubName: 'All',
      comments: '',
    );
    _categoryList = [all];
    _categoryList.addAll(list);
    notifyListeners();
  }

}