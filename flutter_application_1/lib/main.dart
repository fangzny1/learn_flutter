import 'package:flutter/material.dart';
import 'package:flutter_application_1/main/index.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "ss", home: Mainpage());
  }
}
