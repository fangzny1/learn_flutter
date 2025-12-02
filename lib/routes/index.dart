import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Main/index.dart';
import 'package:flutter_application_1/pages/login/index.dart';

Widget getRootWidget() {
  return MaterialApp(routes: getRootroute());
}

Map<String, Widget Function(BuildContext)> getRootroute() {
  return {"/": (context) => Mainpage(), '/login': (context) => Loginpage()};
}
