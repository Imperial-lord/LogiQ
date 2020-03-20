import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:inquestoflogic/welcome.dart';

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => NextScreen())));

    return SplashScreenContent();
  }
}

class SplashScreenContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.0, -1.0),
            end: Alignment(1.0, 1.0),
            colors: [Colors.black, Colors.blue],
          )),
      child: Center(
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 200.0),
            child: Image(
              image: AssetImage('assets/images/logo.png'),
              color: Colors.white,
              height: 150.0,
              width: 150.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              'LogiQ',
              style: GoogleFonts.varelaRound(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,
                    fontWeight: FontWeight.normal,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 150.0),
            child: LoadingJumpingLine.circle(
              size: 40,
              backgroundColor: Colors.white,
            ),
          ),
        ]),
      ),
    );
  }
}

