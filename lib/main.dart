import 'package:blooddonationapp/home.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Blood Donation app - using firebase",
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      home:const HomePage(),
      routes: {
        '/':(context) => HomePage(),
        
      },
    );
  }
}