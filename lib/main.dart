import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:saratthi_consumer/Components/Navdrawer.dart';
import 'package:saratthi_consumer/Views/Login/newuser.dart';
import 'package:saratthi_consumer/Views/Login/notification.dart';
import 'package:saratthi_consumer/Views/Login/referandearn.dart';
import 'package:saratthi_consumer/Views/Login/splash.dart';

import 'Views/Login/bottomup.dart';
import 'Views/Login/searchLocation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saratthi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'tgm',
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: splash(),
    );
  }
}
