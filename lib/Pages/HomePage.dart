import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Pages/WeatherPages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Lottie.network(
                  "https://assets8.lottiefiles.com/private_files/lf30_jmgekfqg.json",
                ),
              ),
              Padding(
                padding: context.paddingMedium,
                child: Text(
                  "Weather App",
                  style: TextStyle(
                      fontSize: context.mediumValue,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: context.paddingMedium,
                child: FloatingActionButton(
                  backgroundColor: Colors.blue[300],
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage2()));
                  },
                  child: Icon(Icons.arrow_forward),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
