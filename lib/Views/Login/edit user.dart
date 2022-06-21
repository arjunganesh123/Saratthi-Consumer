import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import '../../Components/custom_spacing.dart';
import '../../Components/custom_text.dart';
import '../../Constants/size_config.dart';
import '../../Helpers/shared_services.dart';
import '../../Services/Customer_personal_info.dart';
import 'package:intl/intl.dart';

import '../../Services/customer_verify_profile.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final Color givenBlue = HexColor('#314b5c');
  TextEditingController nameController = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController gender = TextEditingController();
  XFile? imageFile;
  String? dropValue;
  int? userId;
  DateTime? _selectedDate;
  int? phoneNo;
  String? name;
  String? url;
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

  File? image;

  Future pickImage() async {
    final picker = ImagePicker();
    try {
      XFile? _pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );

      image = File(_pickedFile!.path);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
    _upload(image!);
  }

  void _upload(File file) async {
    String fileName = file.path.split('/').last;

    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });
    Dio dio = Dio();

    dio
        .post(
            "https://saratthi-app.herokuapp.com/api/customer/profileupload/$userId",
            data: data)
        .then((response) => print(response))
        .catchError((error) => print(error));
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
    name = response.fullname!;
    url = response.img!;
    email.text = response.email!;
    gender.text = response.gender!;
    dob.text = DateFormat("dd-MMMM-yyyy").format(
      DateTime.parse(response.dob!),
    );
    gender.text = response.gender!;
  }

  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    var h = MediaQuery.of(context).size.height / 100;
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Upper Section arrow,Profile,Help
            Container(
              margin: CustomSpacing(context: context, top: 2, bottom: 3),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(3 * w)!,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: getProportionateScreenWidth(40 * w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromRGBO(49, 75, 92, 1),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left:
                                          getProportionateScreenWidth(2 * w)!),
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: 20,
                                  )),
                            ),
                          ),
                          CustomText(
                              text: "PROFILE",
                              fontSize: 16,
                              color: Colors.black),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/Icons/032-chat-box.png",
                          width: getProportionateScreenWidth(
                            8 * w,
                          ),
                        ),
                        CustomText(
                          text: "Help",
                          color: Colors.blueAccent,
                          fontSize: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //Photo , add/replace
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: CustomSpacing(context: context, bottom: 1.5),
                  child: Card(
                    elevation: 2,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(37),
                    ),
                    child: CircleAvatar(
                        radius: 36,
                        backgroundColor: Colors.white,
                        child: url != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  url as String,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  "https://saratthi-app.herokuapp.com/api/1655756709545-any-name-image2.jpg",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/Icons/048-write.png",
                      width: getProportionateScreenWidth(
                        6 * w,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        pickImage();
                      },
                      child: CustomText(
                          text: " Add/Replace",
                          color: Colors.grey,
                          fontSize: 17),
                    )
                  ],
                )
              ],
            ),
            //Text Fields----------------------------------------
            //Personal information
            //Row heading of each text area (heading , checkmark , Edit , Save) all inkwell
            Column(
              children: <Widget>[
                ProfileFormHeading(
                  w: w,
                  h: h,
                  Status: true,
                  formHeading: "Personal Information",
                  onEdited: () {},
                  onSaved: () async {
                    var response = await driverPersonalInfo(
                      userId: userId,
                      dob: dob.text,
                      fullName: nameController.text,
                      email: email.text,
                      gender: dropValue,
                    );
                    _upload(image!);
                    Fluttertoast.showToast(
                        msg: "${response.message}",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                ),
                Container(
                  width: getProportionateScreenWidth(95 * w),
                  height: getProportionateScreenHeight(50 * h),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(247, 247, 247, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.0),
                      topRight: Radius.circular(18.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      ProfileFormFields(
                        w: w,
                        hintText: "Full Name",
                        h: h,
                        controller: nameController,
                        iconName: "045-user.png",
                        textInputType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Stack(children: [
                        ProfileFormFields(
                          w: w,
                          hintText: "DateOf Birth",
                          h: h,
                          controller: dob,
                          iconName: "051-birthday-cake.png",
                          textInputType: TextInputType.text,
                        ),
                        Positioned(
                          left: getProportionateScreenWidth(15 * w),
                          child: InkWell(
                            onTap: () {
                              _presentDatePicker();
                              setState(() {
                                dob.text = DateFormat("dd-MMMM-yyyy").format(
                                  DateTime.parse(_selectedDate.toString()),
                                );
                              });
                            },
                            child: Container(
                              color: Colors.transparent,
                              width: getProportionateScreenWidth(70 * w),
                              height: 50,
                            ),
                          ),
                        ),
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset(
                            "assets/Icons/052-gender.png",
                            width: getProportionateScreenWidth(
                              7 * w,
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(70 * w),
                            height: getProportionateScreenHeight(5 * h),
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              hint: const Text('Enter your gender'),
                              decoration: InputDecoration(
                                hintStyle:
                                    TextStyle(color: givenBlue, fontSize: 15),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 5),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Color(0xFF314b5c),
                                    width: 3,
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Color(0xFF314b5c),
                                    width: 3,
                                  ),
                                ),
                              ),
                              value: dropValue,
                              dropdownColor: Colors.white,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropValue = newValue!;
                                  gender.text = dropValue.toString();
                                });
                              },
                              iconDisabledColor: Colors.grey,
                              iconEnabledColor: Colors.black,
                              items: <String>[
                                'Male',
                                'Female',
                                'Others'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      color: Color(0xFF314b5c),
                                      fontFamily: 'Luxia',
                                      fontSize: 16,
                                    ),
                                  ),
                                );
                              }).toList(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ProfileFormFields(
                        w: w,
                        hintText: "Email",
                        h: h,
                        controller: email,
                        iconName: "mail.png",
                        textInputType: TextInputType.emailAddress,
                      ),
                    ],
                  ),
                ),
              ],
            )
            //Making Widget for individual text area
          ],
        ),
      ),
    ));
  }
}

