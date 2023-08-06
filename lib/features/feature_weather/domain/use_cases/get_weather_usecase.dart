import 'package:feature_weather/core/resources/data_state.dart';
import 'package:feature_weather/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:feature_weather/features/feature_weather/domain/repository/weather_repository.dart';

import '../../../../core/usecase.dart/use_case.dart';

class GetWeatherUseCase extends UseCase{
 final WeatherRepository weatherRepository;

  GetWeatherUseCase(this.weatherRepository);
  
  @override
  Future<DataState<CurrentCityEntity>> call(cityName) {
       return weatherRepository.fetchCurrentWeatherData(cityName);
  }


}