import 'package:flutter/material.dart';

void main() {
  runApp(Mainpage());
}

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/goodslist",
      routes: {"/goodslist": (context) => Goodslist()},
    );
  }
}

class Goodslist extends StatefulWidget {
  const Goodslist({super.key});

  @override
  State<Goodslist> createState() => _GoodslistState();
}

class _GoodslistState extends State<Goodslist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("也许吧"), centerTitle: true),
      body: Center(
        child: TextButton(onPressed: () {}, child: Text("加入购物车")),
      ),
    );
  }
}
