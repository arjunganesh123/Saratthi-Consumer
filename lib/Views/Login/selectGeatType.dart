import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Geartype extends StatelessWidget {
  const Geartype({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;
    return Container(
      padding: EdgeInsets.only(top: 15),
      height: 16 * h,
      width: 100 * w,
      color: const Color(0xFFFFFFFF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Select Type of Gearshift',
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xFF314b5c),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'gillsans')),
          SizedBox(
            height: 5 * h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all(HexColor('#314b5c')),
                ),
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const SizedBox(
                  width: 80,
                  height: 30,
                  child: Center(
                    child: Text(
                      "AUTOMATIC",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 7,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontFamily: "OPTICopperplate"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: w * 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF314b5c)),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const SizedBox(
                  width: 80,
                  height: 30,
                  child: Center(
                    child: Text(
                      "MANUAL",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontFamily: "OPTICopperplate"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
