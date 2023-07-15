import 'package:blooddonationapp/adddetatils.dart';
import 'package:blooddonationapp/updatedetails.dart';
import 'package:blooddonationapp/home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Blood Donation app - using firebase",
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      routes: {
        '/':(context) =>const HomePage(),
        '/addUserDetails':(context)=> AddDetatils(),
        '/updateDetails' : (context) => UpdateDetails()
      },
      initialRoute: '/',
    );
  }
}