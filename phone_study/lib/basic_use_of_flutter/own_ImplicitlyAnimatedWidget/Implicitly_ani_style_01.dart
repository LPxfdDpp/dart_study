import 'package:flutter/material.dart';

class ImplicitlyAniStyle01 extends StatefulWidget {
  @override
  _ImplicitlyAniStyle01State createState() => _ImplicitlyAniStyle01State();
}


///有个 todo 这里有个不懂的地方
class _ImplicitlyAniStyle01State extends State<ImplicitlyAniStyle01> {
  var _containerWidth = 150.0;
  var _textSize = 15.0;
  var _textColor = Colors.green;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sad"), leading: Icon(Icons.arrow_back_ios)),
      body: Center(
        child: GestureDetector(
            onTap: () {
              if (_containerWidth == 150) {
                _containerWidth = 200;
              } else {
                _containerWidth = 150;
              }

              if (_textSize == 15) {
                _textSize = 20;
              } else {
                _textSize = 15;
              }

              if (_textColor == Colors.green) {
                _textColor = Colors.orange;
              } else {
                _textColor = Colors.green;
              }

              setState(() {});
            },
            child: MyImplicitlyAni(_containerWidth, _textSize, _textColor)),
      ),
    );
  }
}

class MyImplicitlyAni extends ImplicitlyAnimatedWidget {
  final double targetContainerWidth;
  final double targetContainerTextSize;
  final Color targetContainerTextColor;

  MyImplicitlyAni(this.targetContainerWidth, this.targetContainerTextSize,
      this.targetContainerTextColor,
      {Key key})
      : super(duration: Duration(milliseconds: 500));

  @override
  AnimatedWidgetBaseState<MyImplicitlyAni> createState() =>
      _MyImplicitlyAniState();
}

class _MyImplicitlyAniState extends AnimatedWidgetBaseState<MyImplicitlyAni> {
  Tween _containerWidthTween;
  Tween _containerTextSizeTween;
  ColorTween _containerTextColorTween;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _containerWidthTween.evaluate(animation),
      height: 100,
      decoration: const BoxDecoration(
          border: Border.symmetric(
        horizontal: BorderSide(width: 2, color: Colors.blue),
        vertical: BorderSide(width: 2, color: Colors.brown),
      )),
      alignment: Alignment.center,
      child: Text(
        "点击启动隐含动画",
        style: TextStyle(
          color: _containerTextColorTween.evaluate(animation),
          fontSize: _containerTextSizeTween.evaluate(animation),
        ),
      ),
    );
  }

  @override
  void forEachTween(visitor) {
    ///visitor这方法有够奇怪的 todo forEachTween(visitor) {这个方法调用还不清楚
    _containerTextColorTween = visitor(
      // The latest tween value. Can be `null`.
      _containerTextColorTween,
// The color value toward which we are animating.
      widget.targetContainerTextColor,
// A function that takes a color value and returns a tween
// beginning at that value.
      (value) => ColorTween(begin: value),
    );

    _containerTextSizeTween = visitor(
      _containerTextSizeTween,
      widget.targetContainerTextSize,
      (value) => Tween(begin: value),
    );

    _containerWidthTween = visitor(
      _containerWidthTween,
      widget.targetContainerWidth,
      (value) => Tween(begin: value),
    );
  }
}
