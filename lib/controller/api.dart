import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constants/constants.dart';
import '../model/weather_response.dart';

Future<WeatherResponse?> getdetails({required String location}) async {
  WeatherResponse data;

  final response = await http.get(
    Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=$apikey&q=$location&aqi=no',
    ),
  );
  if (response.statusCode == 200) {
    final result = jsonDecode(response.body) as Map<String, dynamic>;
    data = WeatherResponse.fromJson(result);
    return data;
  } else {
    return null;
  }
}
