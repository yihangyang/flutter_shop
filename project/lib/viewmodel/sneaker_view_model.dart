import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/models/sneaker_model.dart';
import 'package:flutter_shop/service/sneaker_request.dart';

class SneakerViewModel extends ChangeNotifier{

  SneakerViewModel() {
    SneakerRequest.getSneakerData().then((res) {
      _sneakers = res;
      notifyListeners();
    });
  }
  List<SneakerModel> _sneakers = [];
  // // SneakerViewModel _sneakerVM;

  List<SneakerModel> get sneakers {
    return _sneakers;
  }
  
}