import 'package:flutter/material.dart';
import 'package:inquestoflogic/login_signup/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = 'LogiQ';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      home: Scaffold(
        body: SplashScreen(), //--> this is our ongoing project
      ),
    );
  }
}
