// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:saratthi_consumer/Helpers/shared_services.dart';
// import 'package:saratthi_consumer/Views/Login/join.dart';
// import 'package:saratthi_consumer/Views/Login/newuser.dart';
//
// class StartupLogic {
//   int? phoneNo;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   _asyncMethod() async {
//     phoneNo = await getPhoneFromLocal();
//   }
//
//   Widget getLandingPage(BuildContext ctx) {
//     return StreamBuilder<User?>(
//         stream: _auth.authStateChanges(),
//         builder: (BuildContext ctx, snapshot) {
//           if (phoneNo != null) {
//             return Design();
//           } else {
//             const Join();
//           }
//         });
//   }
// }
