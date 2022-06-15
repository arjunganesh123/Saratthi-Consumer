import 'dart:async';
import 'package:flutter/material.dart';
import 'package:saratthi_consumer/Views/Login/join.dart';

import '../../Helpers/FirebaseFunction.dart';
import '../../Helpers/transition.dart';

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
              new MyCustomRoute(
                builder: (context) => StartupLogic().getLandingPage(context),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Colors.black,
        child: Image.asset(
          "assets/Images/flash-screen_consumer-final.png",
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
