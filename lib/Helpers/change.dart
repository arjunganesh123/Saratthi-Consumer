import 'package:flutter/cupertino.dart';

class Change {
  String image;
  double width;
  Color changecolor;
  List<String> carModels;
  Change(
      {required this.image,
      required this.width,
      required this.changecolor,
      required this.carModels});
}

class Change2 {
  String image;
  bool isVisible;
  Color changecolor;
  List<String> carModels;
  Change2(
      {required this.image,
      required this.changecolor,
      required this.isVisible,
      required this.carModels});
}

class Refer {
  String image;
  Refer({required this.image});
}

class ModelAndRegister{
  String Model;
  String Register;
  ModelAndRegister({required this.Model,required this.Register});
}