import 'dart:async';
import 'dart:collection';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math' as math;
import 'package:dio/dio.dart';

/**
 * 学习用
 */
class PrePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PrePageState();
}

class PrePageState extends State<PrePage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);

//    Expanded
//    Column
//    Positioned
//    SliverList
//    CustomScrollView


    
    return Scaffold(
      backgroundColor: Colors.amber,
      resizeToAvoidBottomInset:true,
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.deepOrange,
          child: CustomPaint(
            painter: MyPainer(dianShu:9,alreadyShowed: 3,jingdu: 0.6),
          ),
        ),
      ),
    );



  }


  ///RenderObjectElement CustomSingleChildLayout
  ///BoxScrollView SliverMultiBoxAdaptorWidget RenderSliverMultiBoxAdaptor SliverMultiBoxAdaptorParentData继续
  ///
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
//    AnimatedContainer DecoratedBoxTransition AnimatedPositioned
//    Flexible 使 Text 换行
//    provider/provider.dart -> ChangeNotifierProvider MultiProvider
//    List<int>.generate(6, (index) => index).map((e) => null)
//    测试相关 Timeline.startSync FlutterDriver chrome://tracing flutter drive --target=test_driver/app.dart --profile
//    Builder
//    IndexedStack
//    CheckboxListTile Switch
    /// Viewport AnimatedList FractionalOffset ListWheelScrollView HitTestBehavior KeyedSubtree AutomaticKeepAlive待
    /// FocusScope 待 鸡肋
//    Placeholder
//    Row IntrinsicHeight
//    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, BottomAppBar( shape:CircularNotchedRectangle()
//    showSearch(context: null, delegate: null)
//    PageStorageKey
//    showModalBottomSheet(context: null, builder: null)
//    ImplicitlyAnimatedWidget Boring show 27
//    Listener
//    OverflowBox
//    StatefulBuilder
//    NotificationListener<ScrollNotification>
//    TickerMode
//    PrimaryScrollController
//    FocusScope.of(context).requestFocus(FocusNode());
//    Function .call()

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
//    AbsorbPointer IgnorePointer
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

    //Schedule a callback for the end of this frame. 可在build之前设置个回调
//    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//
//    });
//    RenderPointerListener
//    Layer 现在有几层
//    Widget BuildOwner PipelineOwner
//    RepaintBoundary SingleChildScrollView

  //小玩意
//    AnimatedSwitcher
//    ColorFiltered
//    InkWell

  }
}
class MyPainer extends CustomPainter {

  //总点的个数
  final dianShu;
  //已经显示的点
  final int alreadyShowed;
  //当前进度 百分比
  final jingdu;

  MyPainer({this.dianShu,this.alreadyShowed,this.jingdu});

  @override
  void paint(Canvas canvas, Size size) {
    print(size.height);

    //点的总宽度
    var dianWidth = size.width/8;
    //每个点的宽度 也即是他们的高度 也即是控件的高度
    var eachWH = dianWidth/(dianShu);
    //进度bar的总宽度
    var totalProgress;
    if(alreadyShowed != null) {
      totalProgress = size.width - eachWH*(dianShu+dianShu+1);//需要给空间
    }else{
      totalProgress = size.width - eachWH*(dianShu+dianShu+2);
    }
    //进度的宽度
    var jingDuProcess = totalProgress*jingdu;

    //圆圈的笔
    var pain = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Color.fromRGBO(0, 168, 126, 1)
      ..strokeWidth = 1.0;

    var jingDuProcessPain = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.blue
      ..strokeWidth = 1.0;

    //循环画左边的圈
    var temp = 0;
    while(temp<alreadyShowed){
      canvas.drawOval(Rect.fromCircle(center:Offset((2*temp+1)*eachWH+eachWH/2, eachWH/2),radius: eachWH/2), pain);
      temp++;
    }
    //画进度条背景
    canvas.drawRect(Rect.fromLTWH((alreadyShowed+alreadyShowed+1)*eachWH, 0, totalProgress, eachWH), pain);
    //画进度条进度
    canvas.drawRect(Rect.fromLTWH((alreadyShowed+alreadyShowed+1)*eachWH, 0, totalProgress, eachWH), pain);
    canvas.drawRect(Rect.fromLTWH((alreadyShowed+alreadyShowed+1)*eachWH, 0, jingDuProcess, eachWH), jingDuProcessPain);
    //循环画右边的圈
    temp = 0;
    while(temp<dianShu-alreadyShowed){
      canvas.drawOval(Rect.fromCircle(center:Offset(((alreadyShowed+alreadyShowed+1)*eachWH)+totalProgress+((2*temp+1)*eachWH+eachWH/2), eachWH/2),radius: eachWH/2), pain);
      temp++;
    }




  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}