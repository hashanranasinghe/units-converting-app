import 'package:flutter/material.dart';
import 'package:units_conversions/screens/covertingscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ConvertingScreen(),
    );
  }
}


