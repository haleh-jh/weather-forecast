import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:feature_weather/core/utils/constants.dart';
import 'package:feature_weather/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:feature_weather/features/feature_weather/data/models/current_city_model.dart';
import 'package:feature_weather/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../../../../helpers/json_reader.dart';
import '../../../../../helpers/paths.dart';

import 'dart:convert';
import '../../../../../helpers/json_reader.dart';

void main() {
  late DioAdapter dioAdapter;
  late ApiProvider apiProvider;
  Dio _dio = Dio();
  var apiKey = Constants.apiKeys1;
  String cityName = 'Tehran';

  setUp(() {
    print('setUp');
    dioAdapter = DioAdapter(dio: _dio);
    apiProvider = ApiProvider();
  });

  group('callCurrentWeather', () {

   // var currentCityModel = CurrentCityModel.fromJson(json.decode(jsonReader(successCurrentCityModel)) as Map<String, dynamic>);
    var currentCityModel = json.decode(jsonReader(successCurrentCityModel)) as Map<String, dynamic>;
    test('should return currentCityModel success when response code is 200',
        () async {
      dioAdapter.onGet(
          '${Constants.baseUrl}/data/2.5/weather',
          (server) => server.reply(
              200, json.decode(jsonReader(successCurrentCityModel))),
          queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'});

      final result = await apiProvider.callCurrentWeather(cityName);

      /// assert
      expect(result.statusCode, 200);
      expect(result.data, currentCityModel);
      // result.fold(
      //   (l) => expect(l, null),
      //   (r) => expect(r, currentCityModel),
      // );

    });
  });
}
