// @dart=2.9
import 'package:flutter/material.dart';
import 'package:todoapp/ui/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Color(0xFF60D6B4),
      ),
      home: Home(),
    );
  }
}
