import 'package:flutter/material.dart';

class Hmsuggetion extends StatefulWidget {
  const Hmsuggetion({super.key});

  @override
  State<Hmsuggetion> createState() => _HmsuggetionState();
}

class _HmsuggetionState extends State<Hmsuggetion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Container(
        height: 300,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.blue),
        child: Text("推荐", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
