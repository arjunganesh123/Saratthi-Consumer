import 'package:flutter/material.dart';

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    const dx = -10.0;
    const dy = 0.0;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return SlideTransition(
      child: child,
      position: new Tween<Offset>(
        begin: Offset(dx, dy),
        end: Offset.zero,
      ).animate(animation),
    );
  }
}
