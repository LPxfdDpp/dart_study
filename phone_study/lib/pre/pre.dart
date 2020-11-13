import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// import 'package:characters/characters.dart';

/**
 * 学习用
 */
class PrePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PrePageState();
}

class PrePageState extends State<PrePage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    if (_width == null) {
      _width = MediaQuery.of(context).size.width;
      _height = MediaQuery.of(context).size.height;
    }

    return PageView.builder(
      itemCount: 10,
      controller: pageController,
      itemBuilder: (context, index) {
        return _buildPageItem(index);
      },
    );
  }

  PageController pageController;

  double _width;
  double _height;
  @override
  void initState() {
    super.initState();
    pageController = PageController()
      ..addListener(() {
          setState(() {
            _currPageValue = pageController.page;
            _currPageOffset = pageController.offset;
          });
      });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  double _currPageValue = 0;
  double _currPageOffset = 0;
  _buildPageItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      //当前的item

      double _animationvalue = lerpDouble(0.0, pi / 2, _currPageValue - index);
      matrix4 = Matrix4.identity()
        ..setEntry(3, 2, 0.0015)
        ..rotateY(_animationvalue);

      return Transform(
        transform: matrix4,
        origin: Offset(_width / 2, 0),
        alignment: Alignment.center,
        child: _homeCell(context, index),
      );
    } else if (index == _currPageValue.floor() + 1) {
      //右边的item
      double _animationvalue = lerpDouble(0.0, pi / 2, _currPageValue - index);

      matrix4 = Matrix4.identity()
        ..setEntry(3, 2, 0.0012)
        ..rotateY(_animationvalue);

      return Transform(
        transform: matrix4,
        origin: Offset(-_width / 2, 0),
        alignment: Alignment.center,
        child: _homeCell(context, index),
      );
    } else if (index == _currPageValue.floor() - 1) {
      //左边

      double _animationvalue =
      lerpDouble(0.0, pi / 2, _currPageValue - index + 1);

      matrix4 = Matrix4.identity()
        ..setEntry(3, 2, 0.0015)
        ..rotateY(_animationvalue);
    } else {
      //其他，不在屏幕显示的item
      matrix4 = Matrix4.identity();
    }

    return Transform(
      transform: matrix4,
      origin: Offset(_width / 2, 0),
      alignment: Alignment.center,
      child: _homeCell(context, index),
    );
  }

  _homeCell(BuildContext context,int index){

    return Container(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.deepPurple,
          width: 2
        )
      ),
      child: Text(index.toString()),
    );

  }














  ///-----------------------------------------------------------------------------
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
//     ReorderableListView
//     ValueListenableBuilder
//     DraggableScrollableSheet

    //小玩意
//    AnimatedSwitcher
//    ColorFiltered
//    InkWell
//    for (int i=0;i<3;i++) ...[ 已经可以用了
//    RendererBinding.instance.deferFirstFrame() RendererBinding.instance.allowFirstFrame()
  }
}
