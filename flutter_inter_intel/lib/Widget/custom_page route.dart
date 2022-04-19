import 'package:flutter/material.dart';
class Custompagerout extends PageRouteBuilder{
  final Widget child;
  Custompagerout({this.child}):
  super(
    transitionDuration: Duration(seconds: 2),
    reverseTransitionDuration: Duration(seconds: 2),
    pageBuilder: (context,animation,secondaryAnimation)=>child
  );
  @override
 Widget buildTransitions(BuildContext context,Animation<double> animation,
  Animation<double> secondaryAnimation,Widget child)=>
  ScaleTransition(
    scale:animation,
    child: child,);
}