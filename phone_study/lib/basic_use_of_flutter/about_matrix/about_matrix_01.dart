import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:phone_study/basic_use_of_flutter/about_matrix/change_pack/mid_animation_controller.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

class AboutMatrix01 extends StatefulWidget {
  @override
  _AboutMatrix01State createState() => _AboutMatrix01State();
}

class _AboutMatrix01State extends State<AboutMatrix01> with SingleTickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    print('============================================');
    print(_deviceSize);

    return Center(

      child: GestureDetector(
        onTap: (){
          _animationController.value = 0;
        },
        onHorizontalDragStart: (d){
          _horizontalDragStartXPoint = _horizontalDragUpdateXPoint = d.globalPosition.dx;
        },
        onHorizontalDragUpdate: (d){
          if(d.globalPosition.dx > _horizontalDragUpdateXPoint){
            _animationController.value += smallPart*2*pi/360;
          }else if(d.globalPosition.dx < _horizontalDragUpdateXPoint){
            _animationController.value -= smallPart*2*pi/360;
          }
          _horizontalDragUpdateXPoint = d.globalPosition.dx;
        },
        onHorizontalDragEnd: (d){

        },
        child:Stack(
          children: [
            GestureDetector(
              onHorizontalDragStart: (d){

              },
              onHorizontalDragUpdate: (d){

                var dx = d.globalPosition.dx;
                var xFraction = dx/_deviceSize.width;
                print("----------------------------------");
                print(xFraction);
                _animationController.value = xFraction;
              },
              onHorizontalDragEnd: (d){

              },
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (_,child){
                  return Transform(
                    alignment: Alignment.centerRight,
                    transform:
                    ///001
                    // Matrix4.diagonal3Values(1, 1, 1)
                    // ..rotateX(pi/6)
                    // // ..rotateY(pi/6)
                    // // ..rotateZ(pi/6)
                    // ,

                    ///002
                    Matrix4(
                        1,0,0,0,
                        0,1,0,0,
                        // 0,0,1,0.005,
                        0,0,1,0.005,
                        // 0,-_deviceSize.width/2,0,1
                        // 50,-50,0,1
                        0,0,0,1
                    )
                      // ..rotateX(pi/6)
                  ..rotateY(pi/6)
                  // // ..rotateZ(pi/6)
                  //   ..translate(0.0,0,0)
                    ///003
                    // Matrix4.compose(Vector3(40,0,0), Quaternion(0,0,0,0), Vector3(1,1,1))
                    ,
                    child: child,
                  );
                },
                child: Container(
                  width: _deviceSize.width,
                  height: _deviceSize.height,
                  color: Colors.blue,
                  child: Center(child: Text("阿萨的")),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: left),
              width: 50,
              height: 50,
              color: Colors.orange,
            )
          ],
        ),
      ),

    );
  }

  double _horizontalDragStartXPoint;
  double _horizontalDragUpdateXPoint;
  double smallPart = 9;
  double left = 50;
  AnimationController _animationController;
  Size _deviceSize;
  @override
  void initState() {
    super.initState();
    _deviceSize = window.physicalSize / window.devicePixelRatio;

    _animationController = AnimationController(value:0,vsync: this);
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