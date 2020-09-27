import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather/pages/home.dart';
import 'package:flutter_weather/pages/loading.dart';
import 'package:flutter_weather/pages/choose_location.dart';
void main() {

    runApp(MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => loading(),
        '/home': (context) => home(),
        '/choose_location': (context) => ChooseLocation(),
      },
    ));

}


