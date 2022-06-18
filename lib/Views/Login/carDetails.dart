import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class CarDetails extends StatefulWidget {
  const CarDetails({Key? key}) : super(key: key);

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  List<String>? itemTypList;
  TextEditingController regNumController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;
    return Container(
      padding: const EdgeInsets.only(top: 15),
      height: 30 * h,
      width: 100 * w,
      color: const Color(0xFFF7F7F7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Add Car Details',
              style: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xFF314b5c),
                  fontFamily: 'Luxia',
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 3),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0),
              ),
            ),
            child: ListTile(
              title: const Text(""),
              contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              trailing: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: false,
                  value: true,
                  items: itemTypList?.map((item) {
                    return const DropdownMenuItem<List>(
                      child: SizedBox(
                        width: 150, //expand here
                        child: Text(
                          "",
                          textAlign: TextAlign.left,
                        ),
                      ),
                      // value: item['item_id'],
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      // selectedLeaveType = value;
                    });
                  },
                  hint: const SizedBox(
                    width: 210, //and here
                    child: Text(
                      "Select Car Model",
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xFF314b5c),
                        fontFamily: 'gillsans',
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  style: const TextStyle(
                      color: Colors.black, decorationColor: Colors.red),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: regNumController,
            decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF314b5c))),
                hintText: "Enter Car Registration Number",
                hintStyle: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xFF314b5c),
                  fontFamily: 'gillsans',
                )),
            style: const TextStyle(
              fontSize: 17.0,
              color: Color(0xFF314b5c),
              fontFamily: 'gillsans',
            ),
          ),
          const SizedBox(
            height: 20,
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
                      "DELETE",
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
                width: w * 15,
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
                      "SAVE",
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
