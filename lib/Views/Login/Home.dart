import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saratthi_consumer/Components/Navdrawer.dart';
import 'package:saratthi_consumer/Views/Login/searchLocation.dart';

import '../../Helpers/change.dart';

class Home extends StatefulWidget {
  // List<Change2> logo = <Change2>[];
  List<Change2> logo = <Change2>[];
  List<ModelAndRegister> modreg=<ModelAndRegister>[];
  Home(List<Change2> this.logo,List<ModelAndRegister> this.modreg ,{Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
  final LatLng _initialcameraposition = const LatLng(28.7041, 77.1025);
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
            markerId: const MarkerId('newyork'),
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
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldState,
      drawer: const NavDrawer(),
      body: SizedBox(
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
                left: 15.0,
                top: 45.0,
                child: InkWell(
                  onTap: () {
                    _scaffoldState.currentState!.openDrawer();
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60.0),
                    child: Container(
                      width: 50,
                      padding: const EdgeInsets.all(12.0),
                      height: 50,
                      color: givenBlue,
                      child: Image.asset(
                        'assets/Icons/002-options.png',
                        width: 25,
                        height: 25,
                        fit: BoxFit.contain,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                  height: h * .22,
                  decoration: const BoxDecoration(
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 0.1),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(bottom: h * .007),
                              height: 75,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.logo.length,
                                itemBuilder: (context, counter) {
                                  return Container(
                                    margin: const EdgeInsets.only(left: 1),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          child: Image.asset(
                                            widget.logo[counter].image,
                                            height: 50,
                                            width: 80,
                                            // fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 15,
                                          child: Visibility(
                                            visible:
                                                widget.logo[counter].isVisible,
                                            child: Image.asset(
                                                'assets/Icons/001-gearshift.png',
                                                width: 15.0,
                                                height: 15.0,
                                                color: Colors.lightGreen),
                                          ),
                                        ),
                                        Positioned(
                                          top: 47,
                                          right: 0,
                                          left: 12,
                                          child: Container(
                                            padding: const EdgeInsets.only(top: 5.0),
                                            child: Texterror.selecttext(widget.modreg, counter),
                                          ),
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
                                margin: const EdgeInsets.only(top: 10.0),
                                padding: const EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                          isScrollControlled: true,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          context: context,
                                          // elevation: 10.0,
                                          builder: (context) {
                                            return const FractionallySizedBox(
                                              heightFactor: .8,
                                              child: SearchLocation(),
                                            );
                                          });
                                    },
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        const Icon(Icons.search),
                                        const SizedBox(
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

class Texterror{
  static Widget selecttext(List<ModelAndRegister> modreg,int counter){
    if(modreg.isEmpty){
      return const Text('Go back and give your\n registration number',style: TextStyle(fontSize: 5),);
    }
    else{
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            modreg[counter].Model,
            style: const TextStyle(
                fontSize: 10,
                letterSpacing: .1),
          ),
          Text(
            modreg[counter].Register,
            style: const TextStyle(
                fontSize: 10,
                letterSpacing: .1),
          ),
        ],
      );
    }
  }
}