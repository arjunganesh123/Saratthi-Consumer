import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saratthi_consumer/Helpers/searchbar.dart';
import 'package:saratthi_consumer/Views/Login/bottomup.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  bool status = false;
  Color givenBlue = HexColor('#314b5c');
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Material(
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                height: h * .80,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(247, 247, 247, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 16.0,
                        spreadRadius: .5,
                        offset: Offset(0.7, 0.7),
                      )
                    ]),
                child: Column(
                  children: [
                    SizedBox(
                      height: 19.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              InkWell(
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      child: Image.asset(
                                        "assets/Icons/008-home.png",
                                        height: 20,
                                        width: 20,
                                        color: givenBlue,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text("Home"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              InkWell(
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      child: Image.asset(
                                        "assets/Icons/008-home.png",
                                        height: 20,
                                        width: 20,
                                        color: givenBlue,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text("Work"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              InkWell(
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      child: Image.asset(
                                        "assets/Icons/008-home.png",
                                        height: 20,
                                        width: 20,
                                        color: givenBlue,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text("Others"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(8.0),
                      height: 70.0,
                      decoration: BoxDecoration(color: HexColor('#ffffff')),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: givenBlue,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => searchBar(),
                              ));
                            },
                            child: Text(
                              "Search Arrival locations for Saratthi",
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontFamily: 'gillsans',
                                  color: givenBlue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 9.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FlutterSwitch(
                              width: 55.0,
                              height: 25.0,
                              valueFontSize: 12.0,
                              toggleSize: 18.0,
                              value: status,
                              onToggle: (isOn) {
                                setState(() {
                                  status = isOn;
                                  if (status == true) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            content: BottomUp(),
                                          );
                                        });
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 14.0,
                            ),
                            Text(
                              "Female Drivers Only",
                              style: TextStyle(
                                  color: givenBlue,
                                  fontSize: 17.0,
                                  fontFamily: 'gillsans',
                                  fontWeight: FontWeight.w100),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 9.0,
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(8.0),
                      height: 70.0,
                      decoration: BoxDecoration(color: HexColor('#ffffff')),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: givenBlue,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => searchBar(),
                              ));
                            },
                            child: Text(
                              "Input Saratthi's Drop Off Location",
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontFamily: 'gillsans',
                                  color: givenBlue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 300.0,
                        margin: EdgeInsets.only(left: 40.0),
                        padding: EdgeInsets.only(bottom: 10.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.black),
                          ),
                        ),
                        child: Text(
                          "Singh and Singh Eatery",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 300.0,
                        margin: EdgeInsets.only(left: 40.0),
                        padding: EdgeInsets.only(bottom: 10.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.black),
                          ),
                        ),
                        child: Text(
                          "Singh and Singh Eatery",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 300.0,
                        margin: EdgeInsets.only(left: 40.0),
                        padding: EdgeInsets.only(bottom: 10.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.black),
                          ),
                        ),
                        child: Text(
                          "Singh and Singh Eatery",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
