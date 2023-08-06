import 'package:bloc_test/bloc_test.dart';
import 'package:feature_weather/core/params/forecast_params.dart';
import 'package:feature_weather/core/resources/data_state.dart';
import 'package:feature_weather/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:feature_weather/features/feature_weather/domain/entities/forcast_days_entity.dart';
import 'package:feature_weather/features/feature_weather/domain/use_cases/get_forcast_weather_usecase.dart';
import 'package:feature_weather/features/feature_weather/domain/use_cases/get_weather_usecase.dart';
import 'package:feature_weather/features/feature_weather/presentation/bloc/bloc/cw_status.dart';
import 'package:feature_weather/features/feature_weather/presentation/bloc/bloc/fw_status.dart';
import 'package:feature_weather/features/feature_weather/presentation/bloc/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'home_bloc_test.mocks.dart';

@GenerateMocks([GetWeatherUseCase, GetForecastWeatherUseCase])
void main() {
  MockGetWeatherUseCase mockGetWeatherUseCase = MockGetWeatherUseCase();
  MockGetForecastWeatherUseCase mockGetForecastWeatherUseCase =
      MockGetForecastWeatherUseCase();

  String cityName = 'Tehran';
  String error = 'error';
  double lat = 0;
  double lon = 0;

  when(mockGetWeatherUseCase.call(any))
      .thenAnswer((_) => Future.value(DataSuccess(CurrentCityEntity())));

  blocTest<HomeBloc, HomeState>(
    'emits Loading and Completed state',
    build: () => HomeBloc(
        getWeatherUseCase: mockGetWeatherUseCase,
        getForecastWeatherUseCase: mockGetForecastWeatherUseCase),
    act: (bloc) => bloc.add(LoadCwEvent(cityName)),
    expect: () => <HomeState>[
      HomeState(fwStatus: FwLoading(), cwStatus: CwLoading()),
      HomeState(
          fwStatus: FwLoading(), cwStatus: CwCompleted(CurrentCityEntity()))
    ],
  );

  test('emits Loading and Error state', () {
    when(mockGetWeatherUseCase.call(cityName))
        .thenAnswer((_) => Future.value(DataFailed(error)));
    var bloc = HomeBloc(
        getWeatherUseCase: mockGetWeatherUseCase,
        getForecastWeatherUseCase: mockGetForecastWeatherUseCase);
    bloc.add(LoadCwEvent(cityName));
    expectLater(
        bloc.stream,
        emitsInOrder([
          HomeState(fwStatus: FwLoading(), cwStatus: CwLoading()),
          HomeState(fwStatus: FwLoading(), cwStatus: CwError(error)),
        ]));
  });

  ForecastDaysEntity forecastDaysEntity = ForecastDaysEntity();

  when(mockGetForecastWeatherUseCase.call(any))
      .thenAnswer((_) => Future.value(DataSuccess(forecastDaysEntity)));

  blocTest<HomeBloc, HomeState>(
    'emits Loading and Completed state.',
    build: () => HomeBloc(
        getWeatherUseCase: mockGetWeatherUseCase,
        getForecastWeatherUseCase: mockGetForecastWeatherUseCase),
    act: (bloc) => bloc.add(LoadFwEvent(ForecastParams(lon, lat))),
    expect: () => <HomeState>[
      HomeState(fwStatus: FwLoading(), cwStatus: CwLoading()),
      HomeState(
          fwStatus: FwCompleted(forecastDaysEntity), cwStatus: CwLoading()),
    ],
  );

  test('emits Loading and Error state.', () {
    when(mockGetForecastWeatherUseCase.call(any)).thenAnswer((_) => Future.value(DataFailed(error)));
    final bloc = HomeBloc(
        getWeatherUseCase: mockGetWeatherUseCase,
        getForecastWeatherUseCase: mockGetForecastWeatherUseCase);
    bloc.add(LoadFwEvent(ForecastParams(lon, lat)));
    expectLater(
        bloc.stream,
        emitsInOrder([
          HomeState(fwStatus: FwLoading(), cwStatus: CwLoading()),
          HomeState(fwStatus: FwError(error), cwStatus: CwLoading()),
        ]));
  });
}
