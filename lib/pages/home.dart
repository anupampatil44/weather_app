
import 'dart:ui';

import 'package:flutter/material.dart';
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    data=data.isNotEmpty? data:ModalRoute.of(context).settings.arguments;
    //print(data);
    Color bg;
    if(data['israin']==true) {
      bg = Colors.blueAccent;
    }
    else if(data['isdrizzle']==true) {
      bg =Colors.lightBlue;
    }
    else if(data['isclouds']==true) {
      bg =Colors.blueGrey;
    }
    else if(data['haze']==true) {
      bg =Colors.grey;
    }

    else{
      bg=Colors.lightGreen;
    }
    return Scaffold(
      backgroundColor: bg,
      body:
      SafeArea(

        child:
        Column(

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,50.0,8.0,8.0),
              child: Center(
                child: Text(data['location'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 9.0,
                    color: Colors.white,
                    fontSize: 55.0,
                  ),),
              ),
            ),
            SizedBox(height: 15.0,),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(165.0, 0.0, 0.0, 0.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.lightGreenAccent,
                    ),
                    Text(data["country"],
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.grey[350],
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                      ),),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15.0,),
            Text(data['type'],
            style: TextStyle(
              fontSize: 50.0,
              letterSpacing: 3.0,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),),
            Center(
              child: Text(
                data['temperature']+" °C" ,

                style: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 75.0,
                ),),
            ),
          Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(65.0,80.0,12.0,10.0),
            child: Text("Feels Like",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.amberAccent,
              fontSize: 16.0,
            ),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(120.0,80.0,12.0,10.0),
            child: Text("Humidity",
            style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.orangeAccent,
              fontSize: 16.0,
            ),),
          )
        ],
    ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(80.0,0.5,12.0,10.0),
                  child: Text(data['fl']+" °C",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14.0
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(160.0,0.5,12.0,10.0),
                  child: Text(data['humidity']+"%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14.0,
                    ),),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(59.0,20.0,12.0,5.0),
                  child: Text("Max. Temp.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                      fontSize: 16.0,
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(107.0,20.0,12.0,5.0),
                  child: Text("Min. Temp.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                      fontSize: 16.0,
                    ),),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(80.0,5.0,12.0,10.0),
                  child: Text(data['max']+" °C",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14.0,
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(160.0,10.0,12.0,10.0),
                  child: Text(data['min']+" °C",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14.0,
                    ),),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(56.0,20.0,12.0,10.0),
                  child: Text("Wind Speed",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.limeAccent,
                      fontSize: 15.0,
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(105.0,20.0,12.0,10.0),
                  child: Text("Wind Direction",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellowAccent,
                      fontSize: 15.0,
                    ),),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(66.0,1.0,12.0,10.0),
                  child: Text(data['speed']+" mph",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14.0,
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(160.0,1.0,12.0,10.0),
                  child: Text(data['deg']+" °",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14.0,
                    ),),
                )
              ],
            ),
          ],
        ),

      ),
        floatingActionButton:FloatingActionButton(
          onPressed: ()async{
            dynamic result= await Navigator.pushNamed(context, '/choose_location');
            setState(() {
              data={
                'location':result['location'],
                'temperature':result['temperature'],
                'israin':result['israin'],
                'type':result['type'],
                'fl':result['fl'],
                'humidity':result['humidity'],
                'max':result['max'],
                'min':result['min'],
                'isdrizzle':result['isdrizzle'],
                'isclouds':result['isclouds'],
                'haze':result['haze'],
                'speed':result['speed'],
                'deg':result['deg'],
                'country':result['country'],
              };
            });
          },
          child: Icon(Icons.edit_location,
            color: Colors.redAccent,),
          backgroundColor: Colors.lightGreenAccent,

        )
    );
  }
}
