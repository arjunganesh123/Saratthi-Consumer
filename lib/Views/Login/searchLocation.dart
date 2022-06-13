import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hexcolor/hexcolor.dart';

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
                  height: 650.0,
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
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(color: HexColor('#ffffff')),
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            child: TextField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.location_pin),
                                iconColor: givenBlue,
                                hintText:
                                    'Search Arrival locations for Saratthi',
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
                          height: 20.0,
                        ),
                        Container(
                          child: FlutterSwitch(
                            width: 125.0,
                            height: 55.0,
                            valueFontSize: 25.0,
                            toggleSize: 45.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(color: HexColor('#ffffff')),
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            child: TextField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.location_pin),
                                iconColor: givenBlue,
                                hintText:
                                    'Search Arrival locations for Saratthi',
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
                        )
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
