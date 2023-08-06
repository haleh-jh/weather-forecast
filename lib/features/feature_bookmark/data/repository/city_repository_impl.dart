import 'package:feature_weather/features/feature_bookmark/data/data_source/local/city_dao.dart';
import 'package:feature_weather/features/feature_bookmark/domain/entities/city_entity.dart';

import 'package:feature_weather/core/resources/data_state.dart';

import '../../domain/repository/city_repository.dart';

class CityRepositoryImpl extends CityRepository {
  CityDao _cityDao;
  CityRepositoryImpl(this._cityDao);

  @override
  Future<DataState<String>> deleteCityByName(String name) async {
    try {
      await _cityDao.deleteCityByName(name);
      return DataSuccess(name);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<City?>> findCityByName(String name) async {
    try {
      City? city = await _cityDao.findCityByName(name);
      return DataSuccess(city);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<City>>> getAllCityFromDB() async {
    try {
      List<City> cities = await _cityDao.getAllCity();
      return DataSuccess(cities);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<City>> saveCityToDB(String cityName) async{
    try {
        // check city exist or not
      City? checkCity = await _cityDao.findCityByName(cityName);
      if(checkCity != null){
        return DataFailed("$cityName has Already exist");
      }
      // insert city to database
      City city = City(name: cityName);
      await _cityDao.insertCity(city);
      return DataSuccess(city);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
