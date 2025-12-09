import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodels/home.dart';

class Hmslider extends StatefulWidget {
  final List<BannerItem> BannerList;
  const Hmslider({super.key, required this.BannerList});

  @override
  State<Hmslider> createState() => _HmsliderState();
}

class _HmsliderState extends State<Hmslider> {
  CarouselSliderController _controller = CarouselSliderController();
  int _currentindex = 0;
  Widget _getsilder() {
    final double screenWith = MediaQuery.of(context).size.width;
    return CarouselSlider(
      carouselController: _controller,
      items: List.generate(widget.BannerList.length, (int index) {
        return Image.network(
          widget.BannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: screenWith,
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        onPageChanged: (index, reason) {
          _currentindex = index;
          setState(() {});
        },
        autoPlayInterval: Duration(seconds: 2),
      ),
    );
  }

  double _seacrchopacity = 0.4;
  Widget _getSearch() {
    return Positioned(
      left: 0,
      right: 0,
      top: 10,

      child: Padding(
        padding: EdgeInsets.all(5),
        child: GestureDetector(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.4),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.only(left: 15, top: 8),
            child: Text(
              "搜索...",
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, _seacrchopacity),
                fontSize: 15,
              ),
            ),
          ),
          onTap: () {
            _seacrchopacity = 0.9;
            setState(() {});
          },
          onDoubleTap: () {
            _seacrchopacity = 0.4;
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget _getdot() {
    return Positioned(
      bottom: 8,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 30,
        width: double.infinity,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.BannerList.length, (int index) {
            return GestureDetector(
              child: AnimatedContainer(
                height: 6,
                duration: Duration(milliseconds: 300),
                width: index == _currentindex ? 40 : 20,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: index == _currentindex
                      ? Color.fromRGBO(255, 255, 255, 1)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onTap: () {
                _controller.jumpToPage(index);
              },
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getsilder(), _getSearch(), _getdot()]);
  }
}
