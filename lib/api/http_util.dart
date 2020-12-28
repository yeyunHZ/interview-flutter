
import 'package:dio/dio.dart';
import 'package:interview/base/app_config.dart';
class HttpUtil {
  static HttpUtil instance;
  Dio dio;
  BaseOptions options;

  static HttpUtil getInstance() {
    print('getInstance');
    if (instance == null) {
      instance = new HttpUtil();
    }
    return instance;
  }
  HttpUtil() {
    dio = new Dio()
      ..options = BaseOptions(
          baseUrl: AppConfig.baseUrl,
          connectTimeout: 30000,
          receiveTimeout: 30000)
      ..interceptors.add(HeaderInterceptor());
//      ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
}

class HeaderInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
    return super.onRequest(options);
  }
}

