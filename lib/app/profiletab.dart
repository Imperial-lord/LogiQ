import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inquestoflogic/app/screen1.dart';
import 'package:inquestoflogic/app/editprofile.dart';
import 'package:percent_indicator/percent_indicator.dart';

double quesComplete = 0.4;
String complete = quesComplete.toString();
int goldCoins = 10, silverCoins = 20, bronzeCoins = 30;
String gold = goldCoins.toString();
String silver = silverCoins.toString();
String bronze = bronzeCoins.toString();
int rank = 200;
String rankString = rank.toString();

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
          child: Column(
        children: <Widget>[
          _getWallpaperandProfile(),
          _getBadgesAndCompletion(),
          _getOverallRank(),
          _getChallenges(),
          _getShareWithFriend(),
        ],
      )),
    );
  }

  _getWallpaperandProfile() {
    return Card(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(3.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: <Widget>[
          Container(
            height: 150.0,
            width: double.infinity,
            child: Image(
              image: AssetImage(
                'assets/images/mainback.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              left: 20.0,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                backgroundColor: Colors.transparent,
                radius: 50.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  FaIcon(
                    FontAwesomeIcons.crown,
                    color: Colors.lightBlueAccent[700],
                    size: 20.0,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.varelaRound(
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          width: 170.0,
                          height: 0.5,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        name,
                        style: GoogleFonts.varelaRound(
                          fontWeight: FontWeight.normal,
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        city + ', ' + country,
                        style: GoogleFonts.varelaRound(
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getBadgesAndCompletion() {
    return Card(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(3.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1.0, -1.0),
                end: Alignment(1.0, 1.0),
                colors: [Colors.white, Colors.white],
              ),
            ),
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your Progress : \nQuestions Attempted',
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                        color: Colors.lightBlueAccent[700],
                      ),
                    ),
                  ),
                  LinearPercentIndicator(
                    percent: quesComplete,
                    progressColor: Colors.lightBlueAccent[700],
                    backgroundColor: Colors.grey[300],
                    leading: FaIcon(
                      FontAwesomeIcons.graduationCap,
                      color: Colors.lightBlueAccent[700],
                    ),
                    trailing: Text(
                      complete,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                        color: Colors.lightBlueAccent[700],
                      ),
                    ),
                  ),
                  Center(child: _getDividerProfileTab(30.0, 30.0)),
                  Row(
                    children: <Widget>[
                      Text(
                        'Badges Earned :',
                        style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                          color: Colors.lightBlueAccent[700],
                        ),
                      ),
                      Spacer(),
                      _getCoins(Color(0xFFffd700), gold),
                      Spacer(),
                      _getCoins(Color(0xFFc0c0c0), silver),
                      Spacer(),
                      _getCoins(Color(0xFFcd7f32), bronze),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }

  _getOverallRank() {
    return Card(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(3.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1.0, -1.0),
              end: Alignment(1.0, 1.0),
              colors: [Colors.white, Colors.white],
            ),
          ),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Text(
                'Overall Rank',
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.normal,
                  fontSize: 15.0,
                  color: Colors.lightBlueAccent[700],
                ),
              ),
              _getDividerProfileTab(30.0, 30.0),
              Text(
                rankString,
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.normal,
                  fontSize: 40.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getChallenges() {
    return Card(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(3.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1.0, -1.0),
              end: Alignment(1.0, 1.0),
              colors: [Colors.white, Colors.white],
            ),
          ),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Text(
                'Challenges',
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.normal,
                  fontSize: 15.0,
                  color: Colors.lightBlueAccent[700],
                ),
              ),
              _getDividerProfileTab(30.0, 30.0),
              Padding(
                padding: EdgeInsets.only(bottom: 50.0),
                child: Text(
                  'There are no available challenges at this moment',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.normal,
                    fontSize: 13.0,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getShareWithFriend() {
    return Card(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(3.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-1.0, -1.0),
              end: Alignment(1.0, 1.0),
              colors: [Colors.white, Colors.white],
            ),
          ),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Text(
                'Invite and play with friends',
                textAlign: TextAlign.left,
                style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.normal,
                  fontSize: 15.0,
                  color: Colors.lightBlueAccent[700],
                ),
              ),
              _getDividerProfileTab(30.0, 30.0),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: FaIcon(
                    FontAwesomeIcons.userPlus,
                    size: 30.0,
                    color: Colors.black54,
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



Widget _getDividerProfileTab(double indent, double endIndent) {
  return Divider(
    color: Colors.lightBlueAccent[700],
    indent: indent,
    endIndent: endIndent,
  );
}

Widget _getCoins(Color color, String count) {
  return Row(
    children: <Widget>[
      FaIcon(
        FontAwesomeIcons.gem,
        color: color,
        size: 18.0,
      ),
      Padding(
        padding: EdgeInsets.all(5.0),
        child: Text(
          count,
          textAlign: TextAlign.center,
          style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.normal,
            fontSize: 14.0,
            color: Colors.lightBlueAccent[700],
          ),
        ),
      ),
    ],
  );
}
