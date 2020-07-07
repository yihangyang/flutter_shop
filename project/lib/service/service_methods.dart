
// get home Page
import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_shop/config/service_url.dart';

Future request(url, {formData}) async{
  try {
    print('start to request data');
    Response res;
    Dio dio = new Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    // var formData = {'lon': '115.02932','lat': '35.76189'};
    if(formData == null){
      res = await dio.get(servicePath[url],);
    }else {
      res = await dio.post(servicePath[url], data: formData,);
    }
    
    if(res.statusCode == 200) {
      return res.data;
    } else {
      throw Exception("Backend API error");
    }
  } catch(e) {
    print("ERROR=>$e");
  }
}