import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inquestoflogic/login_signup/welcome.dart';
import 'package:inquestoflogic/login_signup/google.dart';
import 'package:inquestoflogic/login_signup/facebook.dart';
import 'package:flutter/cupertino.dart';
import 'package:inquestoflogic/app/settings.dart';
import 'package:page_transition/page_transition.dart';

var type;
String imageUrl;
String name;
String email;

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (type == 'google') {
      imageUrl = g_imageUrl;
      name = g_name;
      email = g_email;
    } else {
      imageUrl = f_imageUrl;
      name = f_name;
      email = f_email;
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: FaIcon(
              FontAwesomeIcons.cogs,
              color: Colors.white,
            ),
            onPressed: () {
              print('Settings button');
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      duration: Duration(milliseconds: 500),
                      child: Settings()));
            },
          ),
          title: Text(
            'LogiQ',
            textAlign: TextAlign.center,
            style: GoogleFonts.varelaRound(
                textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            )),
          ),
          backgroundColor: Colors.lightBlueAccent[700],
          actions: <Widget>[
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.search,
                color: Colors.white,
              ),
              onPressed: () {
                print('Search Topics');
              },
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.calendar,
                color: Colors.white,
              ),
              onPressed: () {
                print('Calendar Icon');
              },
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Center(
            child: Image(
              image: AssetImage('assets/images/logo.png'),
              width: 40,
              height: 40,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.lightBlueAccent[700],
          elevation: 20.0,
          onPressed: () {
            print('Technothlon Logo');
          },
        ),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          color: Colors.lightBlueAccent[700],
          shape: CircularNotchedRectangle(),
          child: Material(
            child: SizedBox(
              width: double.infinity,
              height: 50.0,
              child: new DefaultTabController(
                length: 2,
                child: new TabBar(
                  indicatorColor: Colors.lightBlueAccent[700],
                  labelColor: Colors.lightBlueAccent[700],
                  labelStyle: GoogleFonts.varelaRound(
                    fontWeight: FontWeight.normal,
                  ),
                  tabs: <Widget>[
                    new Tab(
                      text: 'Profile',
                    ),
                    new Tab(
                      text: 'Topics',
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Container(),
      ),
    );
  }
}
