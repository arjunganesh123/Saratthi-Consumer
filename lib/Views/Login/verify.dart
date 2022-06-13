import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saratthi_consumer/Components/custom_text.dart';
import 'package:timer_button/timer_button.dart';

import 'Home.dart';
import 'join.dart';

class Verify extends StatefulWidget {
  Verify({Key? key, this.phNumber, this.VerificationId}) : super(key: key);
  String? phNumber;
  String? VerificationId;
  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController otp = TextEditingController();
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
                Positioned(child: 
                Container(
                  width: 100 * w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Card(
                      child: Image.asset(
                          "assets/Images/image2-620x525_consumer.png",
                          fit: BoxFit.cover),
                    ),
                  ),
                ),top: 0,right: 0,left: 0,),
                Positioned(left: 0.0,right: 0.0,bottom: 0.0,
                child:Container(
                    height: 470.0,
                    margin: EdgeInsets.only(top: 5.0),
                    decoration:const BoxDecoration(
                        borderRadius:BorderRadius.only(topLeft: Radius.circular(18.0),topRight:Radius.circular(18.0)),
                        color: Color.fromRGBO(247, 247, 247, 1),
                        boxShadow: [
                           BoxShadow(
                            color: Colors.black,
                            blurRadius: 4.0,
                          ),
                        ]),
                    child: Column(children: [
                      const SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    "Kindly put the OTP sent to your mobile ",
                                    style: TextStyle(
                                        color: givenBlue,
                                        fontSize: 18.5,
                                        fontFamily: 'gillsans'),
                                  ),
                                ]),
                            const SizedBox(height: 2),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    "number (${widget.phNumber.toString()})",
                                    style: TextStyle(
                                        fontSize: 18.5,
                                        color: Color.fromARGB(255, 48, 77, 49),
                                        fontFamily: 'gillsans'),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Join()));
                            },
                            child: Row(children: [
                              SizedBox(
                                width: 20.0,
                              ),
                              CustomText(
                                text: "Edit Number",
                                fontSize: 12,
                                color: givenBlue,
                              ),
                              SizedBox(
                                width: 140.0,
                              ),
                              TimerButton(
                                label: "Send OTP Again",
                                timeOutInSeconds: 30,
                                onPressed: () {},
                                disabledColor: Color.fromRGBO(247, 247, 247, 1),
                                buttonType: ButtonType.TextButton,
                                disabledTextStyle:
                                    new TextStyle(fontSize: 12.0),
                                activeTextStyle: new TextStyle(
                                    fontSize: 12.0,
                                    color: Color.fromARGB(255, 243, 124, 33)),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Container(
                        width: 100 * w,
                        margin: const EdgeInsets.only(top: 20),
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
                              margin:
                                  EdgeInsets.only(top: 2 * h, bottom: 2 * h),
                              width: 70 * w,
                              child: TextField(
                                controller: otp,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
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
                                    labelText: 'OTP',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Luxia Regular',
                                        color: givenBlue)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                          backgroundColor: MaterialStateProperty.all(givenBlue),
                        ),
                        onPressed: () {
                          print("Verification id is =${widget.VerificationId}");
                          verifyOTP(widget.VerificationId.toString());
                        },
                        child: Container(
                          width: 28 * w,
                          child: const Center(
                            child: Text(
                              "CONFIRM",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "OPTICopperplate"),
                            ),
                          ),
                        ),
                      ),
                    ])))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void verifyOTP(String verificationId) async {
    print(verificationId);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp.text);

    await auth.signInWithCredential(credential).then((value)
      async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false);
            }
      print("You are logged in successfully");
      Fluttertoast.showToast(
          msg: "You are logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });

  }


  ///////Resend OTP

}