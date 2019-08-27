import 'dart:async';

import 'package:json_annotation_model/model/json_data.dart';

import 'app_http.dart';

class AppNetworking {
  static AppNetworking _instance;

  factory AppNetworking() => _getInstance();

  static AppNetworking get instance => _getInstance();

  AppNetworking._internal();

  static AppNetworking _getInstance() {
    if (_instance == null) {
      _instance = AppNetworking._internal();
    }
    return _instance;
  }

  Future getRecommendMovie() async {
    Completer completer = Completer();
    AppHttp.instance
        .get(
      AppNetWorkingConfig.recommendMoviePath,
    )
        .then((dynamic data) {
      var recommendMovie = JsonData.formJson(data);
      print(recommendMovie.title);
      completer.complete(recommendMovie);
    }, onError: (error) {
      completer.completeError(error);
    });

    return completer.future;
  }
}

class AppNetWorkingConfig {
  static String recommendMoviePath = '/json/test';
}
