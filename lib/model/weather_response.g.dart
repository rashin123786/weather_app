// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      text: json['current']['condition']['text'] as String?,
      tempC: (json['current']['temp_c'] as num?)?.toDouble(),
      windMph: (json['current']['wind_mph'] as num?)?.toDouble(),
      pressureMb: (json['current']['pressure_mb'] as num?)?.toDouble(),
      humidity: json['current']['humidity'] as int?,
      feelslikeC: (json['current']['feelslike_c'] as num?)?.toDouble(),
      country: json['location']['country'] as String?,
      lat: (json['location']['lat'] as num?)?.toDouble(),
      lon: (json['location']['lon'] as num?)?.toDouble(),
      name: json['location']['name'] as String?,
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'text': instance.text,
      'temp_c': instance.tempC,
      'wind_mph': instance.windMph,
      'pressure_mb': instance.pressureMb,
      'humidity': instance.humidity,
      'feelslike_c': instance.feelslikeC,
      'name': instance.name,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
    };
