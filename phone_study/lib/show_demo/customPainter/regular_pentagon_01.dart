import 'package:flutter/material.dart';
import 'dart:math' as math;

class RegularPentagon01 extends StatefulWidget {
  @override
  _RegularPentagon01State createState() => _RegularPentagon01State();
}

class _RegularPentagon01State extends State<RegularPentagon01> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("画正五边形"), leading: Icon(Icons.arrow_back_ios)),
        body: Center(
          child: Container(

            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.deepOrange,
                    child: CustomPaint(
                      painter: MyPainer(5,5,5,5,5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainer extends CustomPainter {

  //从顶部开始 顺时针
  //每一项总分是 5 分
  final int va1;
  final int va2;
  final int va3;
  final int va4;
  final int va5;

  MyPainer(this.va1, this.va2, this.va3, this.va4, this.va5);

  @override
  void paint(Canvas canvas, Size size) {
    //va1 位置
    var va1Position = Offset(size.width/2, (size.height/2-size.height/2/5*va1));

    //va2
    //说明：只为好理解用 主要要的是度数 距离x轴正向的角度
    var va2Du = 2*math.pi/4-(2*math.pi)/5;
    //va2 x轴的值
    var va2ZouX = size.width/2 + size.height/2/5*va2*math.cos(va2Du);
    //va2 y轴的值
    var va2ZouY = size.height/2 - size.height/2/5*va2*math.sin(va2Du);
    //va2 位置
    var va2Position = Offset(va2ZouX, va2ZouY);

    //va3
    var va3Du = (2*math.pi)/5 -(2*math.pi/4-(2*math.pi)/5);
    var va3ZouX = size.width/2 + size.height/2/5*va3*math.cos(va3Du);
    var va3ZouY = size.height/2 + size.height/2/5*va3*math.sin(va3Du);
    var va3Position = Offset(va3ZouX,va3ZouY);

    //va4
    var va4Du = (2*math.pi)/5/2;
    var va4ZouX = size.width/2 - size.height/2/5*va4*math.sin(va4Du);
    var va4ZouY = size.height/2 + size.height/2/5*va4*math.cos(va4Du);
    var va4Position = Offset(va4ZouX, va4ZouY);

    //va5
    var va5Du = va2Du;
    var va5ZouX = size.width/2 - size.height/2/5*va5*math.cos(va5Du);
    var va5ZouY = size.height/2 - size.height/2/5*va5*math.sin(va5Du);
    var va5Position = Offset(va5ZouX, va5ZouY);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Color.fromRGBO(226, 242, 238, 1)
      ..strokeWidth = 3.0;

    var path = Path()
      ..moveTo(va1Position.dx, va1Position.dy)
      ..lineTo(va2Position.dx, va2Position.dy)
      ..lineTo(va3Position.dx, va3Position.dy)
      ..lineTo(va4Position.dx, va4Position.dy)
      ..lineTo(va5Position.dx, va5Position.dy)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}
