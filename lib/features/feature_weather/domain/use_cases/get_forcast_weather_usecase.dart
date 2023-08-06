import 'package:feature_weather/core/params/forecast_params.dart';
import 'package:feature_weather/core/resources/data_state.dart';
import 'package:feature_weather/features/feature_weather/domain/entities/forcast_days_entity.dart';
import 'package:feature_weather/features/feature_weather/domain/repository/weather_repository.dart';

import '../../../../core/usecase.dart/use_case.dart';

class GetForecastWeatherUseCase extends UseCase<DataState<ForecastDaysEntity>, ForecastParams>{
  final WeatherRepository _weatherRepository;

  GetForecastWeatherUseCase(this._weatherRepository);
  @override
  Future<DataState<ForecastDaysEntity>> call(params) {
    return _weatherRepository.fetchForecastWeatherData(params);
  }

}