import 'package:flutter/material.dart';

class BmiThemed extends StatelessWidget {
  BmiThemed({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Theme(
        data: ThemeData(
            primaryColor: Color(0xFF0A0E21),
            appBarTheme: AppBarTheme(
                backgroundColor: Color(0xFF0A0E21),
                foregroundColor: Colors.white),
            scaffoldBackgroundColor: Color(0xFF0A0E21),
            textTheme: TextTheme(
                bodyMedium: TextStyle(fontSize: 16.0, color: Colors.white))),
        child: child,
      ),
    );
  }
}
