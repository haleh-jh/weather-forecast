import 'package:feature_weather/core/resources/data_state.dart';
import 'package:feature_weather/core/usecase.dart/use_case.dart';

import '../entities/city_entity.dart';
import '../repository/city_repository.dart';

class SaveCityUseCase implements UseCase<DataState<City>, String> {
  CityRepository _cityRepository;
  SaveCityUseCase(this._cityRepository);

  @override
  Future<DataState<City>> call(String cityName) {
    return _cityRepository.saveCityToDB(cityName);
  }
}
