import 'package:flutter/material.dart';
import 'dart:math' as math;


class CustomerPainter01 extends StatefulWidget {




  String _kkk = "";


  String get kkk => _kkk;

  set kkk(String value) {
    _kkk = value;
  }

  @override
  _CustomerPainter01State createState() => _CustomerPainter01State();
}

class _CustomerPainter01State extends State<CustomerPainter01> {
  @override
  Widget build(BuildContext context) {



    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("asdf"), leading: Icon(Icons.arrow_back_ios)),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.deepOrange,
            child: CustomPaint(
              painter: MyPainer(),
            ),
          ),
        ),
      ),
    );
  }
}
class MyPainer extends CustomPainter {
  //100为满元
  final double percentage;
  MyPainer({this.percentage = 60});

  @override
  void paint(Canvas canvas, Size size) {

    //有点意思
//    var painn = Paint()
//      ..style = PaintingStyle.fill
//      ..strokeWidth = 10
//      ..shader = SweepGradient(
//        colors: [
//      Colors.green[100],
//      Colors.green[500],
//      Colors.green[700],
//      Colors.green[300],
//      Colors.green[500],
//    ],stops: [
//        0.2,
//        0.4,
//        0.6,
//        0.8,
//        1
//      ]
//
//      ).createShader(Offset(0, 0) & Size(size.width, size.height));
////    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height ), painn);
//  canvas.drawOval(Rect.fromLTWH(0, 0, size.width, size.height ), painn);

    print("ppp");
    print(size.height);
    //默认从180度的地方顺时针转
    //默认半径
    var r = 70;
    //默认半圆28个点(解释 ：分 27 份 实际上还有个0度)
    var duPiece = math.pi/27;
    //中心点位置
    var centerX = size.width/2;
    var centerY = size.height/2;
    //默认线条的长度
    var lineLength = 10;

    //范围内的画笔
    var pain = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Color.fromRGBO(0, 168, 126, 1)
      ..strokeWidth = 3.0;
    //范围外的画笔
    var pain2 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Color.fromRGBO(226, 242, 238, 1)
      ..strokeWidth = 3.0;

    for (var i = 0; i < 28; ++i) {
      var thisDu = duPiece*i;
      //某个角度的原始点
      var temp = Offset(centerX-r*math.cos(thisDu), centerY-r*math.sin(thisDu));
      //某个角度的下点
      var bottom = Offset(centerX-r*math.cos(thisDu)+lineLength*math.cos(thisDu), centerY-(r*math.sin(thisDu)-lineLength*math.sin(thisDu)));
      //某个角度的上点
      var top = Offset(centerX-r*math.cos(thisDu)-lineLength*math.cos(thisDu), centerY-(r*math.sin(thisDu)+lineLength*math.sin(thisDu)));
      if(i <= percentage*28~/100){
        canvas.drawLine(bottom, top, pain);
      }else{
        canvas.drawLine(bottom, top, pain2);
      }
    }

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}