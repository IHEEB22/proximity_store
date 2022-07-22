import 'package:flutter/cupertino.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget Route;
  CustomPageRoute({
    required this.Route,
    required RouteSettings? settings,
  }) : super(
          transitionDuration: Duration(seconds: 3),
          pageBuilder: (context, animation, secondaryAnimation) => Route,
          settings: settings,
        );
  Widget buidTransitions(
          BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget route) =>
      SlideTransition(
        position: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero).animate(animation),
        child: route,
      );
}
