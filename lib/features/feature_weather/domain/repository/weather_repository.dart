import 'package:feature_weather/core/params/forecast_params.dart';
import 'package:feature_weather/core/resources/data_state.dart';
import 'package:feature_weather/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:feature_weather/features/feature_weather/domain/entities/forcast_days_entity.dart';

import '../../data/models/suggest_city_model.dart';
import '../entities/suggest_city_entity.dart';

abstract class WeatherRepository{
 Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(cityName);
 Future<DataState<ForecastDaysEntity>> fetchForecastWeatherData(ForecastParams params);
 Future<List<Data>> fetchSuggestData(cityName);
}