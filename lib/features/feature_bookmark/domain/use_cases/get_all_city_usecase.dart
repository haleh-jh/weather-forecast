import 'package:feature_weather/core/resources/data_state.dart';
import 'package:feature_weather/core/usecase.dart/use_case.dart';
import 'package:feature_weather/features/feature_bookmark/domain/entities/city_entity.dart';

import '../repository/city_repository.dart';

class GetAllCityUseCase implements UseCase<DataState<List<City>>, noParams>{
  CityRepository _cityRepository;
  GetAllCityUseCase(this._cityRepository);

  @override
  Future<DataState<List<City>>> call(noParams params) {
    return _cityRepository.getAllCityFromDB();
  }

}