import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hexcolor/hexcolor.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({Key? key}) : super(key: key);

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  final Color givenBlue = HexColor('#314b5c');
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  bool status4 = false;
  bool status5 = false;
  bool status6 = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: SizedBox(
        height: 40,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: givenBlue,
          child: const Icon(
            Icons.keyboard_arrow_left,
            size: 40,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: MediaQuery.of(context).size.width * 0.22,
                  bottom: MediaQuery.of(context).size.height * 0.06),
              child: Text(
                'Preferences',
                style: TextStyle(
                    color: givenBlue,
                    fontSize: 12,
                    fontFamily: 'OPTICopperplate'),
              )),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.08,
                        bottom: MediaQuery.of(context).size.height * 0.015),
                    child: Text(
                      'EMAIL',
                      style: TextStyle(
                        color: givenBlue,
                        fontSize: 10,
                        fontFamily: 'OPTICopperplate',
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.12,
                      bottom: MediaQuery.of(context).size.height * 0.03),
                  child: Row(
                    children: [
                      Container(
                        width: w * .70,
                        child: const Text(
                          'Allow promotions and offers email',
                          style:
                              TextStyle(fontSize: 15, fontFamily: 'gillsans'),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: FlutterSwitch(
                          activeColor: givenBlue,
                          width: 50.0,
                          height: 20.0,
                          valueFontSize: 12.0,
                          toggleSize: 18.0,
                          value: status1,
                          onToggle: (isOn) {
                            setState(() {
                              status1 = isOn;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.12,
                      bottom: MediaQuery.of(context).size.height * 0.03),
                  child: Row(
                    children: [
                      Container(
                        width: w * .70,
                        child: const Text(
                          'Allow emails for invoices',
                          style:
                              TextStyle(fontSize: 15, fontFamily: 'gillsans'),
                        ),
                      ),
                      FlutterSwitch(
                        activeColor: givenBlue,
                        width: 50.0,
                        height: 20.0,
                        valueFontSize: 12.0,
                        toggleSize: 18.0,
                        value: status2,
                        onToggle: (isOn) {
                          setState(() {
                            status2 = isOn;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.08,
                        bottom: MediaQuery.of(context).size.height * 0.015),
                    child: Text(
                      'SMS AND WHATSAPP',
                      style: TextStyle(
                        color: givenBlue,
                        fontSize: 10,
                        fontFamily: 'OPTICopperplate',
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.12,
                      bottom: MediaQuery.of(context).size.height * 0.03),
                  child: Row(
                    children: [
                      Container(
                        width: w * .70,
                        child: const Text(
                          'Allow invoices',
                          style:
                              TextStyle(fontSize: 15, fontFamily: 'gillsans'),
                        ),
                      ),
                      Row(
                        children: [
                          FlutterSwitch(
                            activeColor: givenBlue,
                            width: 50.0,
                            height: 20.0,
                            valueFontSize: 12.0,
                            toggleSize: 18.0,
                            value: status3,
                            onToggle: (isOn) {
                              setState(() {
                                status3 = isOn;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.12,
                      bottom: MediaQuery.of(context).size.height * 0.03),
                  child: Row(
                    children: [
                      Container(
                        width: w * .70,
                        child: const Text(
                          'Allow promotional offers',
                          style:
                              TextStyle(fontSize: 15, fontFamily: 'gillsans'),
                        ),
                      ),
                      FlutterSwitch(
                        activeColor: givenBlue,
                        width: 50.0,
                        height: 20.0,
                        valueFontSize: 12.0,
                        toggleSize: 18.0,
                        value: status4,
                        onToggle: (isOn) {
                          setState(() {
                            status4 = isOn;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.12,
                      bottom: MediaQuery.of(context).size.height * 0.03),
                  child: Row(
                    children: [
                      Container(
                        width: w * .70,
                        child: const Text(
                          'Allow updates on WhatsApp',
                          style:
                              TextStyle(fontSize: 15, fontFamily: 'gillsans'),
                        ),
                      ),
                      FlutterSwitch(
                        activeColor: givenBlue,
                        width: 50.0,
                        height: 20.0,
                        valueFontSize: 12.0,
                        toggleSize: 18.0,
                        value: status5,
                        onToggle: (isOn) {
                          setState(() {
                            status5 = isOn;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.08,
                        bottom: MediaQuery.of(context).size.height * 0.015),
                    child: Container(
                      width: w * .70,
                      child: Text(
                        'PUSH NOTIFICATIONS',
                        style: TextStyle(
                          color: givenBlue,
                          fontSize: 10,
                          fontFamily: 'OPTICopperplate',
                        ),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.12),
                  child: Row(
                    children: [
                      Container(
                        width: w * .70,
                        child: const Text(
                          'Allow mobile push notifications',
                          style:
                              TextStyle(fontSize: 15, fontFamily: 'gillsans'),
                        ),
                      ),
                      FlutterSwitch(
                        activeColor: givenBlue,
                        width: 50.0,
                        height: 20.0,
                        valueFontSize: 12.0,
                        toggleSize: 18.0,
                        value: status6,
                        onToggle: (isOn) {
                          setState(() {
                            status6 = isOn;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
