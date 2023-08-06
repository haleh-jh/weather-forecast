import 'dart:convert';

import 'package:feature_weather/features/feature_weather/data/models/current_city_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';

void main() {
  var weather =
      Weather(id: 800, main: "Clear", description: "clear sky", icon: "01d");
  var currentCityModel = CurrentCityModel(
      coord: Coord(lon: 51.4215, lat: 35.6944),
      weather: [weather],
      // base: 'stations',
      // main: Main(
      //     temp: 34.91,
      //     feelsLike: 32.64,
      //     tempMin: 34.84,
      //     tempMax: 35.79,
      //     pressure: 1008,
      //     humidity: 17),
      // visibility: 10000,
      // wind: Wind(speed: 4.12, deg: 280),
      // clouds: Clouds(all: 20),
      // dt: 1689593233,
      // sys: Sys(
      //     type: 2,
      //     id: 47737,
      //     country: "IR",
      //     sunrise: 1689557439,
      //     sunset: 1689608986),
      // timezone: 12600,
      // id: 112931,
      name: "Tehran",
    //  cod: 200
      );
  //var currentCityModel = CurrentCityModel(weather: [weather], name: "Tehran");

  test('from json, should return a valid model from json', () {
    /// arrange
    final jsonMap = json.decode(jsonReader(successCurrentCityModel));

    /// act
    final result = CurrentCityModel.fromJson(jsonMap as Map<String, dynamic>);

    expect(result, equals(currentCityModel));
  });

}
