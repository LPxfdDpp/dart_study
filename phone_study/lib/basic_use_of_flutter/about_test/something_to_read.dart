
import 'package:flutter/material.dart';

///
/// 写一些关于测试的东西
///
///
class SomethingToRead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {




    return Container();
  }
}
///这个注释可以使这个内部类在测试时可用
@visibleForTesting
class _GhostFadeTween extends Tween<Color> {
  final Color middle = Colors.white;

  _GhostFadeTween({Color begin,Color end}):super(begin:begin,end:end);

  Color lerp(double t){
    if(t<0.5){
      return Color.lerp(begin, middle, t*2);
    }else{
      return Color.lerp(middle, end, (t-0.5)*2);
    }
  }
}
