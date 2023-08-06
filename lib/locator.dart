import 'package:feature_weather/features/feature_bookmark/data/data_source/local/database.dart';
import 'package:feature_weather/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:feature_weather/features/feature_weather/data/repository/weather_repository_impl.dart';
import 'package:feature_weather/features/feature_weather/domain/repository/weather_repository.dart';
import 'package:feature_weather/features/feature_weather/domain/use_cases/get_weather_usecase.dart';
import 'package:feature_weather/features/feature_weather/presentation/bloc/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/feature_bookmark/data/repository/city_repository_impl.dart';
import 'features/feature_bookmark/domain/repository/city_repository.dart';
import 'features/feature_bookmark/domain/use_cases/delete_city_usecase.dart';
import 'features/feature_bookmark/domain/use_cases/get_all_city_usecase.dart';
import 'features/feature_bookmark/domain/use_cases/get_city_usecase.dart';
import 'features/feature_bookmark/domain/use_cases/save_city_usecase.dart';
import 'features/feature_bookmark/presentation/bloc/bookmark_bloc.dart';
import 'features/feature_weather/domain/use_cases/get_forcast_weather_usecase.dart';
import 'features/feature_weather/domain/use_cases/get_suggestion_city_usecase.dart';

GetIt locator = GetIt.instance;

initDependencies() async {
  locator.registerSingleton<ApiProvider>(ApiProvider());

  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  locator.registerSingleton<AppDatabase>(database);

  //repositories
  locator.registerSingleton<WeatherRepository>(WeatherRepositorImpl(locator()));
  locator.registerSingleton<CityRepository>(CityRepositoryImpl(database.cityDao));

  //useCases
  locator.registerSingleton<GetWeatherUseCase>(GetWeatherUseCase(locator()));
  locator.registerSingleton<GetForecastWeatherUseCase>(GetForecastWeatherUseCase(locator()));
  locator.registerSingleton<DeleteCityUseCase>(DeleteCityUseCase(locator()));
  locator.registerSingleton<GetAllCityUseCase>(GetAllCityUseCase(locator()));
  locator.registerSingleton<GetCityUseCase>(GetCityUseCase(locator()));
  locator.registerSingleton<SaveCityUseCase>(SaveCityUseCase(locator()));

  //bloc
  locator.registerSingleton<HomeBloc>(HomeBloc(
      getWeatherUseCase: locator(), getForecastWeatherUseCase: locator()));
  locator.registerSingleton<BookmarkBloc>(BookmarkBloc(
      getCityUseCase: locator(),
      saveCityUseCase: locator(),
      getAllCityUseCase: locator(),
      deleteCityUseCase: locator()));
}
