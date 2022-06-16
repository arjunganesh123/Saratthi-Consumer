import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;
    Color givenBlue = HexColor('#314b5c');
    return SizedBox(
      width: 85 * w,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
                height: 16 * h,
                padding: EdgeInsets.all(2 * w),
                margin: EdgeInsets.all(2 * w),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(56.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 4.0,
                                spreadRadius: .6)
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: Container(
                          height: 50,
                          width: 50,
                          color: Colors.white,
                          padding: EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/Icons/045-user.png',
                            width: 35,
                            height: 35,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      child: Text(
                        "Naman Khurana\n+917017251685",
                        style: TextStyle(
                          color: givenBlue,
                          fontFamily: 'Luxia',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    Container(
                      child: Image.asset(
                        'assets/Icons/026-pencil.png',
                        color: givenBlue,
                        width: 25,
                        height: 25,
                      ),
                    )
                  ],
                )),
            Container(
              height: 60,
              color: givenBlue,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(2 * w),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Complete your profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Luxia',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: 2 * w, right: 2 * w, bottom: 2 * w),
                      padding: EdgeInsets.zero,
                      // color: Colors.white,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          border: Border.all(color: Colors.white, width: 2.0)),
                      child: GFProgressBar(
                        percentage: 0.7,
                        lineHeight: 7,
                        alignment: MainAxisAlignment.spaceBetween,
                        backgroundColor: Colors.white,
                        progressBarColor: givenBlue,
                      )),
                ],
              ),
            ),
            ListTile(
              leading: Image.asset(
                'assets/Icons/018-wallet.png',
                color: givenBlue,
                width: 25,
                height: 25,
              ),
              title: Text(
                'Payments',
                style: TextStyle(
                  color: givenBlue,
                  fontFamily: 'OPTICopperplate',
                  fontSize: 14,
                ),
              ),
              onTap: () => {},
            ),
            ListTile(
              leading: Image.asset(
                'assets/Icons/023-steering-wheel.png',
                color: givenBlue,
                width: 25,
                height: 25,
              ),
              title: Text(
                'Drives',
                style: TextStyle(
                  color: givenBlue,
                  fontFamily: 'OPTICopperplate',
                  fontSize: 14,
                ),
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Image.asset(
                'assets/Icons/019-ringing.png',
                color: givenBlue,
                width: 25,
                height: 25,
              ),
              title: Text(
                'Notifications',
                style: TextStyle(
                  color: givenBlue,
                  fontFamily: 'OPTICopperplate',
                  fontSize: 14,
                ),
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Image.asset(
                'assets/Icons/024-gift-box.png',
                color: givenBlue,
                width: 25,
                height: 25,
              ),
              title: Text(
                'Refer and Win',
                style: TextStyle(
                  color: givenBlue,
                  fontFamily: 'OPTICopperplate',
                  fontSize: 14,
                ),
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Image.asset(
                'assets/Icons/021-support.png',
                color: givenBlue,
                width: 25,
                height: 25,
              ),
              title: Text(
                'Support',
                style: TextStyle(
                  color: givenBlue,
                  fontFamily: 'OPTICopperplate',
                  fontSize: 14,
                ),
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Image.asset(
                'assets/Icons/020-settings.png',
                color: givenBlue,
                width: 25,
                height: 25,
              ),
              title: Text(
                'Settings',
                style: TextStyle(
                  color: givenBlue,
                  fontFamily: 'OPTICopperplate',
                  fontSize: 14,
                ),
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
    );
  }
}
