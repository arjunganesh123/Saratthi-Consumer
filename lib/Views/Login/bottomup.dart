import 'package:flutter/material.dart';

class BottomUp extends StatelessWidget {
  const BottomUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;
    return Container(
      padding: EdgeInsets.only(top: 15),
      height: 50 * h,
      width: 100 * w,
      color: const Color(0xFFFFFFFF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Female riders facility id only allowed :-\n',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Color(0xFF314b5c),
                fontFamily: 'gillsans'),
          ),
          const Text(
              'If all the passengers for the entire ride will be female.\n',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xFF314b5c),
                  fontFamily: 'gillsans')),
          const Text(
              'The complete duration of the ride will not be more than 4 hr.\n',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xFF314b5c),
                  fontFamily: 'gillsans')),
          const Text(
              'Kindly note that the female drivers have the right to deny the ride in case of above conditions are not fulfilled or destination of the ride is marked "unsafe for female" within our system.\n',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xFF314b5c),
                  fontFamily: 'gillsans')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  )),
                  backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                ),
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const SizedBox(
                  width: 70,
                  height: 30,
                  child: Center(
                    child: Text(
                      "CANCEL",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.5,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontFamily: "OPTICopperplate"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
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
                  width: 70,
                  height: 30,
                  child: Center(
                    child: Text(
                      "PROCEED",
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
