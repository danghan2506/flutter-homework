import 'package:flutter/material.dart';
import 'package:bmi_app/bmi_app/input_screen.dart';

void main() {
  runApp(const BmiApp());
}

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark(),
      home: const BmiInputScreen(),
    );
  }
}
