import 'package:flutter/material.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saratthi_consumer/Views/Login/notification.dart';

import '../Views/Login/referandearn.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;
    Color givenBlue = HexColor('#314b5c');
    Color givenBg = HexColor('#f7f7f7');
    return Stack(
      children: [
        SizedBox(
          width: 85 * w,
          child: Drawer(
            backgroundColor: givenBg,
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
                              boxShadow: const [
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
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'assets/Icons/045-user.png',
                                width: 35,
                                height: 35,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          "Naman Khurana\n+917017251685",
                          style: TextStyle(
                            color: givenBlue,
                            fontFamily: 'Luxia',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
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
                  height: h * 8,
                  color: givenBlue,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2 * w),
                        alignment: Alignment.bottomLeft,
                        child: const Text(
                          "Complete your profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Luxia',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: .5 * h,
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              left: 2 * w, right: 2 * w, bottom: 2 * w),
                          padding: EdgeInsets.zero,
                          // color: Colors.white,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50.0)),
                              border:
                                  Border.all(color: Colors.white, width: 2.0)),
                          child: GFProgressBar(
                            percentage: 1,
                            lineHeight: 5,
                            alignment: MainAxisAlignment.spaceBetween,
                            backgroundColor: Colors.white,
                            progressBarColor: givenBlue,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2 * h,
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
                  onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationPage(),),),},
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
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ReferAndEarn(),
                    ));
                  },
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
        ),
        Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Column(
              children: [
                TextButton(
                    onPressed: () => {Navigator.of(context).pop()},
                    child: Container(
                      margin: EdgeInsets.only(right: 2 * w, bottom: .5 * h),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "CLOSE",
                        style: TextStyle(
                          color: givenBlue,
                          fontFamily: 'OPTICopperplate',
                          fontSize: 14,
                        ),
                      ),
                    )),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Earn money?\nRegister as Driver or Company",
                        style: TextStyle(
                          color: givenBlue,
                          fontFamily: 'Luxia',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: w * 10),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: givenBlue,
                            size: 30,
                          ))
                    ],
                  ),
                )
              ],
            )),
      ],
    );
  }
}
