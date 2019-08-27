import 'dart:async';

import 'package:dio/dio.dart';

class AppHttp {
  static AppHttp _instance;

  static AppHttp get instance => _getInstance();

  factory AppHttp() => _getInstance();

  Dio dio;

  static AppHttp _getInstance() {
    if (_instance == null) {
      _instance = AppHttp._internal();
    }
    return _instance;
  }

  AppHttp._internal() {
    var options = Options(
      baseUrl:
          'https://easy-mock.com/mock/5c74edefa4b357117cec9ce5/flutter_shop',
      connectTimeout: 10000,
      receiveTimeout: 3000,
      headers: {},
    );
    dio = new Dio(options);
  }

  Future get(
    String path, {
    Map data,
    CancelToken cancelToken,
  }) async {
    Completer completer = Completer();
    try {
      print('path:${path},data:${data}');
      Response response =
          await dio.get(path, data: 50, cancelToken: cancelToken);
      print('response:${response}');
      completer.complete(response.data);
    } on DioError catch (err) {
      if (CancelToken.isCancel(err)) {
        print('Request canceled ! ' + err.message);
      } else if (err.type == DioErrorType.CONNECT_TIMEOUT ||
          err.type == DioErrorType.RECEIVE_TIMEOUT) {
        print('请求超时，请稍后重试！');
        completer.completeError(err);
      } else {
        print('请求失败，请检查网络链接！');
        completer.completeError(err);
      }
    }
    return completer.future;
  }
}
