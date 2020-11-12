import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AboutMatrix01 extends StatefulWidget {
  @override
  _AboutMatrix01State createState() => _AboutMatrix01State();
}

class _AboutMatrix01State extends State<AboutMatrix01> {



  double angle = 30;
  Size _deviceSize;
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
            Transform(
              // alignment: Alignment.centerLeft,
              alignment: Alignment.center,
                transform: Matrix4(
                1,0,0,0,
                0,1,0,0,
                0,0,1,0,
                0,0,0,1
            )..rotateY(angle*2*pi/360)..translate(
                    // -_deviceSize.width/2

                  -(cos(angle*2*pi/360)*_deviceSize.width/2+_deviceSize.width/2)

                    // -(cos(45*2*pi/360)*_deviceSize.width-_deviceSize.width/2)
                    //     +
                    //     ((_deviceSize.width/2-cos(45*2*pi/360)*_deviceSize.width/2))
                ),
              child: Container(
                width: _deviceSize.width,
                height: _deviceSize.height,
                color: Colors.blue,
                child: Center(child: Text("阿萨的")),
              ),
            ),
            Transform(
              // alignment: Alignment.centerLeft,
              alignment: Alignment.center,
              transform: Matrix4(
                  1,0,0,0,
                  0,1,0,0,
                  0,0,1,0,
                  0,0,0,1
              )..rotateY(-(180-120-angle)*2*pi/360)..translate(
                  // _deviceSize.width/2

                      ((cos(angle*2*pi/360)*_deviceSize.width+cos((90-angle)*2*pi/360)*_deviceSize.width - _deviceSize.width)/2)

              ),
              child: Container(
                width: _deviceSize.width,
                height: _deviceSize.height,
                color: Colors.deepOrange,
                child: Center(child: Text("士大夫")),
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