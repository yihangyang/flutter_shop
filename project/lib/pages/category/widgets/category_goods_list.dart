import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/service/service_methods.dart';

class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  @override
  void initState() {
    _getGoodList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('list'),
    );
  }

  void _getGoodList() async {
    var data = {
      'categoryId': '4',
      'categorySubId': '',
      'page': 1
    };
    await request('getMallGoods', formData: data).then((val) {
      var data = json.decode(val.toString());
      print('list $val');
    });
  }
}