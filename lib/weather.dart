/// 날씨 정보를 담는 최상위 클래스
class Weather {
  /// 위도
  final double latitude;

  /// 경도
  final double longitude;

  /// 생성 시간 (ms)
  final double generationTimeMs;

  /// UTC 오프셋 (초)
  final int utcOffsetSeconds;

  /// 타임존 이름 (예: GMT)
  final String timezone;

  /// 타임존 약어
  final String timezoneAbbreviation;

  /// 고도
  final double elevation;

  /// 현재 기상 수치 단위 정보
  final CurrentWeatherUnits currentWeatherUnits;

  /// 현재 기상 실제 데이터
  final CurrentWeather currentWeather;

  Weather({
    required this.latitude,
    required this.longitude,
    required this.generationTimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentWeatherUnits,
    required this.currentWeather,
  });

  /// JSON 맵으로부터 Weather 인스턴스를 생성하는 팩토리 생성자
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      generationTimeMs: (json['generationtime_ms'] as num).toDouble(),
      utcOffsetSeconds: json['utc_offset_seconds'] as int,
      timezone: json['timezone'] as String,
      timezoneAbbreviation: json['timezone_abbreviation'] as String,
      elevation: (json['elevation'] as num).toDouble(),
      currentWeatherUnits: CurrentWeatherUnits.fromJson(json['current_weather_units']),
      currentWeather: CurrentWeather.fromJson(json['current_weather']),
    );
  }
}

/// 기상 데이터의 단위를 정의하는 클래스
class CurrentWeatherUnits {
  /// 시간 형식 (iso8601)
  final String time;

  /// 간격 단위 (seconds)
  final String interval;

  /// 온도 단위 (°C)
  final String temperature;

  /// 풍속 단위 (km/h)
  final String windspeed;

  /// 풍향 단위 (°)
  final String winddirection;

  /// 낮/밤 구분 코드
  final String isDay;

  /// 날씨 상태 코드 (wmo code)
  final String weathercode;

  CurrentWeatherUnits({
    required this.time,
    required this.interval,
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.isDay,
    required this.weathercode,
  });

  factory CurrentWeatherUnits.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherUnits(
      time: json['time'] as String,
      interval: json['interval'] as String,
      temperature: json['temperature'] as String,
      windspeed: json['windspeed'] as String,
      winddirection: json['winddirection'] as String,
      isDay: json['is_day'] as String,
      weathercode: json['weathercode'] as String,
    );
  }
}

/// 현재 시점의 실제 기상 데이터를 담는 클래스
class CurrentWeather {
  /// 측정 시간
  final String time;

  /// 측정 간격
  final int interval;

  /// 현재 온도
  final double temperature;

  /// 현재 풍속
  final double windspeed;

  /// 현재 풍향
  final int winddirection;

  /// 낮(1)인지 밤(0)인지 여부
  final int isDay;

  /// WMO 날씨 코드
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
      time: json['time'] as String,
      interval: json['interval'] as int,
      temperature: (json['temperature'] as num).toDouble(),
      windspeed: (json['windspeed'] as num).toDouble(),
      winddirection: json['winddirection'] as int,
      isDay: json['is_day'] as int,
      weathercode: json['weathercode'] as int,
    );
  }
}