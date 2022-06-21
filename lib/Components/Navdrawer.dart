import 'package:flutter/material.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saratthi_consumer/Views/Login/driverpage.dart';
import 'package:saratthi_consumer/Views/Login/notification.dart';
import 'package:saratthi_consumer/Views/Login/paymentsPage.dart';
import 'package:saratthi_consumer/Views/Login/settingspage.dart';
import 'package:saratthi_consumer/Views/Login/support.dart';

import '../Helpers/shared_services.dart';
import '../Services/customer_verify_profile.dart';
import '../Views/Login/edit_profile.dart';
import '../Views/Login/referandearn.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  int? phoneNo;
  String? name;
  TextEditingController nameController = TextEditingController();
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    phoneNo = await getPhoneFromLocal();

    var response = await driverProfile(PhoneNo: phoneNo);
    nameController.text = response.fullname!;
    name = nameController.text.toString();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;
    Color givenBlue = HexColor('#314b5c');
    Color givenBg = HexColor('#f7f7f7');
    double _givenPecentage = 30.0;
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
                          phoneNo != null
                              ? "${name}\n+91 $phoneNo"
                              : "Name\n+91 1234567890",
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
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ProfileForm()));
                          },
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
                        padding: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50.0)),
                            border:
                                Border.all(color: Colors.white, width: 2.0)),
                        child: BarProgress(
                          percentage: _givenPecentage = 30.0,
                          backColor: Colors.white,
                          color: givenBlue,
                          // gradient:
                          //     LinearGradient(colors: [givenBlue, givenBg]),
                          showPercentage: false,
                          stroke: 4,
                          round: true,
                        ),
                      ),
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
                  onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PaymentsPage())),
                  },
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
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DriverPage(),
                      ),
                    ),
                  },
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
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NotificationPage(),
                    ));
                  },
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
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Support(),
                      ),
                    ),
                  },
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
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ),
                    );
                  },
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
