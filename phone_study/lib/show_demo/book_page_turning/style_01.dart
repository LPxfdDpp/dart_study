


import 'package:flutter/material.dart';
import 'dart:math' as math;

double _smallPlace;
int currentPlace = 100;
//默认书的宽度
double _bookWidth;

class Style01 extends StatefulWidget {
  @override
  _Style01State createState() => _Style01State();
}

class _Style01State extends State<Style01> with SingleTickerProviderStateMixin {

  AnimationController openAnimation;

  double _phoneWidth;


  //默认书的高度
  double _bookHeight;
  //书的页数
  final int _pages = 5;

  @override
  void initState() {
    super.initState();

    openAnimation = AnimationController(
      lowerBound: 1,
      upperBound: 6,
      duration: Duration(microseconds: 1000*5),
      vsync: this,
    );
  }

  double initial = 0.0;

  final List<String> list = <String>["Home", "Feed", "Chat", "Settings", "About"];

  Widget buildItem(int index) {

    print("buildItembuildItem : "+index.toString());

    return GestureDetector(
      onTap: () {
        currentPlace = index;
        openAnimation.animateTo((_pages-index+1)+0.0,duration: Duration(milliseconds: 1000));
      },
      child: Container(
        width:_bookWidth,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Center(
          child: Text(index.toString(),style: TextStyle(fontSize: 20),),
        ),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    print("buildbuildbuildbuildbuildbuildbuild");
    _phoneWidth = MediaQuery.of(context).size.width;
    _bookWidth = _phoneWidth*6/10;
//    _smallPlace = (_phoneWidth - _bookWidth - 12)/_pages;
    _smallPlace = 5;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            color: Colors.blueGrey,
            child: Flow(
              delegate: SampleFlowDelegate(openAnimation: openAnimation),
              children: List<Widget>.generate(5, (index) => buildItem(index)),
            ),
          ),
        ),
      ),
    );
  }


}


class SampleFlowDelegate extends FlowDelegate {
  SampleFlowDelegate({this.openAnimation}) : super(repaint: openAnimation);

  final Animation<double> openAnimation;

  @override
  bool shouldRepaint(SampleFlowDelegate oldDelegate) {
//    return openAnimation.value != oldDelegate.openAnimation.value;
    return true;
  }

  @override
  void paintChildren(FlowPaintingContext context) {


    /// 4 1-2
    /// 3 2-3
    /// 2 3-4
    /// 1 4-5
    /// 0 5-6

    for (int i = 0; i < context.childCount; ++i) {
      if(currentPlace < i){
//        context.paintChild(i);
        print("currentPlace < i");
      }else{
        if(openAnimation.isDismissed){
          context.paintChild(
            i,
            transform:
            Matrix4
              (
                1, 0, 0, 0,
                0, 1, 0, 0,
                0,0, 1, 0,
                0,0, 0, 1
            )..translate(_smallPlace*(5-i-1),-3.0*(5-i-1)),
          );
        }else{

          context.paintChild(
            i,
            transform:
            Matrix4
              (
                1, 0, 0, 0,
                0, 1, 0, 0,
                0,0, 1, 0.001,
                0,0, 0, 1
            )..translate(
//                i == currentPlace ? -_bookWidth*(openAnimation.value-(5-currentPlace)) :
                i == currentPlace ? 0.0:
                (5-i-1-(5-currentPlace-1))*_smallPlace*(1-(openAnimation.value-(5-currentPlace))*(1/(currentPlace-i)))
                ,

                i == currentPlace?0:
                -(5-i-1-(5-currentPlace-1))*3*(1-(openAnimation.value-(5-currentPlace))*(1/(currentPlace-i)))
            )..rotateY(i == currentPlace ?2*math.pi/4*(openAnimation.value-(5-currentPlace)):0),
          );
        }
      }
    }


  }
}