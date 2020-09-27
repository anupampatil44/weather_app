import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_weather/pages/home.dart';
import 'package:flutter_weather/services/world_weather.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  String inputed;
  WorldWeather obj;


  void updateweather(index)async
  {

      WorldWeather select=WorldWeather(location:inputed);
      await select.getWeather();
      //navigating to home screen with time:
      if(select.cod!=404) {
        func(select);

      }
      else {
        FocusScope.of(context).unfocus();
        Fluttertoast.showToast(
            msg: "Location not found.\nTry searching with a different keyword.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1
        );
      }

    }
    AlertDialog func(WorldWeather select)
    {showDialog(
        context: context,
        builder: (BuildContext context) {
     return AlertDialog(
        title: new Text("Message"),
        content: new Text("Location found!\nView this location?"),
        actions: <Widget>[
          new FlatButton(
            child: new Text("NO"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          new FlatButton(
            child: new Text("YES"),
            onPressed: () {
              obj=WorldWeather(location:inputed);

              FocusScope.of(context).unfocus();
              Navigator.pop(context);
              Navigator.pop(context, {
                'location': select.location,
                'temperature': select.temperature,
                'type': select.type,
                'israin': select.israin,
                'fl': select.fl,
                'humidity': select.humidity,
                'max': select.max,
                'min': select.min,
                'isdrizzle': select.isdrizzle,
                'isclouds': select.isclouds,
                'haze': select.haze,
                'speed':select.speed,
                'deg':select.deg,
                'country':select.country,
              });
            },
          ),
        ],
      );
    });
    }

      @override
      Widget build(BuildContext context) {
        // Create a text controller and use it to retrieve the current value
        // of the TextField.
        final myController = TextEditingController();

        @override
        void dispose() {
          // Clean up the controller when the widget is disposed.
          myController.dispose();
          super.dispose();
        }
        return Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            title: Text('Location Chooser',
              style: TextStyle(
                color: Colors.lightGreenAccent,
              ),),
            backgroundColor: Colors.grey[900],
            centerTitle: true,
          ),
          body:
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              color: Colors.white,
              child: TextField(
                cursorColor: Colors.lightGreenAccent,
                controller:myController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search a city.......',
                  icon: Icon(Icons.search),

                ),

              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
              inputed=myController.text;
              updateweather(inputed);
            },
            child: Icon(Icons.search_sharp),
            backgroundColor: Colors.lightGreen,
          ),

        );
      }
    }

