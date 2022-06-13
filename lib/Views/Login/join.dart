import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saratthi_consumer/Components/custom_text.dart';
import 'package:saratthi_consumer/Views/Login/verify.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Join extends StatefulWidget {
  const Join({Key? key}) : super(key: key);

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController phone = TextEditingController();
  String verificationID = "";
  String phNumber = "";
  Color givenBlue = HexColor('#314b5c');
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  width: 95 * w,
                  height: 48 * h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: givenBlue,
                        width: 5,
                      )),
                  child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Card(
                        child: Image.asset(
                            "assets/Images/image-620x525_consumer.png",
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                      top: 2 * h,
                    ),
                    width: 30 * w,
                    child: Image.asset(
                      'assets/Logo/logo.png',
                    )),
                Container(
                  margin: EdgeInsets.only(top: .1 * h),
                  width: 100 * w,
                  child: Column(
                    children: [
                       Center(
                        child: Text("We drive you better",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Alex_Brush",
                                color: givenBlue)),
                      ),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Text(
                              "We need a few more information to make sure you ",
                              style: TextStyle(
                                  color: givenBlue, fontFamily: 'gillsans'),
                            ),
                          ]),
                      SizedBox(height: 2),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Text(
                              "get the most out of the app.",
                              style: TextStyle(
                                  color: givenBlue, fontFamily: 'gillsans'),
                            ),
                          ]),
                    ],
                  ),
                ),
                Container(
                  width: 85 * w,
                  margin:  EdgeInsets.only(top: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 2 * w),
                        child: CircleAvatar(
                          backgroundColor: givenBlue,
                          radius: 15,
                          child: Icon(
                            FontAwesomeIcons.phone,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2 * h, bottom: 2 * h),
                        width: 70 * w,
                        child: TextField(
                          controller: phone,
                          keyboardType: TextInputType.phone,
                          decoration:  InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: givenBlue,
                                  width: 3,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: givenBlue,
                                  width: 3,
                                ),
                              ),
                              labelText: 'Mobile No',
                              labelStyle: TextStyle(
                                  fontFamily: 'Luxia Regular',
                                  color: givenBlue)),
                        ),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    loginWithPhone();
                    print(verificationID);
                  },
                  child: Container(
                    width: 25 * w,
                    child: Center(
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                            color: givenBlue,
                            fontSize: 15,
                            fontFamily: "OPTICopperplate"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginWithPhone() async {
    String phNumber = phone.text.toString();
    // Navigator.of(context).push(
    // MaterialPageRoute(builder: (context) => Verify()));
    auth.verifyPhoneNumber(
      phoneNumber: "+91${phone.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationID = verificationId;
        print(verificationId);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Verify(
              phNumber: phNumber,
              VerificationId: verificationID,
            ),
          ),
        );
        setState(() {
          verificationID = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
