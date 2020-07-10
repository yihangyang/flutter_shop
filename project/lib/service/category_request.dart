import 'package:flutter_shop/models/category_model.dart';

import 'http_request.dart';

class CategoryRequest {
  static Future<List<CategoryModel>> getCategoryData() async {
    // 1. snd message request
    final url = "/category.dart";
    final result = await HttpRequest.request(url);
    // 2. json => model
    final categoryArray = result["data"];
    List<CategoryModel> categorys = [];
    for(var json in categoryArray) {
      categorys.add(CategoryModel.fromJson(json));
    }
    return categorys;
  }
}