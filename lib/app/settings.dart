import 'package:inquestoflogic/app/privacy.dart';
import 'package:inquestoflogic/app/aboutus.dart';
import 'package:inquestoflogic/app/editprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:inquestoflogic/app/screen1.dart';
import 'package:inquestoflogic/login_signup/google.dart';
import 'package:inquestoflogic/login_signup/welcome.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

bool _switch_sound = false;
bool _switch_music = false;
bool _switch_vib = false;

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: FaIcon(
              FontAwesomeIcons.chevronCircleLeft,
              color: Colors.white,
            ),
            onPressed: () {
              print('Back to screen1');
              Navigator.pop(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      ));
            },
          ),
          title: Text(
            'Settings',
            textAlign: TextAlign.center,
            style: GoogleFonts.varelaRound(
                textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            )),
          ),
          backgroundColor: Colors.lightBlueAccent[700],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _getHeadingSettings('APP SETTINGS'),
              _getCupertinoRows(
                  'Sound Effects',
                  FontAwesomeIcons.volumeUp,
                  FontAwesomeIcons.toggleOff,
                  Colors.yellow[600],
                  30.0,
                  _switch_sound),
              _getDividerSettings(),
              _getCupertinoRows(
                  'In-Game Music',
                  FontAwesomeIcons.music,
                  FontAwesomeIcons.toggleOff,
                  Colors.green[600],
                  30.0,
                  _switch_music),
              _getDividerSettings(),
              _getCupertinoRows(
                  'Vibrations',
                  Icons.vibration,
                  FontAwesomeIcons.toggleOff,
                  Colors.purple[500],
                  30.0,
                  _switch_vib),
              _getHeadingSettings('ACCOUNT'),
              _getProfileRowSettings(context),
              _getDividerSettings(),
              _getOtherRowsSettings(
                  'Privacy',
                  FontAwesomeIcons.unlock,
                  FontAwesomeIcons.angleRight,
                  Colors.deepOrange,
                  20.0,
                  context),
              _getHeadingSettings('OTHER'),
              _getOtherRowsSettings(
                  'About',
                  FontAwesomeIcons.infoCircle,
                  FontAwesomeIcons.angleRight,
                  Colors.blueAccent[700],
                  20.0,
                  context),
              _getDividerSettings(),
              _getOtherRowsSettings('Logout', FontAwesomeIcons.doorOpen,
                  FontAwesomeIcons.angleRight, Colors.black54, 0.0, context),
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

  _getOtherRowsSettings(String text, IconData faIcon1, IconData faIcon2,
      Color color, double size, BuildContext context) {
    Color color1 = Colors.black26;
    return MergeSemantics(
      child: ListTile(
        onTap: () {
          print('Add Navigation Here!');
          if (text == 'Privacy') {
            Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.leftToRight,
                  child: Privacy(),
                ));
          } else if (text == 'About') {
            Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.leftToRight,
                  child: AboutUs(),
                ));
          }
          else if (text == 'Logout') {
            signOutGoogle();
            Navigator.push(context, PageTransition(
                type: PageTransitionType.fade, child: WelcomeScreen()));
          }
        },
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
        trailing: FaIcon(
          faIcon2,
          color: color1,
          size: size,
        ),
      ),
    );
  }

  _getProfileRowSettings(BuildContext context) {
    Color color1 = Colors.black26;
    return MergeSemantics(
      child: ListTile(
        onTap: () {
          print('Add Profile Nav here!');
          Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.leftToRight,
                child: EditProfile(),
              ));
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          radius: 18.0,
          backgroundColor: Colors.transparent,
        ),
        title: Text(
          'Edit Profile',
          textAlign: TextAlign.left,
          style: GoogleFonts.varelaRound(
            fontWeight: FontWeight.w100,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        trailing: FaIcon(
          FontAwesomeIcons.angleRight,
          color: color1,
          size: 20.0,
        ),
      ),
    );
  }
}

Widget _getHeadingSettings(String text) {
  return Container(
    width: double.infinity,
    color: Colors.black12,
    child: Padding(
      padding:
          EdgeInsets.only(top: 15.0, bottom: 15.0, right: 20.0, left: 20.0),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: GoogleFonts.varelaRound(
          fontWeight: FontWeight.w100,
          fontSize: 18,
          color: Colors.black54,
        ),
      ),
    ),
  );
}

Widget _getDividerSettings() {
  return Container(
    height: 0,
    child: Divider(
      color: Colors.black87,
      indent: 70.0,
    ),
  );
}
