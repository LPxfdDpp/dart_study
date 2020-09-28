import 'package:flutter/material.dart';


//不规范
class OwnTween01 extends StatefulWidget {
  @override
  _OwnTween01State createState() => _OwnTween01State();
}

class _OwnTween01State extends State<OwnTween01>  with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  final myIntTween = MyIntTween(begin: 100,end: 200);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _animationController..addListener((){
        setState(() {
        });
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (){
          if(_animationController.isDismissed){
            _animationController.forward();
          }else if(_animationController.isCompleted){
            _animationController.reverse();
          }
        },
        child: Container(
//          width: myIntTween.lerp(_animationController.value)+0.0,
          width: myIntTween.beginMiddleEnd(_animationController.value)+0.0,
//          height: myIntTween.lerp(_animationController.value)+0.0,
          height: myIntTween.beginMiddleEnd(_animationController.value)+0.0,
          color: Colors.orange,
        ),
      ),
    );
  }
}

class MyIntTween extends Tween<int> {
  /// Creates a fractional offset tween.
  ///
  /// The [begin] and [end] properties may be null; the null value
  /// is treated as meaning the center.
  MyIntTween({ int begin, int end })
      : super(begin: begin, end: end);

  /// Returns the value this variable has at the given animation clock value.
  @override
  int lerp(double t) {
    //正常用法 顺滑体验
    return  (begin+(end-begin)*t).floor();
  }

  //自定义用法
  int beginMiddleEnd(double t){
    if(t<0.5){
      return  (begin+(end-begin)*(2*t)).floor();
    }else{
      return  (end+(begin-end)*(t-0.5)*2).floor();
    }
  }
}


