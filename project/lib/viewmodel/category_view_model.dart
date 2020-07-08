import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/models/category_model.dart';
import 'package:flutter_shop/service/category_request.dart';

class CategoryViewModel extends ChangeNotifier{

  CategoryViewModel() {
    CategoryRequest.getCategoryData().then((res) {
      _categorys = res;
      notifyListeners();
    });
  }
  List<CategoryModel> _categorys = [];
  // // SneakerViewModel _sneakerVM;

  List<CategoryModel> get categorys {
    return _categorys;
  }
  
}