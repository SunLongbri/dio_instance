import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation_model/model/json_data.dart';
import 'package:json_annotation_model/util/app_networking.dart';

void main() {
  group('jsonparse test', () {
    test('mockdata test', () {
      JsonData jsonData = JsonData();
      AppNetworking.instance.getRecommendMovie().then((val) {
        jsonData = val;
        expect(
            jsonData.title, ' My YC app: Dropbox - Throw away your USB drive');
      });
    });
  });
}
