import 'package:flutter/material.dart';
import 'package:inquestoflogic/splash.dart';

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
        body: SplashScreen(),
      ),
    );
  }
}
