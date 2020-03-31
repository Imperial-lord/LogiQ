import 'package:flutter/painting.dart';
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

String title='Imperial_lord';
String city='Bhubaneswar';
String country='India';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    duration: Duration(milliseconds: 250),
                  ));
            },
            child: Center(
              child: Text(
                'Cancel',
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          title: Container(
            width: double.infinity,
            child: Text(
              'Settings',
              textAlign: TextAlign.center,
              style: GoogleFonts.varelaRound(
                  textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              )),
            ),
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {
                print('Save to DB');
              },
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Save',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
          backgroundColor: Colors.lightBlueAccent[700],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _getHeadingEditProfile(),
              _getProfileRowEditProfile(context),
              _getDividerEditProfile(),
              _getOtherRowsEditProfile('Wallpaper', FontAwesomeIcons.images,
                  FontAwesomeIcons.angleRight, Colors.blueAccent, 15.0),
              _getDividerEditProfile(),
              _getOtherRowsEditProfile(
                name,
                FontAwesomeIcons.userCircle,
                FontAwesomeIcons.angleRight,
                Colors.red[600],
                0.0,
              ),
              _getDividerEditProfile(),
              _getOtherRowsEditProfile(title, FontAwesomeIcons.hatCowboy,
                  FontAwesomeIcons.angleRight, Colors.black87, 15.0),
              _getDividerEditProfile(),
              _getOtherRowsEditProfile(city, FontAwesomeIcons.city,
                  FontAwesomeIcons.angleRight, Colors.black45, 0.0),
              _getDividerEditProfile(),
              _getOtherRowsEditProfile(country, FontAwesomeIcons.streetView,
                  FontAwesomeIcons.angleRight, Colors.green[400], 15.0),
              _getDividerEditProfile(),
              _getOtherRowsEditProfile(
                  'Express Yourself',
                  FontAwesomeIcons.pencilAlt,
                  FontAwesomeIcons.angleRight,
                  Colors.deepOrange,
                  0.0)
            ],
          ),
        ),
      ),
    );
  }

  _getOtherRowsEditProfile(String text, IconData faIcon1, IconData faIcon2,
      Color color, double size) {
    Color color1 = Colors.black26;
    return MergeSemantics(
      child: ListTile(
        onTap: () {
          print('Add corresponding features!');
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

  _getProfileRowEditProfile(BuildContext context) {
    Color color1 = Colors.black26;
    return MergeSemantics(
      child: ListTile(
        onTap: () {
          print('Click to change profile Picture');
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          radius: 18.0,
          backgroundColor: Colors.transparent,
        ),
        title: Text(
          'Profile Pic',
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
          size: 15.0,
        ),
      ),
    );
  }
}

Widget _getHeadingEditProfile() {
  return Container(
    width: double.infinity,
    color: Colors.black12,
    child: Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(),
    ),
  );
}

Widget _getDividerEditProfile() {
  return Container(
    height: 0,
    child: Divider(
      color: Colors.black87,
      indent: 70.0,
    ),
  );
}
