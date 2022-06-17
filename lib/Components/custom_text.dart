import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget CustomText({
  String? text,
  double? fontSize,
  FontWeight? fontWeight,
  String? fontFamily,
  Color? color,
  TextAlign? position,
}) {
  return Text(
    '$text',
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    ),
    textAlign: position,
  );
}
