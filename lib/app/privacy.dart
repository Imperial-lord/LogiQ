import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Privacy extends StatefulWidget {
  @override
  _PrivacyState createState() => _PrivacyState();
}

bool _switch_private = false;

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Privacy',
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
        body: Container(
          child: Column(
            children: <Widget>[
              _getHeadingPrivacy(),
              _getCupertinoRows(
                  'Private Profile',
                  FontAwesomeIcons.userSecret,
                  FontAwesomeIcons.toggleOff,
                  Colors.deepPurple,
                  30.0,
                  _switch_private),
              Container(
                color: Colors.black12,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                          'When your profile is private only people who you have approved can view your details (stats, topics, posts, acheivements, followers, etc).',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.varelaRound(
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _getCupertinoRows(String text, IconData faIcon1, IconData faIcon2,
      Color color, double size, bool _switch) {
    return MergeSemantics(
      child: ListTile(
        leading: FaIcon(
          faIcon1,
          color: color,
        ),
        title: Text(
          text,
          textAlign: TextAlign.left,
          style: GoogleFonts.varelaRound(
            fontWeight: FontWeight.w100,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        trailing: CupertinoSwitch(
          value: _switch,
          onChanged: (bool value) {
            setState(() {
              _switch = value;
            });
          },
          activeColor: Colors.lightBlueAccent[700],
        ),
        onTap: () {
          setState(() {
            _switch = !_switch;
          });
        },
      ),
    );
  }

  _getHeadingPrivacy() {
    return Container(
      width: double.infinity,
      color: Colors.black12,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(),
      ),
    );
  }
}
