class Weather {
  String? cityName;
  var temp;
  var wind;
  var feelslike;
  var uv;
  var pressure;
  var country;

  Weather(
      {required this.cityName,
      required this.temp,
      required this.wind,
      required this.feelslike,
      required this.uv,
      required this.pressure,
      required this.country});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["location"]["name"];
    temp = json["current"]["temp_c"];
    wind = json["current"]["wind_kph"];
    pressure = json["current"]["pressure_mb"];
    feelslike = json["current"]["feelslike_c"];
    uv = json["current"]["uv"];
    country = json["location"]["country"];
  }
}
