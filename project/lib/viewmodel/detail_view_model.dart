import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/models/detail_model.dart';
import 'package:flutter_shop/service/service_methods.dart';

class DetailViewModel extends ChangeNotifier {
  DetailModel _detailInfo = null;

  DetailModel get detailInfo => _detailInfo;

  getDetailinfo(String id) {
    var formData = {'goodID': id};
    request('goodDetail',formData: formData).then((val) {
      var responseData = json.decode(val.toString());
      print(responseData);
      _detailInfo = DetailModel.fromJson(responseData);
      notifyListeners();
    });
  }
}