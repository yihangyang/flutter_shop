import 'package:dio/dio.dart';

class HttpConfig {
  static const String baseUrl = "https://www.easy-mock.com/mock/5effa4c8ea559b58ee7234b9/fluttershop/";
  static const int timeout = 6000;
}

class HttpRequest {
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: HttpConfig.baseUrl,
    connectTimeout: HttpConfig.timeout,
  );
  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url, {
                              String method = "get",
                              Map<String, dynamic> params,
                              Interceptor inter}) async {
    // 1. create customized setting
    final options = Options(method: method);

    // GlobalServiceInterceptor
    // create default GlobalServiceInterceptor
    Interceptor dInter = InterceptorsWrapper(
      onRequest: (options) {
        print("request interception");
        return options;
      },
      onResponse: (response) {
        print("response interception");
        return response;
      },
      onError: (err) {
        print("error interception");
        return err;
      }
    );
    List<Interceptor> inters = [dInter];

    // request single interceptor
    if (inter != null) {
      inters.add(inter);
    }

    // all request add in interceptor
    dio.interceptors.addAll(inters);
    // 2. send net request
    try {
      Response response =  await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }
}
