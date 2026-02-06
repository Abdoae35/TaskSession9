import 'package:counter_app/bmi/page/bmi_screen.dart';
import 'package:counter_app/counter/counter_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bmiCalculatorScreen(),
    );
  }
}
