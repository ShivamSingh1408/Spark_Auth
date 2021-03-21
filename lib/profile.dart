import 'package:flutter/material.dart';
import 'package:login_with_socials/login.dart';
import 'package:login_with_socials/socials/google.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  String profilepic;
  String name;
  String email;

  Profile(this.profilepic, this.name, this.email);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(this.profilepic),
              radius: 75.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text("NAME:", style: TextStyle(fontSize: 14.0)),
            SizedBox(
              height: 5.0,
            ),
            Text(this.name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 20.0),
            Text("EMAIL ID:", style: TextStyle(fontSize: 14.0)),
            SizedBox(
              height: 5.0,
            ),
            Text(this.email,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Center(
              child: Container(
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
                      "Sign Out",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.transparent,
                    textTheme: ButtonTextTheme.accent,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Login()));
                      if (AuthBlocGoogle().currentUser != null) {
                        AuthBlocGoogle().logout();
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
