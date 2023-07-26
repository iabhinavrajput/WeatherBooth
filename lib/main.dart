import 'package:flutter/material.dart';
import 'package:weather_booth/Activity/home.dart';
import 'package:weather_booth/Activity/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => const Loading(), // Default Route
      "/home": (context) => const Home(),
      "/loading": (context) => const Loading(),
    },
  ));
}
