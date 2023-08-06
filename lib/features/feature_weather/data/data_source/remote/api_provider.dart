import 'package:dio/dio.dart';
import 'package:feature_weather/core/params/forecast_params.dart';
import 'package:feature_weather/core/utils/constants.dart';

class ApiProvider {
  Dio _dio = Dio();

  var apiKey = Constants.apiKeys1;

  /// current weather api call
  Future<dynamic> callCurrentWeather(cityName) async {
    var response = await _dio.get("${Constants.baseUrl}/data/2.5/weather",
        queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'});
    print("res:$response");
    return response;
  }

  Future<dynamic> sendRequest7DaysForcast(ForecastParams params) async {
    var response = await _dio
        .get("${Constants.baseUrl}/data/2.5/onecall", queryParameters: {
      'lat': params.lat,
      'lon': params.lon,
      'exclude': 'minutely,hourly',
      'appid': apiKey,
      'units': 'metric'
    });

    return response;
  }

  Future<dynamic> sendRequestCitySuggestion(String prefix) async {
    var response = await _dio.get(
        "http://geodb-free-service.wirefreethought.com/v1/geo/cities",
        queryParameters: {'limit': 7, 'offset': 0, 'namePrefix': prefix});
        print("sendRequestCitySuggestion: ${response}");
    return response;
  }
}
