import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saratthi_consumer/Helpers/searchbar.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  @override
  Widget build(BuildContext context) {
    Color givenBlue = HexColor('#314b5c');
    bool status = false;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  child:
                      Image.asset('assets/Images/image2-620x525_consumer.png'),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                  height: 700.0,
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                          decoration: BoxDecoration(color: HexColor('#ffffff')),
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            child: TextField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.location_pin),
                                iconColor: givenBlue,
                                hintText:
                                    'Search Arrival locations for Saratthi',
                                hintStyle: TextStyle(
                                    fontSize: 17.0,
                                    fontFamily: 'gillsans',
                                    color: givenBlue),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HexColor('#fffff')),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HexColor("#fffff")),
                                ),
                              ),
                            ),
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
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 14.0,
                                ),
                                Text(
                                  "Female Drivers Only",
                                  style: TextStyle(
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
                          decoration: BoxDecoration(color: HexColor('#ffffff')),
                          child: TextField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.location_pin),
                              iconColor: givenBlue,
                              hintStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontFamily: 'gillsans',
                                  color: givenBlue),
                              hintText: "Input Saratthi's Drop Off Location",
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor('#fffff')),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("#fffff")),
                              ),
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
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
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
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
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
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                            child: Text(
                              "Singh and Singh Eatery",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
