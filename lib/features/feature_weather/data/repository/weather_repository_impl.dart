import 'package:dio/dio.dart';
import 'package:feature_weather/core/params/forecast_params.dart';
import 'package:feature_weather/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:feature_weather/features/feature_weather/data/models/current_city_model.dart';
import 'package:feature_weather/features/feature_weather/data/models/forcast_days_model.dart';
import 'package:feature_weather/features/feature_weather/data/models/suggest_city_model.dart';
import 'package:feature_weather/features/feature_weather/domain/entities/current_city_entity.dart';

import 'package:feature_weather/core/resources/data_state.dart';
import 'package:feature_weather/features/feature_weather/domain/entities/forcast_days_entity.dart';

import '../../domain/entities/suggest_city_entity.dart';
import '../../domain/repository/weather_repository.dart';

class WeatherRepositorImpl extends WeatherRepository {
  final ApiProvider apiProvider;

  WeatherRepositorImpl(this.apiProvider);

  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(cityName) async {
    try {
      Response response = await apiProvider.callCurrentWeather(cityName);
      print("tt: ${response.data}");
      if (response.statusCode == 200) {
        CurrentCityEntity currentCityEntity =
            CurrentCityModel.fromJson(response.data);
        return DataSuccess(currentCityEntity);
      } else {
        return const DataFailed('Something went wrong...');
      }
    } catch (e) {
      print(e.toString());
      return const DataFailed('Please check your connectivity...');
    }
  }

  @override
  Future<DataState<ForecastDaysEntity>> fetchForecastWeatherData(
      ForecastParams params) async {
    try {
      Response response = await apiProvider.sendRequest7DaysForcast(params);
      if (response.statusCode == 200) {
        ForecastDaysEntity forecastDaysEntity =
            ForecastDaysModel.fromJson(response.data);
        return DataSuccess(forecastDaysEntity);
      } else {
        return const DataFailed('Something went wrong...');
      }
    } catch (e) {
      print("${e.toString()}");
      return const DataFailed('Please check your connectivity...');
    }
  }

  @override
  Future<List<Data>> fetchSuggestData(cityName) async {
    Response response = await apiProvider.sendRequestCitySuggestion(cityName);
    SuggestCityEntity suggestCityEntity =
        SuggestCityModel.fromJson(response.data);
    return suggestCityEntity.data!;
  }
}
