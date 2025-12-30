/// 날씨 정보를 담고 있는 메인 데이터 클래스
class Weather {
  /// 요청한 지역의 위도
  final double latitude;
  /// 요청한 지역의 경도
  final double longitude;
  /// 기상 데이터 생성에 소요된 시간 (밀리초)
  final double generationtimeMs;
  /// UTC 기준 시간 오차 (초 단위)
  final int utcOffsetSeconds;
  /// 해당 지역의 타임존 이름 (예: "GMT")
  final String timezone;
  /// 타임존의 약어 (예: "GMT")
  final String timezoneAbbreviation;
  /// 해당 위치의 해발 고도 (미터)
  final double elevation;
  /// 현재 날씨 데이터의 단위 정보
  final WeatherUnits currentWeatherUnits;
  /// 현재 시점의 상세 기상 수치
  final CurrentWeather currentWeather;

  Weather({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentWeatherUnits,
    required this.currentWeather,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      generationtimeMs: (json['generationtime_ms'] as num).toDouble(),
      utcOffsetSeconds: json['utc_offset_seconds'],
      timezone: json['timezone'],
      timezoneAbbreviation: json['timezone_abbreviation'],
      elevation: (json['elevation'] as num).toDouble(),
      currentWeatherUnits: WeatherUnits.fromJson(json['current_weather_units']),
      currentWeather: CurrentWeather.fromJson(json['current_weather']),
    );
  }
}

/// 기상 데이터 각 항목의 단위를 정의하는 클래스
class WeatherUnits {
  /// 시간 형식 (예: "iso8601")
  final String time;
  /// 데이터 측정 간격 (단위: 초)
  final String interval;
  /// 기온의 단위 (예: "°C")
  final String temperature;
  /// 풍속의 단위 (예: "km/h")
  final String windspeed;
  /// 풍향의 단위 (예: "°")
  final String winddirection;
  /// 낮/밤 구분 여부의 단위
  final String isDay;
  /// 기상 코드 체계 설명 (예: "wmo code")
  final String weathercode;

  WeatherUnits({
    required this.time,
    required this.interval,
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.isDay,
    required this.weathercode,
  });

  factory WeatherUnits.fromJson(Map<String, dynamic> json) {
    return WeatherUnits(
      time: json['time'],
      interval: json['interval'],
      temperature: json['temperature'],
      windspeed: json['windspeed'],
      winddirection: json['winddirection'],
      isDay: json['is_day'],
      weathercode: json['weathercode'],
    );
  }
}

/// 현재 시점의 구체적인 날씨 수치 데이터 클래스
class CurrentWeather {
  /// 데이터 측정 시간 (ISO8601 형식)
  final String time;
  /// 데이터 업데이트 간격
  final int interval;
  /// 현재 기온
  final double temperature;
  /// 현재 풍속
  final double windspeed;
  /// 현재 풍향 (0~360도)
  final int winddirection;
  /// 낮/밤 여부 (1: 낮, 0: 밤)
  final int isDay;
  /// WMO 기상 코드 (날씨 상태 정보)
  final int weathercode;

  CurrentWeather({
    required this.time,
    required this.interval,
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.isDay,
    required this.weathercode,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      time: json['time'],
      interval: json['interval'],
      temperature: (json['temperature'] as num).toDouble(),
      windspeed: (json['windspeed'] as num).toDouble(),
      winddirection: json['winddirection'],
      isDay: json['is_day'],
      weathercode: json['weathercode'],
    );
  }
}