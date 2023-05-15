import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:weather_app/Widget/ContainerProporties.dart';
import 'package:weather_app/Api/WeatherData.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  WeatherData client = WeatherData();
  final controller = TextEditingController();

  Future<dynamic> info() async {
    // var position = await GetPosition();   // Telofonun gps'i üzerinden latitude ve longitude değerlerini almak için kullanılır
    var data = await client.getData("41.00", "28.97");
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.center,
            fit: BoxFit.cover,
            image: AssetImage('assets/bulut.jpg'),
          ),
        ),
        child: FutureBuilder(
          future: info(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: context.paddingHigh,
                      child: Text(
                        "${snapshot.data?.cityName},${snapshot.data?.country}",
                        style: TextStyle(
                            fontSize: context.mediumValue, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: context.paddingMedium,
                      child: Text(
                        "${snapshot.data?.temp}°C",
                        style: TextStyle(
                          fontSize: context.highValue,
                          color: Colors.blue[300],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContainerPro("WIND", snapshot.data?.wind,
                                Icons.wind_power_outlined),
                            ContainerPro("PRESSURE", snapshot.data?.pressure,
                                Icons.compress),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContainerPro(
                                "UV", snapshot.data?.uv, Icons.light_mode),
                            ContainerPro("FEELSLİKE", snapshot.data?.feelslike,
                                Icons.heat_pump_outlined),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
        ),
      ),
    );
  }
}
