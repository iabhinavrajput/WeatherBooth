import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cityName = ["Mumbai", "Delhi", "Chennai", "Jaipur", "Indore"];
    final random = Random();
    var city = cityName[random.nextInt(cityName.length)];
    Map info = ModalRoute.of(context)?.settings.arguments as Map;
    String temp = ((info['tempValue']).toString());
    String air = ((info['airSpeedValue']).toString());
    if (temp == "NA") {
    } else {
      temp = ((info['tempValue']).toString()).substring(0, 4);
      air = ((info['airSpeedValue']).toString()).substring(0, 4);
    }
    String icon = info['iconValue'];
    String getCity = info['cityValue'];
    String hum = info['humValue'];
    String des = info['desValue'];
    return Scaffold(
        resizeToAvoidBottomInset: false, // to avoid the keyboard overflow
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: Colors.blue.shade400,
          ),
        ),
        body: SafeArea(
          // creating the gradient
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.blue.shade800,
                  Colors.blue.shade300,
                ])),
            child: Column(
              children: [
                // creating the search bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if ((searchController.text).replaceAll(" ", "") ==
                              "") {
                          } else {
                            Navigator.pushReplacementNamed(context, '/loading',
                                arguments: {
                                  "searchText": searchController.text,
                                });
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(3, 0, 7, 0),
                          child: const Icon(
                            Icons.search,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Expanded(
                          child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: "Search $city", border: InputBorder.none),
                      ))
                    ],
                  ),
                ),
                // creatind the first Box for showing the location name
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14.0)),
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.network(
                                "https://openweathermap.org/img/wn/$icon@2x.png"),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  des,
                                  style: const TextStyle(
                                      fontSize: 21.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "In $getCity",
                                  style: const TextStyle(
                                      fontSize: 21.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // creating the second box for showing the temperature
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14.0)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 110.0,
                                ),
                                Text(
                                  temp,
                                  style: const TextStyle(fontSize: 60.0),
                                ),
                                const Text(
                                  "°c",
                                  style: TextStyle(fontSize: 60.0),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // creating the third box for the humidity and wind speed
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14.0)),
                        margin: const EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 0.0),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Icon(WeatherIcons.day_windy)],
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            Text(
                              air,
                              style: const TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                            ),
                            const Text("Kmph")
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14.0)),
                        margin: const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Icon(WeatherIcons.humidity)],
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            Text(
                              hum,
                              style: const TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                            ),
                            const Text("Percent")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                const Text("Made By Abhinav", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),),
              ],
            ),
          ),
        ));
  }
}
