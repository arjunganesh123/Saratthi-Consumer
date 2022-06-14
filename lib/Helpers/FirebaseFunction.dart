import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saratthi_consumer/Views/Login/join.dart';
import 'package:saratthi_consumer/Views/Login/newuser.dart';

class StartupLogic {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Widget getLandingPage(BuildContext ctx) {
    return StreamBuilder<User?>(
        stream: _auth.authStateChanges(),
        builder: (BuildContext ctx, snapshot) {
          if (snapshot.hasData) {
            return Design();
          }

          return Join();
        });
  }
}
