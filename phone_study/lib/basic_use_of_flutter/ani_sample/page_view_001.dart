import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class PageView001 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageView001State();
}

class PageView001State extends State<PageView001> with SingleTickerProviderStateMixin {
  PageController pageController;
  AnimationController _animationController;
  int current = 0;

  @override
  Widget build(BuildContext context) {
    if (_animationController == null) {
      _animationController =
          AnimationController.unbounded(value: 0, vsync: this);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("hello"),
        ),
        body: PageView.builder(
            itemCount: iiiitems.length,
            controller: pageController,
            itemBuilder: (context, index) {
              Color ppp;
              if (index == 1) {
                ppp = Colors.green;
              } else if (index == 2) {
                ppp = Colors.deepPurpleAccent;
              } else if (index == 3) {
                ppp = Colors.deepOrangeAccent;
              } else {
                ppp = Colors.blueGrey;
              }

              return AnimatedBuilder(
                  key: Key(index.toString()),
                  animation: _animationController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: 1.0,
                      child: Transform.translate(
                        offset: Offset(getOffset(index), 0),
                        child: child,
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.cyan, width: 2)),
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        color: ppp ?? Colors.transparent,
                        child: Text(iiiitems[index].toString()),
                      ),
                    ),
                  ));
            }));
  }

  List<int> iiiitems = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  double pre = 0;
  int thisCurrent = 0;
  double after;

  @override
  void initState() {
    super.initState();
    pageController = PageController()
      ..addListener(() {
        var ww = MediaQuery.of(context).size.width;

        var ppp = pageController.position.pixels;
        int kp = (ppp + ww) ~/ ww;
        double sy = (ppp + ww) % ww;

//      if(sy >= ww/2){
//        current = kp;
//      }else{
//        current = kp-1;
//      }

        if (thisCurrent == -1) {
          if (sy >= ww / 2) {
            thisCurrent = kp;
          } else {
            thisCurrent = kp - 1;
          }
        }

        _animationController.value = (ppp > pre) ? sy : -sy;
      });

    Timer(Duration(milliseconds: 32), () {
      pageController.position.isScrollingNotifier.addListener(() {
        if (pageController.position.isScrollingNotifier.value) {
          pre = pageController.position.pixels;
          thisCurrent = -1;
        }
//        else{
//          after = pageController.position.pixels;
//        }
      });
    });
  }

  getOffset(int index) {
    if (_animationController.value > 0) {
      //左滑
      if (index == thisCurrent) {
        return 0.0;
      } else if (index < thisCurrent) {
        return 0.0;
      } else if (index == thisCurrent + 1) {
        return -MediaQuery.of(context).size.width +
            (_animationController.value);
      } else {
        return 0.0;
      }
    } else {
      //右滑
     return 0.0;//左右滑动会有不同的效果

      // if (index == thisCurrent) {
      //   return 0.0;
      // } else if (index == thisCurrent - 1) {
      //   return MediaQuery.of(context).size.width + (_animationController.value);
      // } else if (index > thisCurrent) {
      //   return 0.0;
      // } else {
      //   return 0.0;
      // }
    }
  }







}
