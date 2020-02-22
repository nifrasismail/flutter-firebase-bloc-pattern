import 'package:flutter/material.dart';
import 'package:flutter_firebase_with_bloc/src/ui/login.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.black,
        primaryColor: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Goals",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.amber,
          elevation: 0.0,
        ),
        body: LoginScreen(),
      ),
    );
  }
}
