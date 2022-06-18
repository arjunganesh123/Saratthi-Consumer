import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:place_picker/place_picker.dart';
import 'package:saratthi_consumer/Views/Login/bottomup.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  bool status = false;
  Color givenBlue = HexColor('#314b5c');

  String _pickedLocation1 = "Search Arrival locations for Saratthi";
  String _pickedLocation = "Input Saratthi's Drop Off Location";
  @override
  Widget build(BuildContext context) {
    @override
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
              height: h * .80,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(247, 247, 247, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 12.0,
                      spreadRadius: .5,
                      offset: Offset(0.7, 0.7),
                    )
                  ]),
              child: Column(
                children: [
                  const SizedBox(
                    height: 19.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
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
                                const SizedBox(
                                  width: 10.0,
                                ),
                                const Text("Home"),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30.0,
                          ),
                          InkWell(
                            child: Row(
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    "assets/Icons/009-suitcase.png",
                                    height: 20,
                                    width: 20,
                                    color: givenBlue,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                const Text("Work"),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30.0,
                          ),
                          InkWell(
                            child: Row(
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    "assets/Icons/007-location-pin.png",
                                    height: 20,
                                    width: 20,
                                    color: givenBlue,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                const Text("Others"),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    height: 70.0,
                    decoration: BoxDecoration(color: HexColor('#ffffff')),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: givenBlue,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            LocationResult result = await Navigator.of(context)
                                .push(MaterialPageRoute(
                                    builder: (context) => PlacePicker(
                                        "AIzaSyDR4UpsJx8zPYuqGzq1BoWS4YE1J_Qu8E4")));
                            setState(() => _pickedLocation1 =
                                "${result.formattedAddress.toString().substring(0, 24)}....");
                          },
                          child: Text(
                            _pickedLocation1,
                            style: TextStyle(
                                fontSize: 17.0,
                                fontFamily: 'gillsans',
                                color: givenBlue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
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
                                                BorderRadius.circular(20),
                                          ),
                                          content: const BottomUp(),
                                        );
                                      }).then((val) {
                                    setState(() {
                                      status = val;
                                    });
                                  });
                                }
                              });
                            },
                          ),
                          const SizedBox(
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
                  const SizedBox(
                    height: 9.0,
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    height: 70.0,
                    decoration: BoxDecoration(color: HexColor('#ffffff')),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: givenBlue,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            LocationResult result = await Navigator.of(context)
                                .push(MaterialPageRoute(
                                    builder: (context) => PlacePicker(
                                        "AIzaSyDR4UpsJx8zPYuqGzq1BoWS4YE1J_Qu8E4")));
                            setState(() => _pickedLocation =
                                "${result.formattedAddress.toString().substring(0, 24)}....");
                          },
                          child: Text(
                            _pickedLocation,
                            style: TextStyle(
                                fontSize: 17.0,
                                fontFamily: 'gillsans',
                                color: givenBlue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: .4 * h,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 3,
                        itemBuilder: (context, counter) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 300.0,
                              margin: const EdgeInsets.only(
                                  left: 45.0, bottom: 15.0),
                              padding: const EdgeInsets.only(bottom: 10.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0, color: Colors.black),
                                ),
                              ),
                              child: Text(
                                "Singh and Singh Eatery",
                                style: TextStyle(
                                  color: givenBlue,
                                  fontFamily: 'Luxia',
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              )),
        ),
      ],
    );
  }
  //
  // void showPlacePicker() async {
  //   LocationResult
  //   print(result);
  // }
}
