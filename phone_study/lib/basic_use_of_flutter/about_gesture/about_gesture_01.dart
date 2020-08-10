import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AboutGesture01 extends StatefulWidget {
  @override
  _AboutGesture01State createState() => _AboutGesture01State();
}

class _AboutGesture01State extends State<AboutGesture01> {

  var _last = "";

  var _mostLeft;
  var _mostBottom;
  var _mostRight;
  bool _right = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        resizeToAvoidBottomInset: true,
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            child: RawGestureDetector(
              gestures: <Type, GestureRecognizerFactory>{
                PanGestureRecognizer:
                    ///这里检查了个对勾的手势
                GestureRecognizerFactoryWithHandlers<PanGestureRecognizer>(
                        () => PanGestureRecognizer(),
                        (PanGestureRecognizer instance) {

                      instance..onStart = (d){
                        print("onStart");
                        print(d.localPosition);

                        _mostLeft = d.localPosition;
                      };
                      instance..onUpdate = (d){
                        print("onUpdate");
                        if(_mostBottom == null){
                          _mostBottom = d.localPosition;
                        }else if(_mostBottom.dy < d.localPosition.dy){
                          _mostBottom = d.localPosition;
                        }
                        _mostRight = d.localPosition;
                      };
                      instance..onEnd = (_){
                        print("onEnd");

                        var AB      = math.sqrt(math.pow(_mostBottom.dx-_mostLeft.dx,2)+math.pow(_mostBottom.dy-_mostLeft.dy,2));
                        var AC      = math.sqrt(math.pow(_mostBottom.dx-_mostRight.dx,2)+math.pow(_mostBottom.dy-_mostRight.dy,2));
                        var BC      = math.sqrt(math.pow(_mostLeft.dx-_mostRight.dx,2)+math.pow(_mostLeft.dy-_mostRight.dy,2));
                        var cosA   = (math.pow(AB,2)+math.pow(AC,2)-math.pow(BC,2)) / (2*AB*AC);
                        var angleA  = math.acos(cosA)*180/math.pi;

                        print(AB);
                        print(AC);
                        print(cosA);
                        print(angleA);

                        if(AB > 60 && AC > 60 && angleA > 25){
                          print("对勾");
                          _right = true;
                        }else{
                          _mostRight = _mostBottom = _mostLeft = null;
                          _right = false;
                        }
                      };
                    }),
                TapGestureRecognizer:
                GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
                      () => TapGestureRecognizer(),
                      (TapGestureRecognizer instance) {
                    instance
                      ..onTapDown = (TapDownDetails details) {
                        print("onTapDown");
                        setState(() {
                          _last = 'down';
                        });
                      }
                      ..onTapUp = (TapUpDetails details) {
                        print("onTapUp");
                        setState(() {
                          _last = 'up';
                        });
                      }
                      ..onTap = () {
                        print("onTap");
                        setState(() {
                          _last = 'tap';
                        });
                      }
                      ..onTapCancel = () {
                        print("onTapCancel");
                        setState(() {
                          _last = 'cancel';
                        });
                      };
                  },
                ),
              },
              child: Container(
                  width: 300.0,
                  height: 300.0,
                  color: Colors.yellow,
                  child: Text(_last)),
            ),
          ),
        ));
  }
}
