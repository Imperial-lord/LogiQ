import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inquestoflogic/welcome.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inquestoflogic/google.dart';
import 'package:inquestoflogic/first_screen.dart';
import 'package:inquestoflogic/facebook.dart';

final _text = <String>['Sign in with Facebook', 'Sign in with Google'];

final Widget facebookIcon = FaIcon(
  FontAwesomeIcons.facebook,
  color: Colors.blue[900],
);

final Widget googleIcon = FaIcon(
  FontAwesomeIcons.google,
  color: Colors.red,
);

final _icons = <FaIcon>[
  facebookIcon,
  googleIcon,
];

class Join extends StatefulWidget {
  @override
  _JoinState createState() => _JoinState();
}

class _JoinState extends State<Join> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen())));
      },
      child: Material(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              Color.fromRGBO(230, 81, 0, 0.7),
                              BlendMode.darken),
                          child: Image(
                            image: AssetImage('assets/images/join.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 350.0),
                        child: Container(
                          width: 270.0,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              'Technothlon brings for you an experience that will leave you enthralled. Let logic alone thrive',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              )),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 150.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Here we are!',
                    style: GoogleFonts.varelaRound(
                        textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                ),
              ),
              _getRaisedButtonContents(
                  _text[0], _icons[0], context, 210.0, Colors.blue[900]),
              _getRaisedButtonContents(
                  _text[1], _icons[1], context, 160.0, Colors.black54),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 110.0),
                  child: Container(
                    width: 270.0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "We'll never post anything without your permission",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.varelaRound(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getRaisedButtonContents(String text, FaIcon faIcon,
      BuildContext context, double padding, Color color) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RaisedButton.icon(
            onPressed: () {
              if(text=='Sign in with Google') {
                signInWithGoogle().whenComplete(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return FirstScreen();
                      },
                    ),
                  );
                });
              }
              else{
                print('To integrate Firebase Log In with FB');
                signInWithFacebook().whenComplete(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return FirstScreen();
                      },
                    ),
                  );
                });
              }
            },
            color: Colors.white,
            icon: faIcon,
            label: Container(
              width: 200.0,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.varelaRound(
                    textStyle: TextStyle(
                  color: color,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                )),
              ),
            )),
      ),
    );
  }
}
