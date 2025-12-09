import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "老了都不记得了",
      home: Scaffold(
        appBar: AppBar(title: Text("列表项"), centerTitle: true),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // print("点击了第${index + 1}项");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Detail();
                    },
                  ),
                );
              },
              child: Container(
                color: Colors.blue,
                height: 100,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "列表${index + 1}",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            );
          },
          itemCount: 100,
        ),
      ),
    );
  }
}

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("详情页面"), centerTitle: true),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("点击返回"),
        ),
      ),
    );
  }
}
