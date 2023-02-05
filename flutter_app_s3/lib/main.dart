import 'package:flutter/material.dart';
import 'package:flutter_app_s3/login/on_boarding_screen.dart';

import 'login/MyStatefulWidget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'flutter_app';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: OnBoardingScreen(),
      ),
    );
  }
}