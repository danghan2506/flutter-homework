import 'package:flutter/material.dart';
import 'quizzler_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuizzlerApp(),
    );
  }
}
