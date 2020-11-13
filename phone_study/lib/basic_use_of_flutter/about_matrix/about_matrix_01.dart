import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AboutMatrix01 extends StatefulWidget {
  @override
  _AboutMatrix01State createState() => _AboutMatrix01State();
}

class _AboutMatrix01State extends State<AboutMatrix01> {




  double angle = 90;

  Size _deviceSize;

   double dd = 50;
  @override
  Widget build(BuildContext context) {

    return Center(

      child: GestureDetector(
        onTap: (){
          setState(() {
            angle += pi/2/9;
          });
        },
        child: Stack(
          children: [
            // Transform.rotate(
            //   // alignment: Alignment.centerLeft,
            //   // origin: Offset(_deviceSize.width/2,0),
            //   // origin: Offset(_deviceSize.width/2,0),
            //   origin: Offset(100,0),
            //   alignment: Alignment.center,
            //   // alignment: Alignment.centerRight,
            //   // alignment: Alignment.centerLeft,
            // angle: angle*2*pi/360,
            //   child: Container(
            //     width: _deviceSize.width,
            //     height: _deviceSize.height,
            //     color: Colors.blue,
            //     child: Center(child: Text("阿萨的")),
            //   ),
            // ),
            Transform(
              // alignment: Alignment.centerLeft,
              // origin: Offset(_deviceSize.width/2,0),
              origin: Offset(50,0),
              // origin: Offset(0,0),
              alignment: Alignment.center,
              // alignment: Alignment.centerRight,
              // alignment: Alignment.centerLeft,
                transform: Matrix4(
                1,0,0,0,
                0,1,0,0,
                // 0,0,1,0.001,
                0,0,1,0,
                // 0,-_deviceSize.width/2,0,1
                // 50,-50,0,1
                    0,0,0,1
            )..rotateZ(angle*2*pi/360),
              child: Container(
                width: _deviceSize.width,
                height: _deviceSize.height,
                color: Colors.blue,
                child: Center(child: Text("阿萨的")),
              ),
            ),
          ],
        ),
      ),

    );
  }

  @override
  void initState() {
    super.initState();
    _deviceSize = window.physicalSize / window.devicePixelRatio;
    print(_deviceSize);
  }
}

///Matrix4(
/// a,b,c,d,
/// e,f,g,h,
/// i,j,k,l,
/// m,n,o,p
///)
///缩放
/// a f g 分别对应 x y z 轴的缩放比例
/// 若想同时缩放 x y z 轴 为2倍大小 一起操作 a f g为2是可以的 但下面方法也行：
/// 设置 p 为 1/2 即可 分母2即为倍数
///
///平移
/// m n o 分别对应 x y z 轴的平移距离
///
///透视
/// d h l 分别对应 x y z 轴的透视比例 通常为0.001
///
///旋转
/// 绕x轴旋转
/// 1，  0,     0,     0,
/// 0,cos(x), sin(x),  0,
/// 0,-sin(x), cos(x),  0,
/// 0,  0,      0,      1
///
/// 绕y轴旋转
/// cos(x), 0, -sin(x),  0,
/// 0,      1,    0,      0,
/// sin(x),  0, cos(x),    0,
/// 0,       0,   0,       1
///
/// 绕z轴旋转
/// cos(x),  sin(x),  0, 0,
/// -sin(x), cos(x),  0, 0,
/// 0,         0,     1, 0,
/// 0,         0,     0, 1
///