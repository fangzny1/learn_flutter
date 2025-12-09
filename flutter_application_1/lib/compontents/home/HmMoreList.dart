import 'package:flutter/material.dart';

class Hmmorelist extends StatefulWidget {
  const Hmmorelist({super.key});

  @override
  State<Hmmorelist> createState() => _HmmorelistState();
}

class _HmmorelistState extends State<Hmmorelist> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          color: Colors.blue,
          child: Text("${index + 1}", style: TextStyle(color: Colors.white)),
        );
      },
    );
  }
}
