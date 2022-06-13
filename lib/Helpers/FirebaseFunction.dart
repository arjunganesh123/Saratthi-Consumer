import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saratthi_consumer/Views/Login/Home.dart';
import 'package:saratthi_consumer/Views/Login/join.dart';

class StartupLogic {
  final FirebaseAuth _auth = FirebaseAuth.instance;

    Widget getLandingPage(BuildContext ctx) {
        return StreamBuilder<User?>(
            stream: _auth.authStateChanges(),
            builder: (BuildContext ctx, snapshot) {
              if (snapshot.hasData) {
                return Home();
              }
    
              return Join();
            });
      } 
    }