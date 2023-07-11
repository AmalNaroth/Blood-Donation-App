import 'package:blooddonationapp/adddetatils.dart';
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
      routes: {
        '/':(context) =>const HomePage(),
        '/addUserDetails':(context)=> AddDetatils(),
      },
      initialRoute: '/',
    );
  }
}