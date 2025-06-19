// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromMap(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'weather_model.g.dart';

WeatherModel weatherModelFromMap(String str) => WeatherModel.fromJson(json.decode(str));

String weatherModelToMap(WeatherModel data) => json.encode(data.toJson());

@JsonSerializable()
class WeatherModel {
    @JsonKey(name: "location")
    final Location? location;
    @JsonKey(name: "current")
    final Current? current;
    @JsonKey(name: "forecast")
    final Forecast? forecast;

    WeatherModel({
        this.location,
        this.current,
        this.forecast,
    });

    factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);

    Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class Current {
    @JsonKey(name: "last_updated_epoch")
    final int? lastUpdatedEpoch;
    @JsonKey(name: "last_updated")
    final String? lastUpdated;
    @JsonKey(name: "temp_c")
    final double? tempC;
    @JsonKey(name: "temp_f")
    final double? tempF;
    @JsonKey(name: "is_day")
    final int? isDay;
    @JsonKey(name: "condition")
    final Condition? condition;
    @JsonKey(name: "wind_mph")
    final double? windMph;
    @JsonKey(name: "wind_kph")
    final double? windKph;
    @JsonKey(name: "wind_degree")
    final int? windDegree;
    @JsonKey(name: "wind_dir")
    final String? windDir;
    @JsonKey(name: "pressure_mb")
    final int? pressureMb;
    @JsonKey(name: "pressure_in")
    final double? pressureIn;
    @JsonKey(name: "precip_mm")
    final double? precipMm;
    @JsonKey(name: "precip_in")
    final double? precipIn;
    @JsonKey(name: "humidity")
    final int? humidity;
    @JsonKey(name: "cloud")
    final int? cloud;
    @JsonKey(name: "feelslike_c")
    final double? feelslikeC;
    @JsonKey(name: "feelslike_f")
    final double? feelslikeF;
    @JsonKey(name: "windchill_c")
    final double? windchillC;
    @JsonKey(name: "windchill_f")
    final double? windchillF;
    @JsonKey(name: "heatindex_c")
    final double? heatindexC;
    @JsonKey(name: "heatindex_f")
    final double? heatindexF;
    @JsonKey(name: "dewpoint_c")
    final double? dewpointC;
    @JsonKey(name: "dewpoint_f")
    final double? dewpointF;
    @JsonKey(name: "vis_km")
    final int? visKm;
    @JsonKey(name: "vis_miles")
    final int? visMiles;
    @JsonKey(name: "uv")
    final double? uv;
    @JsonKey(name: "gust_mph")
    final double? gustMph;
    @JsonKey(name: "gust_kph")
    final double? gustKph;
    @JsonKey(name: "time_epoch")
    final int? timeEpoch;
    @JsonKey(name: "time")
    final String? time;
    @JsonKey(name: "snow_cm")
    final double? snowCm;
    @JsonKey(name: "will_it_rain")
    final int? willItRain;
    @JsonKey(name: "chance_of_rain")
    final int? chanceOfRain;
    @JsonKey(name: "will_it_snow")
    final int? willItSnow;
    @JsonKey(name: "chance_of_snow")
    final int? chanceOfSnow;

    Current({
        this.lastUpdatedEpoch,
        this.lastUpdated,
        this.tempC,
        this.tempF,
        this.isDay,
        this.condition,
        this.windMph,
        this.windKph,
        this.windDegree,
        this.windDir,
        this.pressureMb,
        this.pressureIn,
        this.precipMm,
        this.precipIn,
        this.humidity,
        this.cloud,
        this.feelslikeC,
        this.feelslikeF,
        this.windchillC,
        this.windchillF,
        this.heatindexC,
        this.heatindexF,
        this.dewpointC,
        this.dewpointF,
        this.visKm,
        this.visMiles,
        this.uv,
        this.gustMph,
        this.gustKph,
        this.timeEpoch,
        this.time,
        this.snowCm,
        this.willItRain,
        this.chanceOfRain,
        this.willItSnow,
        this.chanceOfSnow,
    });

    factory Current.fromJson(Map<String, dynamic> json) => _$CurrentFromJson(json);

    Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

@JsonSerializable()
class Condition {
    @JsonKey(name: "text")
    final String? text;
    @JsonKey(name: "icon")
    final String? icon;
    @JsonKey(name: "code")
    final int? code;

    Condition({
        this.text,
        this.icon,
        this.code,
    });

    factory Condition.fromJson(Map<String, dynamic> json) => _$ConditionFromJson(json);

    Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

@JsonSerializable()
class Forecast {
    @JsonKey(name: "forecastday")
    final List<Forecastday>? forecastday;

    Forecast({
        this.forecastday,
    });

    factory Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);

    Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

@JsonSerializable()
class Forecastday {
    @JsonKey(name: "date")
    final DateTime? date;
    @JsonKey(name: "date_epoch")
    final int? dateEpoch;
    @JsonKey(name: "day")
    final Day? day;
    @JsonKey(name: "astro")
    final Astro? astro;
    @JsonKey(name: "hour")
    final List<Current>? hour;

    Forecastday({
        this.date,
        this.dateEpoch,
        this.day,
        this.astro,
        this.hour,
    });

    factory Forecastday.fromJson(Map<String, dynamic> json) => _$ForecastdayFromJson(json);

    Map<String, dynamic> toJson() => _$ForecastdayToJson(this);
}

@JsonSerializable()
class Astro {
    @JsonKey(name: "sunrise")
    final String? sunrise;
    @JsonKey(name: "sunset")
    final String? sunset;
    @JsonKey(name: "moonrise")
    final String? moonrise;
    @JsonKey(name: "moonset")
    final String? moonset;
    @JsonKey(name: "moon_phase")
    final String? moonPhase;
    @JsonKey(name: "moon_illumination")
    final int? moonIllumination;
    @JsonKey(name: "is_moon_up")
    final int? isMoonUp;
    @JsonKey(name: "is_sun_up")
    final int? isSunUp;

    Astro({
        this.sunrise,
        this.sunset,
        this.moonrise,
        this.moonset,
        this.moonPhase,
        this.moonIllumination,
        this.isMoonUp,
        this.isSunUp,
    });

    factory Astro.fromJson(Map<String, dynamic> json) => _$AstroFromJson(json);

    Map<String, dynamic> toJson() => _$AstroToJson(this);
}

@JsonSerializable()
class Day {
    @JsonKey(name: "maxtemp_c")
    final double? maxtempC;
    @JsonKey(name: "maxtemp_f")
    final double? maxtempF;
    @JsonKey(name: "mintemp_c")
    final double? mintempC;
    @JsonKey(name: "mintemp_f")
    final double? mintempF;
    @JsonKey(name: "avgtemp_c")
    final double? avgtempC;
    @JsonKey(name: "avgtemp_f")
    final double? avgtempF;
    @JsonKey(name: "maxwind_mph")
    final double? maxwindMph;
    @JsonKey(name: "maxwind_kph")
    final double? maxwindKph;
    @JsonKey(name: "totalprecip_mm")
    final double? totalprecipMm;
    @JsonKey(name: "totalprecip_in")
    final double? totalprecipIn;
    @JsonKey(name: "totalsnow_cm")
    final double? totalsnowCm;
    @JsonKey(name: "avgvis_km")
    final double? avgvisKm;
    @JsonKey(name: "avgvis_miles")
    final int? avgvisMiles;
    @JsonKey(name: "avghumidity")
    final int? avghumidity;
    @JsonKey(name: "daily_will_it_rain")
    final int? dailyWillItRain;
    @JsonKey(name: "daily_chance_of_rain")
    final int? dailyChanceOfRain;
    @JsonKey(name: "daily_will_it_snow")
    final int? dailyWillItSnow;
    @JsonKey(name: "daily_chance_of_snow")
    final int? dailyChanceOfSnow;
    @JsonKey(name: "condition")
    final Condition? condition;
    @JsonKey(name: "uv")
    final double? uv;

    Day({
        this.maxtempC,
        this.maxtempF,
        this.mintempC,
        this.mintempF,
        this.avgtempC,
        this.avgtempF,
        this.maxwindMph,
        this.maxwindKph,
        this.totalprecipMm,
        this.totalprecipIn,
        this.totalsnowCm,
        this.avgvisKm,
        this.avgvisMiles,
        this.avghumidity,
        this.dailyWillItRain,
        this.dailyChanceOfRain,
        this.dailyWillItSnow,
        this.dailyChanceOfSnow,
        this.condition,
        this.uv,
    });

    factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

    Map<String, dynamic> toJson() => _$DayToJson(this);
}

@JsonSerializable()
class Location {
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "region")
    final String? region;
    @JsonKey(name: "country")
    final String? country;
    @JsonKey(name: "lat")
    final double? lat;
    @JsonKey(name: "lon")
    final double? lon;
    @JsonKey(name: "tz_id")
    final String? tzId;
    @JsonKey(name: "localtime_epoch")
    final int? localtimeEpoch;
    @JsonKey(name: "localtime")
    final String? localtime;

    Location({
        this.name,
        this.region,
        this.country,
        this.lat,
        this.lon,
        this.tzId,
        this.localtimeEpoch,
        this.localtime,
    });

    factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

    Map<String, dynamic> toJson() => _$LocationToJson(this);
}
