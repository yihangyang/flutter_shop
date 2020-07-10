import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/category/widgets/category_goods_list.dart';
import 'package:flutter_shop/pages/category/widgets/category_left_nav.dart';
import 'package:flutter_shop/pages/category/widgets/category_right_nav.dart';

class CategoryContent extends StatefulWidget {
  @override
  _CategoryContentState createState() => _CategoryContentState();
}

class _CategoryContentState extends State<CategoryContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          CategoryLeftNav(),
          Column(
            children: <Widget>[
              CategoryRightNav(),
              CategoryGoodsList()
            ],
          ),
        ],
      )
    );
  }
}
