import 'package:app/home.dart';
import 'package:app/logindanregister.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
      routes: {
        '/login': (context) => Login(),
        '/home': (context) => const Home(),
      },
    );
  }
}
