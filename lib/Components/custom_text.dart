import 'package:flutter/material.dart';

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
