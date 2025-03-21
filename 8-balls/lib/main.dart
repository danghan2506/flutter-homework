import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '8 Balls',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const EightBallsApp(),
    );
  }
}

class EightBallsApp extends StatefulWidget {
  const EightBallsApp({super.key});

  @override
  State<EightBallsApp> createState() => _EightBallsAppState();
}

class _EightBallsAppState extends State<EightBallsApp> {
  int currentBall = 5;

  void getBall() {
    setState(() {
      currentBall = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('8 Balls', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        shadowColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.black87),
        child: Center(
          child: TextButton(
            onPressed: getBall,
            child: Image(image: AssetImage("images/ball$currentBall.png")),
          ),
        ),
      ),
    );
  }
}
