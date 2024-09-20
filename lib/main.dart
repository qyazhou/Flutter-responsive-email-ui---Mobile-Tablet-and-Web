import 'package:flutter/material.dart';
import 'package:baseball/constants.dart';
import 'package:baseball/screens/main/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'baseball',
      theme: ThemeData(),
      home: MainScreen(),
    );
  }
}
