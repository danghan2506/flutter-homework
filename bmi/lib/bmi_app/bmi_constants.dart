import 'package:flutter/material.dart';

const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

final kLargeButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Color(0xFFEB1555),
  minimumSize: Size(double.infinity, 50.0),
  shape: LinearBorder(),
  padding: EdgeInsets.symmetric(vertical: 20.0),
);

const kLargeButtonTextStyle =
    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white);

const kLabelTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));

const kNumberTextStyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);

const kResultTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold);

const kBodyTextStyle = TextStyle(fontSize: 22.0);
