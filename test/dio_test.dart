import 'package:beta_acid_challenge/api_response.dart';
import 'package:beta_acid_challenge/remote/app_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() async {
  late Dio dio;
  late DioAdapter dioAdapter;

  group("Album Api", () {
    setUp(() {
      dio = AppDio.getInstance();
      dioAdapter = DioAdapter(dio: dio);
    });

    test("fetch albums", () async {
      const route = '/lookup';
      const params = <String, dynamic>{"id": 909253, "entity": "album"};

      dioAdapter.onGet(route, (server) {
        server.reply(200, apiResponse);
      }, queryParameters: params);
    });
  });
}
