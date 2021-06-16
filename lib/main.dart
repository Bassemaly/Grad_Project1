import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:grad_project/Screens/HomePage.dart';
import 'package:grad_project/Screens/LogIn.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/Models/ModelCategory.dart';
import 'package:grad_project/Models/ModelProducts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LogIn());
  }
}
