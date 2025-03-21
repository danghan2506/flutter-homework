import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text("Mi Card"),
          backgroundColor: Colors.teal.shade700,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("images/spiderboi.jpg"),
                  radius: 50
                ),
                SizedBox(height: 10),
                Text(
                  "Dang Cong Gia Han",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Meslo",
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Student",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal.shade100,
                    letterSpacing: 2.5,
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  elevation: 5, // Thêm đổ bóng
                  child: ListTile(
                    leading: Icon(Icons.phone, color: Colors.teal,),
                    title: Text(
                      "0775486899",
                      style: TextStyle(
                        fontFamily: "Meslo",
                        color: Colors.teal.shade900,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  elevation: 5, // Thêm đổ bóng
                  child: ListTile(
                    leading: Icon(Icons.email, color: Colors.teal),
                    title: Text(
                      "danghan1213@gmail.com",
                      style: TextStyle(
                        fontFamily: "Meslo",
                        color: Colors.teal.shade900,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}