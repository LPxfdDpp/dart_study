import 'dart:async';
import 'dart:collection';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math' as math;
import 'package:dio/dio.dart';

import 'explore.dart';

import 'package:vector_math/vector_math_64.dart' hide Colors;

/**
 * 学习用
 */
class PrePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PrePageState();
}

class PrePageState extends State<PrePage> with SingleTickerProviderStateMixin {

  Animation _animation;
  Animation _animationP;
  AnimationController _animationController;





  Key _key = ValueKey("value");




ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 5000));



  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }



 var _deviceW;
 var _deviceH;
  @override
  Widget build(BuildContext context) {
    if(_deviceW == null) _deviceW = MediaQuery.of(context).size.width;
    if(_deviceH == null) _deviceH = MediaQuery.of(context).size.height;



//    CustomScrollView
//    SliverList
//    ListView
//    RenderSliverList
//    SliverPadding



    print("build(BuildContext context)");



    return Scaffold(
        backgroundColor: Colors.amber,
        resizeToAvoidBottomInset: true,
        body:
        SafeArea(
          child: Center(
            child:
            NotificationListener<ScrollUpdateNotification>(
              child: Scrollable(
                viewportBuilder: (BuildContext context, ViewportOffset offset) {
                  return Viewport(
                    offset: offset,
                    slivers:
                                 [ SliverToBoxAdapter(
                key: _key,
                child: GestureDetector(
                  onTap: (){
                    print("ddddddddddddd");
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    width: 200,
                    height: 100,
                    color: Colors.deepOrange,
                    child: TextField(

                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(

                child: GestureDetector(
                  onTap: (){
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    width: 200,
                    height: _deviceH*2/3,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: 200,
                  height: _deviceH*2/3,
                  color: Colors.green,
                ),
              ),
                   ]
                    ,
                  );
                },
              ),
              onNotification: (ScrollUpdateNotification notification) {

                print("onNotification");

                final FocusScopeNode focusScope = FocusScope.of(context);
                if (notification.dragDetails != null && focusScope.hasFocus) {
                  focusScope.unfocus();
                }
                return false;
              },
            )







//            Viewport(
//              offset: ViewportOffset.fixed(0),
//              anchor: 0.0,
//            center: _key,
//            slivers: <Widget>[
//              SliverToBoxAdapter(
//                key: _key,
//                child: GestureDetector(
//                  onTap: (){
//                    print("ddddddddddddd");
//                    FocusScope.of(context).unfocus();
//                  },
//                  child: Container(
//                    width: 200,
//                    height: 100,
//                    color: Colors.deepOrange,
//                    child: TextField(
//
//                    ),
//                  ),
//                ),
//              ),
//              SliverToBoxAdapter(
//
//                child: GestureDetector(
//                  onTap: (){
//                    FocusScope.of(context).unfocus();
//                  },
//                  child: Container(
//                    width: 200,
//                    height: _deviceH*2/3,
//                    color: Colors.deepPurple,
//                  ),
//                ),
//              ),
//              SliverToBoxAdapter(
//                child: Container(
//                  width: 200,
//                  height: _deviceH*2/3,
//                  color: Colors.green,
//                ),
//              ),
//
//              ],
//            )










          ),
        )

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
    /// ImageStreamCompleter Viewport AnimatedList FractionalOffset ListWheelScrollView 待
    /// FocusScope 待 鸡肋
//    KeyedSubtree
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
//    SystemChannels.textInput.invokeMethod('TextInput.hide'); FocusScope.of(context).unfocus(); FocusScope.of(context).requestFocus(FocusNode());
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
