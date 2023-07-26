// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_booth/Worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String temp = "";
  String hum = "";
  String airSpeed = "";
  String des = "";
  String main = "";
  String icon = "";
  String city = "Jaipur";
  // creating the instance of the worker
  void startApp(String city) async {
    Worker instance = Worker(location: city);
    await instance.getData();
    temp = instance.temp;
    hum = instance.humidity;
    airSpeed = instance.airSpeed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "tempValue": temp,
        "humValue": hum,
        "airSpeedValue": airSpeed,
        "desValue": des,
        "mainValue": main,
        "iconValue": icon,
        "cityValue": city,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;
    if (search != null && search.isNotEmpty) {
      city = search['searchText'];
    }
    startApp(city);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/wBLogo.png',
              height: 140.0,
              width: 240.0,
            ),
            const Text("Weather Booth",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Made By Abhinav",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 30,
            ),
            const SpinKitWaveSpinner(
              color: Colors.blue,
              size: 50.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.amber[200],
    );
  }
}