class ProfileFormFields extends StatelessWidget {
  const ProfileFormFields({
    Key? key,
    required this.w,
    required this.h,
    required this.hintText,
    required this.controller,
    required this.iconName,
    required this.textInputType,
  }) : super(key: key);

  final double w;
  final double h;
  final String hintText;
  final TextEditingController controller;
  final String iconName;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset(
          "assets/Icons/$iconName",
          width: getProportionateScreenWidth(
            7 * w,
          ),
        ),
        Container(
          width: getProportionateScreenWidth(70 * w),
          child: TextField(
            keyboardType: textInputType,
            controller: controller,
            style: const TextStyle(
                fontSize: 16, color: Color(0xFF314b5c), fontFamily: 'Luxia'),
            decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: const Color(0xFF314b5c),
                    width: 3,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Color(0xFF314b5c),
                    width: 3,
                  ),
                ),
                hintText: hintText,
                hintStyle: const TextStyle(
                    color: Color(0xFF314b5c), fontFamily: 'Luxia')),
          ),
        ),
      ],
    );
  }
}

class ProfileFormHeading extends StatelessWidget {
  const ProfileFormHeading({
    Key? key,
    required this.w,
    required this.h,
    required this.onSaved,
    required this.onEdited,
    required this.formHeading,
    required this.Status,
  }) : super(key: key);

  final double w;
  final double h;
  final VoidCallback onSaved;
  final VoidCallback onEdited;
  final String formHeading;
  final bool Status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          CustomSpacing(context: context, left: 1, right: 1, top: 5, bottom: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: getProportionateScreenWidth(
              50 * w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomText(text: formHeading, fontSize: 13),
                Image.asset(
                  "assets/Icons/049-check-mark.png",
                  color: Status ? Colors.green : Colors.grey,
                  width: getProportionateScreenWidth(
                    4 * w,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: getProportionateScreenWidth(25 * w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: onEdited,
                  child: CustomText(
                    text: "Edit",
                    fontSize: 13,
                  ),
                ),
                InkWell(
                  onTap: onSaved,
                  child: CustomText(
                    text: "Save",
                    fontSize: 13,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
