import 'dart:convert';
import 'package:http/http.dart';

class Worker {
  //constructor of the location
  String location = "";
  Worker({required this.location}) {
    location = location;
  }
  String temp = "";
  String humidity = "";
  String airSpeed = "";
  String description = "";
  String main = "";
  String icon = "";

  // method
  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=70f7b9919d3bb6a414d40dad4620d61f"));
      Map data = jsonDecode(response.body);
      // print(data);
      // getting the temperature and humudity
      Map tempData = data["main"];
      double getTemp = tempData["temp"] - 273.15;
      String getHumidity = tempData["humidity"].toString();

      // getting the airSpeed
      Map wind = data["wind"];
      double getAirSpeed = wind["speed"] / 0.27777777777778;

      // getting the description
      List weatherData = data["weather"];
      Map weatherMainData = weatherData[0];
      String getMainDes = weatherMainData["main"];
      String getDesc = weatherMainData["description"];

      // assigning the vclues
      temp = getTemp.toString();
      humidity = getHumidity;
      airSpeed = getAirSpeed.toString();
      description = getDesc;
      main = getMainDes;
      icon = weatherMainData["icon"].toString();
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      airSpeed = "NA";
      description = "NA";
      main = "NA";
      icon = "50d";
    }
  }
}
