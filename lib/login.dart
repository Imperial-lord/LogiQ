import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inquestoflogic/facebook.dart';
import 'package:inquestoflogic/welcome.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:inquestoflogic/join.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inquestoflogic/google.dart';
import 'package:inquestoflogic/first_screen.dart';

final _text = <String>['Log In with Facebook', 'Log In with Google'];

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

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
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
                            Color.fromRGBO(100, 221, 23, 0.7),
                            BlendMode.darken),
                        child: Image(
                          image: AssetImage('assets/images/login.jpg'),
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
                            'Experience logic like never before',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
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
            Padding(
              padding: EdgeInsets.only(top: 120.0),
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
              padding: EdgeInsets.only(top: 200.0),
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
            getRaisedButtonContents(
                _text[0], _icons[0], context, 210.0, Colors.blue[900]),
            getRaisedButtonContents(
                _text[1], _icons[1], context, 160.0, Colors.black54),
            Align(
              alignment: Alignment.bottomCenter,
              child: ButtonTheme(
                minWidth: double.infinity,
                height: 50.0,
                child: FlatButton(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  child: Text(
                    "Don't have an account? Create account",
                    style: GoogleFonts.varelaRound(
                        textStyle: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Join()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getRaisedButtonContents(String text, FaIcon faIcon, BuildContext context,
    double padding, Color color) {
  return Padding(
    padding: EdgeInsets.only(bottom: padding),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: RaisedButton.icon(
          onPressed: () {
            if(text=='Log In with Google') {
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
