import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueAccent,
          appBar: AppBar(
            backgroundColor: Colors.amber.shade900,
            title: const Text("I am Rich",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const[
                Image(image: AssetImage("images/diamond.png"),
                width: 330,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}