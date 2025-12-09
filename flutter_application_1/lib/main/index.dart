import 'package:flutter/material.dart';
import 'package:flutter_application_1/main/cart/index.dart';
import 'package:flutter_application_1/main/category/index.dart';
import 'package:flutter_application_1/main/home/index.dart';
import 'package:flutter_application_1/main/login/index.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _currentindex = 0;
  final List<Map<String, String>> _tablist = [
    {
      "icon": "lib/asset/ic_public_home_normal.png",
      "active_icon": "lib/asset/ic_public_home_active.png",
      "text": "首页",
    },
    {
      "icon": "lib/asset/ic_public_pro_normal.png",
      "active_icon": "lib/asset/ic_public_pro_active.png",
      "text": "分类",
    },
    {
      "icon": "lib/asset/ic_public_cart_normal.png",
      "active_icon": "lib/asset/ic_public_cart_active.png",
      "text": "购物车",
    },
    {
      "icon": "lib/asset/ic_public_my_normal.png",
      "active_icon": "lib/asset/ic_public_my_active.png",
      "text": "我的",
    },
  ];

  List<BottomNavigationBarItem> _getTabBarWiget() {
    return List.generate(_tablist.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_tablist[index]["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _tablist[index]["active_icon"]!,
          width: 30,
          height: 30,
        ),
        label: _tablist[index]["text"],
      );
    });
  }

  List<Widget> _getchildren() {
    return [LoginMainpage(), Categorypage(), Cartpage(), Homepage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentindex, children: _getchildren()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: _currentindex,
        onTap: (value) {
          _currentindex = value;
          setState(() {});
        },
        items: _getTabBarWiget(),
      ),
    );
  }
}
