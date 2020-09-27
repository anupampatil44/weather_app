import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import "package:flutter_weather/services/world_weather.dart";

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {


  String l='Pune';
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/load.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0,300.0,0.0,0.0),
          child: Center(
            child: Column(
              children: [
                SpinKitWave(
                  color: Colors.white,
                  size:50.0,
                ),
                  Text("Weather App",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0
                  ),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setupWeather()async {
    try {

      WorldWeather instance = WorldWeather(location: l);
      await instance.getWeather();
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'temperature': instance.temperature,
        'type': instance.type,
        'israin': instance.israin,
        'fl': instance.fl,
        'humidity': instance.humidity,
        'max': instance.max,
        'min': instance.min,
        'isdrizzle': instance.isdrizzle,
        'isclouds': instance.isclouds,
        'haze': instance.haze,
        'speed': instance.speed,
        'deg': instance.deg,
        'country': instance.country,
      });
    }
    catch (e) {
      Navigator.pushReplacementNamed(context, '/chooselocation');
    }
  }



  @override
  void initState() {
    super.initState();
    setupWeather();
  }
}