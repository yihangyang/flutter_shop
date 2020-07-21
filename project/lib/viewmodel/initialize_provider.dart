import 'package:flutter_shop/viewmodel/category_goods_view_model.dart';
import 'package:flutter_shop/viewmodel/category_view_model.dart';
import 'package:flutter_shop/viewmodel/detail_view_model.dart';
import 'package:provider/provider.dart';


final providers = [
  ChangeNotifierProvider<CategoryViewModel>(create: (ctx) => CategoryViewModel()),
  ChangeNotifierProvider<CategoryGoodsViewModel>(create: (ctx) => CategoryGoodsViewModel()),
  ChangeNotifierProvider<DetailViewModel>(create: (ctx) => DetailViewModel()),
];