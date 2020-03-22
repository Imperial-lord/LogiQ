import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:inquestoflogic/login.dart';
import 'package:inquestoflogic/join.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';


class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  _MyPageViewState createState() {
    return new _MyPageViewState();
  }
}


class _MyPageViewState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  static const _colors = <Color>[
    Color.fromRGBO(213, 0, 0, 0.6),
    Color.fromRGBO(49, 27, 146, 0.6),
    Color.fromRGBO(130, 119, 23, 0.6),
  ];

  static const _images = <String>[
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image1.jpg',
  ];

  static const _quotes = <String>[
    'Logic based questions that get you focussed',
    'Get your friends in and have even more fun',
    'Climb the ladder and standout as a winner',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future(()=>SystemChannels.platform.invokeMethod<bool>('SystemNavigator.pop'));
      },
      child: Material(
        child: Container(
          child: Stack(
            children: <Widget>[
              _buildPageView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: ButtonTheme(
                  minWidth: double.infinity,
                  height: 50.0,
                  child: FlatButton(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    child: Text(
                      'Have an account? Log in',
                      style: GoogleFonts.varelaRound(
                          textStyle: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LogIn()));
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 190.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                    color: Colors.white,
                    height: 85.0,
                    width: 85.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 270.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'LogiQ',
                    style: GoogleFonts.varelaRound(
                        textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 55.0,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 130.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Join()));
                    },
                    textColor: Colors.black87,
                    child: Text(
                      'Join Now',
                      style: GoogleFonts.varelaRound(
                          textStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ),
                ),
              ),
              _buildDotPagination(),
            ],
          ),
        ),
      ),
    );
  }

  _buildPageView() {
    return Container(
      child: PageView.builder(
        itemCount: 3,
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          return getPageWidget(_colors[index], _quotes[index], _images[index]);
        },
        onPageChanged: (int index) {
          _currentPageNotifier.value = index;
        },
      ),
    );
  }

  _buildDotPagination() {
    return Padding(
      padding: EdgeInsets.only(bottom: 60.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: CirclePageIndicator(
          itemCount: 3,
          currentPageNotifier: _currentPageNotifier,
          selectedDotColor: Colors.white,
          selectedSize: 10.0,
        ),
      ),
    );
  }
}

Widget getPageWidget(Color color, String text, String images) {
  return Stack(
    children: <Widget>[
      Container(
        height: double.infinity,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(color, BlendMode.darken),
            child: Image(
              image: AssetImage(images),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 200.0),
          child: Container(
            width: 270.0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                )),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
