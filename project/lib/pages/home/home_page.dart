import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/home/home_content.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    // final sneaker = ModalRoute.of(context).settings.arguments as SneakerModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SHOP"),
      ),
      body: HomeContent(),
    );
  }
}
  // void _jike() {
  //   print('start to request');
  //   getHttp().then((val) {
  //     setState(() {
  //       showText=val['data'].toString();
  //     });
  //   });
  // }

  // Future getHttp() async {
  //   try{
  //     Response res;
  //     Dio dio = Dio();
  //     dio.options.headers = rawHttpHeaders;
  //     res = await dio.get("https://www.pullandbear.com/itxrest/2/catalog/store/24009404/20309424/category?languageId=-3&typeCatalog=1&appId=1");
  //     print(res);
  //     return res.data;
  //   } catch(e) {
  //     return print(e);
  //   }
  // }
