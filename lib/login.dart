import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_with_socials/profile.dart';
import 'package:login_with_socials/socials/facebook.dart';
import 'package:login_with_socials/socials/google.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Connect Here",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              "images/clip-sign-up.png",
              width: size.width,
              fit: BoxFit.fitHeight,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(35, 40, 107, 1),
                ),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  elevation: 7.5,
                  splashColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Text(
                    "Google SignIn",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.transparent,
                  textTheme: ButtonTextTheme.accent,
                  onPressed: () async {
                    AuthBlocGoogle gu = AuthBlocGoogle();
                    gu.googleSignin.disconnect();
                    User googleUser = await gu.loginGoogle();
                    if (googleUser != null) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Profile(googleUser.photoURL,
                              googleUser.displayName, googleUser.email)));
                    } else {
                      print("Error occured");
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(35, 40, 107, 1),
                ),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  elevation: 7.5,
                  splashColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Text(
                    "Facebook SignIn",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.transparent,
                  textTheme: ButtonTextTheme.accent,
                  onPressed: () async {
                    AuthBlocFacebook fb = AuthBlocFacebook();
                    fb.logout();
                    User fbUser = await fb.loginFacebook();
                    if (fbUser != null) {
                      print(fbUser.email);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Profile(fbUser.photoURL,
                              fbUser.displayName, fbUser.email)));
                    } else {
                      print("Error occured");
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
