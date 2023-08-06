import 'package:feature_weather/core/resources/data_state.dart';
import 'package:feature_weather/core/usecase.dart/use_case.dart';
import 'package:feature_weather/features/feature_bookmark/domain/entities/city_entity.dart';

import '../repository/city_repository.dart';

class DeleteCityUseCase implements UseCase<DataState<String>, String> {
  CityRepository _cityRepository;
  DeleteCityUseCase(this._cityRepository);

  @override
  Future<DataState<String>> call(String name) {
    return _cityRepository.deleteCityByName(name);
  }
}
