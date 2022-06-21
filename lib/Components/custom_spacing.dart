import 'package:flutter/material.dart';

import '../Constants/size_config.dart';

EdgeInsets CustomSpacing(
    {BuildContext? context, double top = 0, bottom = 0, left = 0, right = 0}) {
  var w = MediaQuery.of(context!).size.width / 100;
  var h = MediaQuery.of(context).size.height / 100;
  SizeConfig().init(context);
  return EdgeInsets.only(
      top: getProportionateScreenHeight(top * h)!,
      bottom: getProportionateScreenHeight(bottom * h)!,
      right: getProportionateScreenWidth(right * w)!,
      left: getProportionateScreenWidth(left * w)!);
}
