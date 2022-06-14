import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saratthi_consumer/Views/Login/searchLocation.dart';

import '../../Helpers/change.dart';
class Home extends StatefulWidget {
  List<Change2> logo=<Change2>[];
  Home( {Key? key,required List<Change2> logo}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LatLng _initialcameraposition = const LatLng(28.7041, 77.1025);
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
                  height: 150.0,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 40),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, counter) {
                              return Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Stack(
                                  children: [
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
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Image.asset(
                                          'assets/Icons/001-gearshift.png',
                                          width: 15.0,
                                          height: 15.0,
                                          color: Colors.lightGreen),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Center(
                          child: Container(
                            height: 60.0,
                            margin: EdgeInsets.only(top: 10.0),
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SearchLocation(),
                                  ));
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
