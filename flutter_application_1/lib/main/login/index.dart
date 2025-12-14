import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/home.dart';
import 'package:flutter_application_1/compontents/home/HMHot.dart';
import 'package:flutter_application_1/compontents/home/HmCategory.dart';
import 'package:flutter_application_1/compontents/home/HmMoreList.dart';

import 'package:flutter_application_1/compontents/home/HmSlider.dart';
import 'package:flutter_application_1/compontents/home/HmSuggetion.dart';
import 'package:flutter_application_1/viewmodels/home.dart';

class LoginMainpage extends StatefulWidget {
  const LoginMainpage({super.key});

  @override
  State<LoginMainpage> createState() => _LoginMainpageState();
}

//写乱了应该是home的这个ww
class _LoginMainpageState extends State<LoginMainpage> {
  List<BannerItem> _Bannerlist = [
    // BannerItem(
    //   id: "1",
    //   imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg",
    // ),
    // BannerItem(
    //   id: "2",
    //   imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png",
    // ),
    // BannerItem(
    //   id: "3",
    //   imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg",
    // ),
  ];

  List<Widget> _getScrollChildren() {
    return [
      SliverToBoxAdapter(child: Hmslider(BannerList: _Bannerlist)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Hmcategory()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Hmsuggetion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: Hmhot()),
              SizedBox(width: 10),
              Expanded(child: Hmhot()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      Hmmorelist(),
    ];
  }

  @override
  void initState() {
    super.initState();
    _getBannerList();
  }

  void _getBannerList() async {
    _Bannerlist = await getBanerListAPI();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
