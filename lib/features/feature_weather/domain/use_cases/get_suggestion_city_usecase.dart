import 'package:feature_weather/core/usecase.dart/use_case.dart';
import 'package:feature_weather/features/feature_weather/data/models/suggest_city_model.dart';
import 'package:feature_weather/features/feature_weather/domain/repository/weather_repository.dart';

class GetSuggestionCityUseCase extends UseCase<List<Data>, String>{
  final WeatherRepository _weatherRepository;

  GetSuggestionCityUseCase(this._weatherRepository);
  @override
  Future<List<Data>> call(String cityName) {
   return _weatherRepository.fetchSuggestData(cityName);
  }


}