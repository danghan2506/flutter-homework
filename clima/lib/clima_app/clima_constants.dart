import 'package:flutter/material.dart';

const kTempTextStyle =
    TextStyle(fontFamily: 'SpartanMB', fontSize: 100.0, color: Colors.white);

const kMessageTextStyle =
    TextStyle(fontFamily: 'SpartanMB', fontSize: 60.0, color: Colors.white);

const kButtonTextStyle =
    TextStyle(fontSize: 30.0, fontFamily: 'SpartanMB', color: Colors.white);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city, color: Colors.white),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none,
  ),
);

const apiKey = "f8b359076e67c35f773f68548d28465e";
