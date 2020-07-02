import 'dart:collection';
import 'dart:developer';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';
import 'package:google_fonts/google_fonts.dart';

/**
 * 学习用
 */
class PrePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PrePageState();
}

class PrePageState extends State<PrePage> with SingleTickerProviderStateMixin {

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this,lowerBound: 0,upperBound: 10,duration: Duration(seconds: 1))
    ..addListener(() {
      setState(() {

      });
    })..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  var _phoneWidth;
  @override
  Widget build(BuildContext context) {
    _phoneWidth ??= MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("收付款"),
            leading:Icon(Icons.arrow_back_ios)
        ),
        body:Center(
          child: CustomPaint(
            painter: MyPainer(_animationController.value),
            child: GestureDetector(
              onTap: (){
                if(_animationController.isAnimating){
                  _animationController.stop();
                }else{
                  _animationController.repeat();
                }
              },
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(6))
                ),
                alignment: Alignment.center,
                child: Text("data"),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///
  /// Widget 看到第30集
  /// Boring Flutter 看到第2集
  ///
  ///
  ///
  ///
  whatsThis() {
//    ///document注释 会有提示
//    Future.wait(futures) Future.wait(futures).asStream()
//    build_value
//    List.unmodifiable(elements)(会拷贝) UnmodifiableListView(不会拷贝)  dart.collection
//    rxdart PublishSubject BehaviorSubject ReplaySubject
//    PageRouteBuilder Visibility
//    CircularProgressIndicator
//    Lock
//    Timer ChangeNotifier ValueNotifier
//    Form(key _formKey.currentState.validate()  GlobalKey<FormState> TextFormField(validator
//    DecoratedB.oxposition = DecorationPosition.foreground,
//    ListView.builder(physics NeverScrollableScrollPhysics
//    precacheImage(
//    Offstage
//    Flexible LimitedBox ConstrainedBox SizedBox SizedBox.expand FractionallySizedBox widthFactor: 0.2
//    IconButton
//    TextField InputDecoration
//    Spacer
//    0.9.clamp(-1, 1))
//    PageView.builder(itemBuilder: null) ClampingScrollPhysics
//    EventChannel A named channel for communicating with platform plugins using event streams.
//    Future<Null>  Future<void>
//    [].take(count);
//    Slider
//    AnimatedContainer DecoratedBoxTransition
//    Flexible 使 Text 换行
//    provider/provider.dart -> ChangeNotifierProvider MultiProvider
//    List<int>.generate(6, (index) => index).map((e) => null)
//    测试相关 Timeline.startSync FlutterDriver chrome://tracing flutter drive --target=test_driver/app.dart --profile
//    Builder
//    IndexedStack
//    CheckboxListTile
///  AnimatedList FractionalOffset ListWheelScrollView 待
//    Placeholder



//    RefreshIndicator
//    mainAxisAlignment: MainAxisAlignment.spaceBetween, Row
//    ExpansionTile ListView
//    constraints: BoxConstraints.expand(),
//    mounted
//    Completer
//    PageView
//    Hero
//    FittedBox
//    Scaffold.of(context).showBottomSheet((context) => null)
//    CustomPaint CustomPainter canvas.drawArc(Rect.fromCircle(center: center,radius: 100), 0, 3.1415926, false, Paint()); path.quadraticBezierTo(


//    RotatedBox
//    Transform Matrix4.skewX
//    AnimatedContainer
//    AnimatedOpacity
//    PageView
//    Table TableRow
//    CustomScrollView SliverAppBar SliverGrid SliverFixedExtentList
//    FadeInImage
//    InheritedWidget InheritedModel
//    ClipRRect ClipPath
//    Tooltip
//    LayoutBuilder
//    AbsorbPointer
//    Transform
//    BackdropFilter ImageFilter Stack
//    Dismissible
//    ShaderMask
//    Drawer Scaffold
//    DataTable SingleChildScrollView
//    ListTile
//    FractionallySizedBox
//    Semantics
//    AspectRatio Expanded Align
//    Flexible
  }
}

class MyPainer extends CustomPainter {

  double offset;

  MyPainer(this.offset);


  void paint(Canvas canvas, Size size) {

    if(offset > 10){
      offset = 0.0;
    }


    var limitWidth = size.width;
    var limitHeight = size.height;

    Paint line = new Paint()
      ..color = Colors.lightBlueAccent
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    //上下左右 顺时针画
    var usedWidthTop = 0.0+offset;
    while (usedWidthTop < limitWidth){
      canvas.drawLine(Offset(usedWidthTop, -10),  Offset(usedWidthTop+10, -10), line);
      usedWidthTop += 40;
    }
    var usedHeightRight = 0.0+offset;
    while (usedHeightRight < limitHeight){
      canvas.drawLine(Offset(limitWidth+10, usedHeightRight),  Offset(limitWidth+10, usedHeightRight+10), line);
      usedHeightRight += 40;
    }
    var usedWidthBottom = limitWidth-offset;
    while (usedWidthBottom > 0){
      canvas.drawLine(Offset(usedWidthBottom, limitHeight+10),  Offset(usedWidthBottom-10, limitHeight+10), line);
      usedWidthBottom -= 40;
    }
    var usedHeightLeft = limitHeight-offset;
    while (usedHeightLeft > 0){
      canvas.drawLine(Offset(-10, usedHeightLeft),  Offset(-10, usedHeightLeft-10), line);
      usedHeightLeft -= 40;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}


