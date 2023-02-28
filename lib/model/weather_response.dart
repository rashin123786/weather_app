import 'package:json_annotation/json_annotation.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  @JsonKey(name: 'text')
  String? text;
  @JsonKey(name: 'temp_c')
  double? tempC;
  @JsonKey(name: 'wind_mph')
  double? windMph;
  @JsonKey(name: 'pressure_mb')
  double? pressureMb;
  @JsonKey(name: 'humidity')
  int? humidity;
  @JsonKey(name: 'feelslike_c')
  double? feelslikeC;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'country')
  String? country;
  @JsonKey(name: 'lat')
  double? lat;
  @JsonKey(name: 'lon')
  double? lon;

  WeatherResponse(
      {this.text,
      this.tempC,
      this.windMph,
      this.pressureMb,
      this.humidity,
      this.feelslikeC,
      this.country,
      this.lat,
      this.lon,
      this.name});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return _$WeatherResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
