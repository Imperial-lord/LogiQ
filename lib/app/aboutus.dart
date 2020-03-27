import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

String text1 =
    'Technothlon is an international school championship organized by the student fraternity of IIT Guwahati. Technothlon began in 2004 in a small room with an aim to "Inspire Young Minds". Starting on our journey with a participation of 200 students confined to the city of Guwahati, over the past 15 years we have expanded our reach to over 400 cities all over India and various centers abroad.';
String text2 =
    'LogiQ brought to you by Techothlon, is an attempt to provide an open paltform for everyone to come and experience logic and analytical thinking, that we promote and stand for! Hope you have a great time playing the quizzes.';
String text3 = '<To register or learn more about us, pay us a visit here>';

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'About Us',
                textAlign: TextAlign.center,
                style: GoogleFonts.varelaRound(
                    textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                )),
              ),
            ),
            backgroundColor: Colors.lightBlueAccent[700],
          ),
          body: Column(
            children: <Widget>[
              _getContentAbout(text1),
              _getHeadingAbout(),
              Image(
                image: AssetImage('assets/images/about.png'),
                fit: BoxFit.cover,
              ),
              _getHeadingAbout(),
              _getContentAbout(text2),
              InkWell(
                child: _getContentAbout(text3),
                onTap: _launchURL,
              ),
              Align(
                child: _getContentAbout(
                    'Copyright © 2019 - 2020 Technothlon. All rights reserved.'),
                alignment: Alignment.bottomCenter,
              ),
            ],
          )),
    );
  }

  _launchURL() async {
    const url = 'https://technothlon.techniche.org';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _getHeadingAbout() {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(),
      ),
    );
  }

  _getContentAbout(String text) {
    Color color;
    if(text==text3)
      color=Colors.blueAccent;
    else
      color=Colors.black;
    return Container(
      child: Column(
        children: <Widget>[
          _getHeadingAbout(),
          Container(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.varelaRound(
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                    color: color,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
