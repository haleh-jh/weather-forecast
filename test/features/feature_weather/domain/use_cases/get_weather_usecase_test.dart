import 'dart:convert';

import 'package:feature_weather/core/resources/data_state.dart';
import 'package:feature_weather/features/feature_weather/data/models/current_city_model.dart';
import 'package:feature_weather/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:feature_weather/features/feature_weather/domain/use_cases/get_weather_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';
import '../../../../helpers/test_mock.mocks.dart';

void main() {
 late MockWeatherRepository mockWeatherRepository;
 late GetWeatherUseCase getWeatherUseCase;
 late CurrentCityEntity currentCityEntity;
 String cityName = 'Tehran';

 setUp(() {
  mockWeatherRepository = MockWeatherRepository();
  getWeatherUseCase = GetWeatherUseCase(mockWeatherRepository);
  currentCityEntity = CurrentCityModel.fromJson(
        json.decode(jsonReader(successCurrentCityModel))as Map<String, dynamic>);
 });

 test("should get CurrentWeatherData from the repository", () async{
     when(mockWeatherRepository.fetchCurrentWeatherData(cityName)).thenAnswer((_) async {
          return DataSuccess(currentCityEntity);
     });

     final result = await getWeatherUseCase.call(cityName);

     expect(result, DataSuccess(currentCityEntity));
 });
}