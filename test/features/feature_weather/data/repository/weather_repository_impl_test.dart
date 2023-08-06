import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:feature_weather/core/resources/data_state.dart';
import 'package:feature_weather/features/feature_weather/data/models/current_city_model.dart';
import 'package:feature_weather/features/feature_weather/data/repository/weather_repository_impl.dart';
import 'package:feature_weather/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';
import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late MockApiProvider mockApiProvider;
  late WeatherRepositorImpl weatherRepositorImpl;
  late CurrentCityEntity currentCityEntity;
  String cityName = 'Tehran';

  setUp(() {
    mockApiProvider = MockApiProvider();
    weatherRepositorImpl = WeatherRepositorImpl(mockApiProvider);
    currentCityEntity = CurrentCityModel.fromJson(
        json.decode(jsonReader(successCurrentCityModel))as Map<String, dynamic>);
  });

  group("CurrentCityEntity", () {

    test('should return CurrentCityEntity when call data is success', () async {

      when(mockApiProvider.callCurrentWeather(cityName)).thenAnswer((_) async {
        Response response = Response(requestOptions: RequestOptions(), data: (json.decode(jsonReader(successCurrentCityModel)) as Map<String, dynamic>), statusCode: 200);
         return response;
       //  return json.decode(jsonReader(successCurrentCityModel)) as Map<String, dynamic>;
      });

     final result = await weatherRepositorImpl.fetchCurrentWeatherData(cityName);

     print("res: $result");

      verify(mockApiProvider.callCurrentWeather(cityName));

      expect(result, DataSuccess(currentCityEntity));
       
    });
  });
}
