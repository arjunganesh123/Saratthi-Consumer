import 'package:flutter/material.dart';

import '../Views/Login/join.dart';
import '../Views/Login/verify.dart';

final Map<String, WidgetBuilder> routes = {
  Join.routeName: (context) => const Join(),
  // Verify.routeName: (context) => Verify(),
};
