import 'dart:async';
import 'package:flutter/material.dart';
import 'package:saratthi_consumer/Views/Login/join.dart';

import '../../Helpers/FirebaseFunction.dart';
import '../../Helpers/shared_services.dart';
import '../../Helpers/transition.dart';
import 'newuser.dart';

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  int? phoneNo;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
    Timer(
        Duration(seconds: 3),
        () => phoneNo != null
            ? Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Design()))
            : Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Design())));
  }

  _asyncMethod() async {
    phoneNo = await getPhoneFromLocal();
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
