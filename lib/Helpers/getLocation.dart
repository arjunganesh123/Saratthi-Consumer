import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:map_location_picker/generated/l10n.dart' as location_picker;
import 'package:flutter/services.dart';
import 'package:map_location_picker/google_map_location_picker.dart';
import 'package:map_location_picker/map_location_picker.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocatTest extends StatefulWidget {
  const LocatTest({Key? key}) : super(key: key);

  @override
  State<LocatTest> createState() => _LocatTestState();
}

class _LocatTestState extends State<LocatTest> {
  String _platformVersion = 'Unknown';
  LocationResult? _pickedLocation;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await MapLocationPicker.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'location picker',
      localizationsDelegates: const [
        location_picker.S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en', ''),
      supportedLocales: const <Locale>[
        Locale('en', ''),
        Locale('ar', ''),
        Locale('pt', ''),
        Locale('tr', ''),
        Locale('es', ''),
        Locale('it', ''),
        Locale('ru', ''),
      ],
      home: Scaffold(
        appBar: AppBar(
          title: const Text('location picker'),
        ),
        body: Builder(builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    LocationResult? result = await showLocationPicker(
                      context,
                      'AIzaSyDR4UpsJx8zPYuqGzq1BoWS4YE1J_Qu8E400',
                      initialCenter: const LatLng(31.1975844, 29.9598339),
                      myLocationButtonEnabled: true,
                      layersButtonEnabled: true,
                      desiredAccuracy: LocationAccuracy.bestForNavigation,
                      countries: ['IN'],
                      language: 'en',
                      requiredGPS: true,
                    );
                    debugPrint("result = $result");
                    setState(() => _pickedLocation = result);
                  },
                  child: const Text('Pick location'),
                ),
                Text(_pickedLocation.toString()),
              ],
            ),
          );
        }),
      ),
    );
  }
}
