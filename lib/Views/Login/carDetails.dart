import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CarDetails extends StatefulWidget {
  CarDetails({Key? key, required this.itemTypList}) : super(key: key);
  List<String> itemTypList;

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  TextEditingController regNumController = TextEditingController();
  String? _btn2SelectedVal;
  Color givenBlue = HexColor("#314b5c");
  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<String>> dropDownMenuItems = widget.itemTypList
        .map(
          (String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ),
        )
        .toList();
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
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0),
              ),
            ),
            child: ListTile(
              leading: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _btn2SelectedVal,
                  elevation: 0,
                  iconEnabledColor: givenBlue,
                  hint: Text(
                    "Select car Models           ",
                    style: TextStyle(
                        color: givenBlue, fontFamily: 'gillsans', fontSize: 17),
                  ),
                  style: TextStyle(color: givenBlue, fontFamily: 'gillsans'),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() => _btn2SelectedVal = newValue);
                    }
                  },
                  items: dropDownMenuItems,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            child: TextFormField(
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
          ),
          const SizedBox(
            height: 10,
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
                  String reg=regNumController.text.toString();
                  final data={'model':'$_btn2SelectedVal','register':reg};
                  Navigator.pop(context, data,);
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
