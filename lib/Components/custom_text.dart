import 'package:flutter/material.dart';

import '../Constants/size_config.dart';

Widget CustomText({
  String? text,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  TextAlign? position,
}) {
  return Text(
    '$text',
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    textAlign: position,
  );
}
