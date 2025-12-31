https://api.open-meteo.com/v1/forecast?latitude=37.57&longitude=126.98&current_weather=true

```json
{
  "latitude": 37.55,
  "longitude": 127,
  "generationtime_ms": 0.0952482223510742,
  "utc_offset_seconds": 0,
  "timezone": "GMT",
  "timezone_abbreviation": "GMT",
  "elevation": 37,
  "current_weather_units": {
    "time": "iso8601",
    "interval": "seconds",
    "temperature": "°C",
    "windspeed": "km/h",
    "winddirection": "°",
    "is_day": "",
    "weathercode": "wmo code"
  },
  "current_weather": {
    "time": "2025-12-31T00:00",
    "interval": 900,
    "temperature": -8.9,
    "windspeed": 7.9,
    "winddirection": 313,
    "is_day": 1,
    "weathercode": 0
  }
}
```