// Mocks generated by Mockito 5.4.0 from annotations
// in feature_weather/test/helpers/test_mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:feature_weather/core/params/forecast_params.dart' as _i5;
import 'package:feature_weather/core/resources/data_state.dart' as _i2;
import 'package:feature_weather/features/feature_weather/data/data_source/remote/api_provider.dart'
    as _i3;
import 'package:feature_weather/features/feature_weather/data/models/suggest_city_model.dart'
    as _i9;
import 'package:feature_weather/features/feature_weather/domain/entities/current_city_entity.dart'
    as _i7;
import 'package:feature_weather/features/feature_weather/domain/entities/forcast_days_entity.dart'
    as _i8;
import 'package:feature_weather/features/feature_weather/domain/repository/weather_repository.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDataState_0<T> extends _i1.SmartFake implements _i2.DataState<T> {
  _FakeDataState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApiProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiProvider extends _i1.Mock implements _i3.ApiProvider {
  MockApiProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get apiKey => (super.noSuchMethod(
        Invocation.getter(#apiKey),
        returnValue: '',
      ) as String);
  @override
  set apiKey(String? _apiKey) => super.noSuchMethod(
        Invocation.setter(
          #apiKey,
          _apiKey,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<dynamic> callCurrentWeather(dynamic cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #callCurrentWeather,
          [cityName],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> sendRequest7DaysForcast(_i5.ForecastParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendRequest7DaysForcast,
          [params],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> sendRequestCitySuggestion(String? prefix) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendRequestCitySuggestion,
          [prefix],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
}

/// A class which mocks [WeatherRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRepository extends _i1.Mock implements _i6.WeatherRepository {
  MockWeatherRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.DataState<_i7.CurrentCityEntity>> fetchCurrentWeatherData(
          dynamic cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchCurrentWeatherData,
          [cityName],
        ),
        returnValue: _i4.Future<_i2.DataState<_i7.CurrentCityEntity>>.value(
            _FakeDataState_0<_i7.CurrentCityEntity>(
          this,
          Invocation.method(
            #fetchCurrentWeatherData,
            [cityName],
          ),
        )),
      ) as _i4.Future<_i2.DataState<_i7.CurrentCityEntity>>);
  @override
  _i4.Future<_i2.DataState<_i8.ForecastDaysEntity>> fetchForecastWeatherData(
          _i5.ForecastParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchForecastWeatherData,
          [params],
        ),
        returnValue: _i4.Future<_i2.DataState<_i8.ForecastDaysEntity>>.value(
            _FakeDataState_0<_i8.ForecastDaysEntity>(
          this,
          Invocation.method(
            #fetchForecastWeatherData,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.DataState<_i8.ForecastDaysEntity>>);
  @override
  _i4.Future<List<_i9.Data>> fetchSuggestData(dynamic cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchSuggestData,
          [cityName],
        ),
        returnValue: _i4.Future<List<_i9.Data>>.value(<_i9.Data>[]),
      ) as _i4.Future<List<_i9.Data>>);
}
