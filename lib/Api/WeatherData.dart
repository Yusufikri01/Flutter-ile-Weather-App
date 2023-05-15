import 'dart:convert';
import 'package:weather_app/Api/WeatherService.dart';
import 'package:http/http.dart' as http;

class WeatherData {
  Future<Weather> getData(var latitude, var longitude) async {
    var uricall = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=4ddea6a296b34b9daf0195735231205&q=$latitude,$longitude&aqi=no");

    var response = await http.get(uricall);
    var body = await jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
