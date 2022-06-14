import 'package:flutter/material.dart';
class BottomUp extends StatelessWidget {

  const BottomUp({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20,top: 15,right: 10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFFFFFFFF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Female riders facility id only allowed :-\n',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0,color: Color(0xFF314b5c),fontFamily: 'gillsans'),),
          const Text('If all the passengers for the entire ride will be\nfemale.\n',style: TextStyle(fontSize: 17.0,color: Color(0xFF314b5c),fontFamily: 'gillsans')),
          const Text('The complete duration of the ride will not be\nmore than 4 hr.\n',style: TextStyle(fontSize: 17.0,color: Color(0xFF314b5c),fontFamily: 'gillsans')),
          const Text('Kindly note that the female drivers have the\nright to deny the ride in case of above\nconditions are not fulfilled or destination of the\nride is marked "unsafe for female" within our\nsystem.\n\n',style: TextStyle(fontSize: 17.0,color: Color(0xFF314b5c),fontFamily: 'gillsans')),
          Row(
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
                  Navigator.pop(context);
                },
                child: const SizedBox(
                  width: 105,
                  height: 40,
                  child: Center(
                    child: Text(
                      "CANCEL",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontFamily: "OPTICopperplate"),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30,),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      )),
                  backgroundColor: MaterialStateProperty.all(const Color(0xFF314b5c)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const SizedBox(
                  width: 105,
                  height: 40,
                  child: Center(
                    child: Text(
                      "PROCEED",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
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
