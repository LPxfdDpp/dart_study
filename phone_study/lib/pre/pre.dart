import 'dart:async';
import 'dart:collection';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math' as math;


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


    return Column(
      children: <Widget>[
        SizedBox(
          height: 500,
          child: ListView(
            controller: PrimaryScrollController.of(context),
            children: <Widget>[
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color:Colors.deepPurple,width: 2)
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.deepPurple,width: 2)
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.deepPurple,width: 2)
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.deepPurple,width: 2)
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.deepPurple,width: 2)
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.deepPurple,width: 2)
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.deepPurple,width: 2)
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.deepPurple,width: 2)
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.deepPurple,width: 2)
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.deepPurple,width: 2)
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.deepPurple,width: 2)
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            controller: PrimaryScrollController.of(context),
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.deepPurple,width: 2)
                ),
              ),
              GestureDetector(
                onTap: (){
                  print("ppp");
                  print(PrimaryScrollController.of(context));
                  print("ppp");
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color:Colors.redAccent,width: 2)
                  ),
                ),
              ),

              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.deepPurple,width: 2)
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.deepPurple,width: 2)
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.deepPurple,width: 2)
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.deepPurple,width: 2)
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.deepPurple,width: 2)
                ),
              ),
            ],
          ),
        )




      ],
    );



  }

  ///RenderObjectElement CustomSingleChildLayout
  ///BoxScrollView SliverMultiBoxAdaptorWidget RenderSliverMultiBoxAdaptor SliverMultiBoxAdaptorParentData继续
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
//    CheckboxListTile Switch
    /// Viewport AnimatedList FractionalOffset ListWheelScrollView HitTestBehavior KeyedSubtree AutomaticKeepAlive待
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
  }
}