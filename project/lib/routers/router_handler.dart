import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/pages/detail/detail_page.dart';

Handler detailsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    String itemId = params['id'].first;
    // print('index>details goodsId is ${itemId}');
    return DetailPage(itemId: itemId);
  }
);