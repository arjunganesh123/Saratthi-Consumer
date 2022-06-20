import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import '../../Helpers/shared_services.dart';
import '../../Services/customer_verify_profile.dart';

class EditUser extends StatefulWidget {
  const EditUser({Key? key}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController gender = TextEditingController();
  final Color givenBlue = HexColor('#314b5c');
  String? dropValue = "Male";
  int? userId;
  int? phoneNo;
  DateTime? _selectedDate;
  void _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1947),
            lastDate: DateTime.now())
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // using state so that the UI will be rerendered when date is picked
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    phoneNo = await getPhoneFromLocal();
    var response = await driverProfile(PhoneNo: phoneNo);
    userId = response.id;
    nameController.text = response.fullname!;
    dob.text = DateFormat("dd-MMMM-yyyy").format(
      DateTime.parse(response.dob!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: SizedBox(
        height: 50,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: givenBlue,
          child: const Icon(
            Icons.keyboard_arrow_left,
            size: 40,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.width * 0.22,
                bottom: MediaQuery.of(context).size.height * 0.06),
            child: Row(
              children: [
                Text(
                  'PROFILE',
                  style: TextStyle(
                      color: givenBlue,
                      fontSize: 12,
                      fontFamily: 'OPTICopperplate'),
                ),
                const SizedBox(
                  width: 110,
                ),
                Image.asset(
                  'assets/Icons/032-chat-box.png',
                  width: 35,
                  height: 35,
                ),
                const Text(
                  'Help',
                  style: TextStyle(
                      color: Colors.blue, fontSize: 20, fontFamily: 'gillsans'),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.35, bottom: 10),
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(50.0),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.3, bottom: 10),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Icons/048-write.png',
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Add/Replace',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontFamily: 'gillsans'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05, bottom: 20),
                child: Row(
                  children: [
                    const Text(
                      'Personal Information',
                      style: TextStyle(fontSize: 15, fontFamily: 'gillsans'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'assets/Icons/049-check-mark.png',
                      width: 20,
                      height: 20,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'gillsans',
                              color: Colors.black),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'gillsans',
                              color: Colors.black),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.06, bottom: 20),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Icons/045-user.png',
                      width: 35,
                      height: 35,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 2.0),
                          ),
                          hintText: 'Full Name',
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: 'OPTICopperplate'),
                        ),
                        cursorColor: Colors.black,
                        cursorHeight: 25,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'gillsans'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.06, bottom: 20),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Icons/051-birthday-cake.png',
                      width: 35,
                      height: 35,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: TextField(
                        controller: dob,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          hintText: 'Date Of Birth',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: 'OPTICopperplate'),
                        ),
                        cursorColor: Colors.black,
                        cursorHeight: 25,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'gillsans'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.06, bottom: 20),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Icons/052-gender.png',
                      width: 35,
                      height: 35,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: const TextField(
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          hintText: 'Full Name',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: 'OPTICopperplate'),
                        ),
                        cursorColor: Colors.black,
                        cursorHeight: 25,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'gillsans'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.06, bottom: 20),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Icons/mail.png',
                      width: 35,
                      height: 35,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: const TextField(
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: 'OPTICopperplate'),
                        ),
                        cursorColor: Colors.black,
                        cursorHeight: 25,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'gillsans'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
