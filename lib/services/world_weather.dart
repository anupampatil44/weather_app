import 'package:http/http.dart';
import 'dart:convert';
class WorldWeather{
  String location;//location name for ui
   //location url for api endpoints
  String temperature="0";
  String type="NA";
  bool israin;
  Map weather;
  String fl="NA";
  String humidity="NA";
  String max="NA";
  String min="NA";
  bool isdrizzle;
  bool isclouds;
  bool haze;
  int cod;
  String speed="NA";
  String deg="NA";
  String country="NA";
  bool err;
  WorldWeather({this.location});

  Future<void> getWeather()async {

    try{
      Response response=await get('http://api.openweathermap.org/data/2.5/weather?q=$location&APPID=a8ae0ac4a48496b6ab71dbe606e28e17');
      Map data= jsonDecode(response.body);


      location= data["name"];
      temperature=((data['main']['temp']-273).round()).toString();
      weather=data['weather'][0];
      type=weather['main'];
      fl=((data['main']['feels_like']-273).round()).toString();
      humidity=data['main']['humidity'].toString();
      max=((data['main']['temp_max']-273).round()).toString();
      min=((data['main']['temp_min']-273).round()).toString();
      israin=type=="Rain"?true:false;
      isdrizzle=type=="Drizzle"?true:false;
      isclouds=type=="Clouds"?true:false;
      haze=type=="Haze"?true:false;
      cod=data["cod"];
      speed=data["wind"]["speed"].toString();
      deg=data["wind"]["deg"].toString();
      country=data["sys"]["country"];
    }

    catch(e){
      print("Caught Error: $e");
      //time="couldn't get data";
      temperature='Error';
      israin=false;
      isdrizzle=false;
      location="Error in fetching data.";
      type="Error";
      max="Error";
      min="Error";
      fl="Error";
      deg="0";
      speed="0";
      country="NA";
      isclouds=false;
      weather={};
      haze=false;
      cod=404;
      err=true;
    }



  }

}

