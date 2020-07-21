
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/models/category_model.dart';

class CategoryViewModel extends ChangeNotifier {
  List<SubCategory> _categoryList = [];
  int childIndex = 0; // child list highlight index
  String categoryId = '1'; // left_categoryID
  String subId = ''; // right_categoryID
  int page = 1; // list page

  List<SubCategory> get getCategoryList => _categoryList;

  // switch left_category, should return to 0
  // set setCategorys(List<BxMallSubDto> list){
  //   childIndex = 0;
    
  //   BxMallSubDto all = BxMallSubDto(
  //     mallSubId: '00',
  //     mallCategoryId: '00',
  //     mallSubName: 'All',
  //     comments: '',
  //   );
  //   _categoryList = [all];
  //   _categoryList.addAll(list);
  //   notifyListeners();
  // }

  getCategorys(List<SubCategory> list, String id){
    childIndex = 0;
    categoryId = id;
    
    SubCategory all = SubCategory(
      mallSubId: '',
      mallCategoryId: '00',
      mallSubName: 'All',
      comments: '',
    );
    _categoryList = [all];
    _categoryList.addAll(list);
    notifyListeners();
  }


  // change right_category index
  changeChildIndex(index, String id) {
    childIndex = index;
    subId = id;
    notifyListeners();
  }

}