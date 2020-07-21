import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/routers/router_handler.dart';

class Routes {
  static String root = '/';
  static String detailsPage = '/detail';
  static void configRoutes(Router router,) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        print("ERROR ==> ROUTE WAS NOT FOUNDED");
      }
    );

    router.define(detailsPage, handler: detailsHandler);
  }
}