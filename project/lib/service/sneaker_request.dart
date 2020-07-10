// import 'package:flutter_shop/models/sneaker_model.dart';

// import 'http_request.dart';

// class SneakerRequest {
//   static Future<List<SneakerModel>> getSneakerData() async {
//     // 1. snd message request
//     final url = "/sneaker";
//     final result = await HttpRequest.request(url);
//     // 2. json => model
//     final sneakerArray = result["sneaker"];
//     List<SneakerModel> sneakers = [];
//     for(var json in sneakerArray) {
//       sneakers.add(SneakerModel.fromJson(json));
//     }
//     return sneakers;
//   }
// }