import 'package:dio/adapter_browser.dart';
import 'package:dio/browser_imp.dart';
import 'package:dio/dio.dart';

class HttpClient {
  HttpClient() {
    client();
  }

  Dio client() {
    DioForBrowser dio;
    // Set default configs
    BaseOptions options = new BaseOptions(
      baseUrl: 'http://localhost:8042',
      connectTimeout: 10000,
      receiveTimeout: 5000,
      headers: {
        "Accept": "application/json",
      },
    );

    dio = DioForBrowser(options);
    var adapter = BrowserHttpClientAdapter();
    // This property will automatically set cookies
    adapter.withCredentials = true;
    dio.httpClientAdapter = adapter;
    // dio.interceptors.add(LogInterceptor(responseBody: true)); //开启请求日志

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          print(e.message);
          return handler.next(e);
        },
      ),
    );
    return dio;
  }
}
