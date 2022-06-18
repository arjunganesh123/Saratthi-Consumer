import 'package:flutter/material.dart';

class Geartype extends StatefulWidget {
  const Geartype({Key? key}) : super(key: key);

  @override
  State<Geartype> createState() => _GeartypeState();
}

class _GeartypeState extends State<Geartype> {
  bool status = false;
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;

    return Container(
      padding: EdgeInsets.only(top: 15),
      height: 29 * h,
      width: 100 * w,
      color: const Color(0xFFF7F7F7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Select Gear Type',
              style: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xFF314b5c),
                  fontFamily: 'Luxia',
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20.0,
          ),
          ListTile(
            leading: Radio<bool>(
              value: true,
              groupValue: status,
              onChanged: (value) {
                setState(() {
                  status = value!;
                });
              },
            ),
            title: const Text('Automatic',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xFF314b5c),
                    fontFamily: 'Luxia')),
          ),
          ListTile(
            leading: Radio<bool>(
              value: false,
              groupValue: status,
              onChanged: (value) {
                setState(() {
                  status = value!;
                });
              },
            ),
            title: const Text('Manual',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Color(0xFF314b5c),
                    fontFamily: 'Luxia')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                  Navigator.pop(context, status);
                },
                child: const SizedBox(
                  width: 80,
                  height: 30,
                  child: Center(
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
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
