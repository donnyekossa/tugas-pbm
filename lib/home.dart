import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double bmi = 0.0;
  String explanation = '';

  bool getBMI() {
    if (weight.text.isNotEmpty &&
        double.parse(weight.text) > 0 &&
        height.text.isNotEmpty &&
        double.parse(height.text) > 0) {
      setState(() {
        bmi = double.parse(weight.text) /
            (pow((double.parse(height.text) / 100), 2));
        if (bmi < 18.5) {
          explanation = "You are too skinny, please eat more foods!";
        } else if (bmi >= 18.5 && bmi <= 24.9) {
          explanation = "You are healthy, please keep it up!";
        } else {
          explanation = "You are overweight, please take some workout!";
        }
      });
      return true;
    } else {
      return false;
    }
  }

  final weight = TextEditingController();
  final height = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(40),
        child: ListView(
          children: [
            Text('Hi, $email',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white)),
            const SizedBox(
              height: 20,
            ),
            const Text('Welcome to',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white)),
            const Text(
              'BMI Calculator',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 40,
            ),
            if (explanation.isNotEmpty)
              const Text(
                'Your BMI result :',
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.end,
              ),
            if (explanation.isNotEmpty)
              Text(
                bmi.toStringAsFixed(2),
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.end,
              ),
            const SizedBox(
              height: 30,
            ),
            if (explanation.isNotEmpty)
              const Text(
                "It means that...",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            if (explanation.isNotEmpty)
              Text(
                explanation,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: height,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(60),
                    ),
                  ),
                  hintText: "Height (cm)",
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white24),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: weight,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(60),
                    ),
                  ),
                  hintText: "Weight (kg)",
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white24),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                final explanation = getBMI();
                if (explanation == false) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please fill all required TextField')));
                }
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(60)),
                width: double.infinity,
                child: Text(
                  'Get BMI',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
