import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:saratthi_consumer/Components/custom_text.dart';
import 'package:saratthi_consumer/Views/Login/newuser.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:timer_button/timer_button.dart';

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
  String _otpCode = "";
  bool isAPICallProcess = false;
  late FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.requestFocus();

    SmsAutoFill().listenForCode.call();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Card(
                  child: Image.asset(
                    "assets/Images/image2-620x525_consumer.png",
                    fit: BoxFit.cover,
                    height: 50 * h,
                  ),
                ),
              ),
            ),
            Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Container(
                    height: 450.0,
                    margin: const EdgeInsets.only(top: 5.0),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18.0),
                            topRight: Radius.circular(18.0)),
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
                      const SizedBox(height: 20),
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
                              SizedBox(width: w * 7),
                              CustomText(
                                text: "Edit Number",
                                fontSize: 12,
                                color: givenBlue,
                              ),
                              SizedBox(
                                width: w * 30,
                              ),
                              TimerButton(
                                label: "Send OTP Again",
                                timeOutInSeconds: 30,
                                onPressed: () {},
                                disabledColor: Color.fromRGBO(247, 247, 247, 1),
                                buttonType: ButtonType.TextButton,
                                disabledTextStyle: new TextStyle(
                                    fontSize: 12.0, color: givenBlue),
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
                          children: const <Widget>[
                            // Container(
                            //   margin:
                            //       EdgeInsets.only(top: 2 * h, bottom: 2 * h),
                            //   width: 70 * w,
                            // child: TextField(
                            //   controller: otp,
                            //   keyboardType: TextInputType.phone,
                            //   decoration: InputDecoration(
                            //       focusedBorder: OutlineInputBorder(
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(10)),
                            //         borderSide: BorderSide(
                            //           color: givenBlue,
                            //           width: 3,
                            //         ),
                            //       ),
                            //       enabledBorder: OutlineInputBorder(
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(10)),
                            //         borderSide: BorderSide(
                            //           color: givenBlue,
                            //           width: 3,
                            //         ),
                            //       ),
                            //       labelText: 'OTP',
                            //       labelStyle: TextStyle(
                            //           fontFamily: 'Luxia Regular',
                            //           color: givenBlue)),
                            // ),
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                          child: PinCodeTextField(
                            pastedTextStyle: TextStyle(color: givenBlue),
                            blinkWhenObscuring: true,
                            appContext: context,
                            length: 6,
                            cursorWidth: 1.0,
                            pinTheme: PinTheme(
                                activeColor: givenBlue,
                                inactiveColor:
                                    const Color.fromARGB(255, 243, 124, 33),
                                borderWidth: 3.0),
                            controller: otp,
                            cursorColor: givenBlue,
                            obscureText: true,
                            obscuringCharacter: '*',
                            onChanged: (String value) {},
                          )),
                      SizedBox(
                        height: 10 * h,
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
    );
  }

  void verifyOTP(String verificationId) async {
    print(verificationId);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp.text);

    await auth.signInWithCredential(credential).then((value) async {
      if (value.user != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Design()),
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

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    myFocusNode.dispose();
    super.dispose();
  }
  ///////Resend OTP

}
