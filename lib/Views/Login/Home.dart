import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saratthi_consumer/Helpers/transition.dart';
import 'package:saratthi_consumer/Views/Login/searchLocation.dart';
import 'package:saratthi_consumer/src/locations.dart' as locations;

import '../../Components/custom_text.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LatLng _initialcameraposition = const LatLng(20.5937, 78.9629);
  late GoogleMapController _controller;
  Location _location = Location();
  final Set<Marker> _markers = Set();
  Color givenBlue = HexColor('#314b5c');

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;

    _location.onLocationChanged.listen((l) {
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId('newyork'),
            position: LatLng(l.latitude!, l.longitude!),
          ),
        );
      });
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController SearchController = TextEditingController();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              markers: _markers,
              initialCameraPosition:
                  CameraPosition(target: _initialcameraposition),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(247, 247, 247, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0),
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
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.1),
                      child: Column(children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.asset(
                                    'assets/Car_Make-Brands/Audi.png',
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.asset(
                                    'assets/Car_Make-Brands/Ford.png',
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.asset(
                                    'assets/Car_Make-Brands/Kia.png',
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              )
                            ]),
                        SizedBox(
                          height: 56,
                        ),
                        Center(
                          child: Container(
                            height: 60.0,
                            margin: EdgeInsets.only(top: 10.0),
                            padding: EdgeInsets.only(right: 10.0, left: 10.0),
                            decoration: BoxDecoration(
                              color: HexColor("#EEEAEAFF"),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SearchLocation()));
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Icon(Icons.search),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "Search Arrival locations for Saratthi",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: givenBlue,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ]))),
            )
          ],
        ),
      ),
    );
  }
}
