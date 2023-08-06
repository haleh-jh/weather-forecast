import 'package:feature_weather/core/resources/data_state.dart';
import 'package:feature_weather/core/usecase.dart/use_case.dart';
import 'package:feature_weather/features/feature_bookmark/domain/entities/city_entity.dart';

import '../repository/city_repository.dart';

class GetCityUseCase implements UseCase<DataState<City?>, String> {
  CityRepository _cityRepository;
  GetCityUseCase(this._cityRepository);

  @override
  Future<DataState<City?>> call(String name) {
    return _cityRepository.findCityByName(name);
  }
}
