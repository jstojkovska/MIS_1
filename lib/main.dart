import 'package:flutter/material.dart';
import 'package:mis_lab1/screens/details.dart';
import 'package:mis_lab1/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити - 223064',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent)
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(title: "Распоред за испити - 223064"),
        "/details": (context) => DetailsPage(),
      },
    );
  }
}
