import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xo/pages/login_page.dart';

import '../widgets/button.dart';
import 'Board.dart';

class Login extends StatelessWidget {
  static const String routename = 'login';
  static String playerx = "player 1";
  static String? playero = "player 2";
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    signout() {
      FirebaseAuth.instance.signOut();
      Navigator.of(context).pushNamed(LoginPage.routename);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: signout,
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
        title: Text(
          "Welcom BACK..",
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/image/newBackground.jpeg"),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 10),
                        gapPadding: 20,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        gapPadding: 20,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    filled: true,
                    fillColor: Colors.black12,
                    labelText: "player_X",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    )),
                onChanged: (text) {
                  playerx = text;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 10),
                        gapPadding: 20,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        gapPadding: 20,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    filled: true,
                    fillColor: Colors.black12,
                    labelText: "player_O",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    )),
                onChanged: (text) {
                  playero = text;
                },
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                  style: btnprimary,
                  onPressed: () {
                    Navigator.of(context).pushNamed(Board.routename);
                  },
                  child: Text(
                    "Let's play",
                    style: TextStyle(color: Colors.white),
                  )),
              Text(
                "Logged In As :${user.email}",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
