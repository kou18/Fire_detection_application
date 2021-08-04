import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stage_prototype/LoginScreen.dart';
import 'LoginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StageApp',
      home: LoginScreen(),
    );
  }
}



