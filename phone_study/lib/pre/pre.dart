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

  Widget aa = AAWidget(key:Key("aa"),color: Colors.lightGreen,);
  // Widget aa = AAWidget(color: Colors.lightGreen,);
  Widget bb = AAWidget(key:Key("bb"),color: Colors.redAccent,);
  // Widget bb = AAWidget(color: Colors.redAccent,);


  List<String> videoUrls = [
  "http://static-test.wm1440.com/16055035238389120191.mp4",
  "http://static-test.wm1440.com/16054972514594575208.mp4",
  "http://static-test.wm1440.com/16054972376864544005.mp4",
  "http://static-test.wm1440.com/16054967439052302497.mp4",
  "http://static-test.wm1440.com/16054967321120614146.mp4",
  "http://static-test.wm1440.com/16054949313093485276.mp4",
  "http://static-test.wm1440.com/16046439907112479114.mp4",
  "http://static-test.wm1440.com/16052607309081492808.mp4",
  "http://static-test.wm1440.com/16052596279859586755.mp4",
  "http://static-test.wm1440.com/16052596288717202193.mp4",
  "http://static-test.wm1440.com/16052597055866319472.mp4",
  "http://static-test.wm1440.com/16052551173304373256.mp4",
  "http://static-test.wm1440.com/16052617319418090195.mp4",
  "http://static-test.wm1440.com/16052612733338068483.mp4",
  "http://static-test.wm1440.com/16052609141595089905.mp4",
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          var temp = aa;
          aa = bb;
          bb = temp;
        });
      },
      child: Stack(
        children: [
          aa,
          bb
        ],
      ),
    );
  }



  double _width;
  double _height;
  @override
  void initState() {
    super.initState();
    var size = window.physicalSize / window.devicePixelRatio;
    _width = size.width;
    _height = size.height;
  }

  @override
  void dispose() {
    super.dispose();
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

class AAWidget extends StatefulWidget {
  final Color color;
  const AAWidget({Key key, this.color}) : super(key: key);
  @override
  _AAWidgetState createState() => _AAWidgetState();
}

class _AAWidgetState extends State<AAWidget> {

  @override
  void initState() {
    super.initState();

    print("-------------------------------- : "+widget.color.toString());

  }

  @override
  void didUpdateWidget(covariant AAWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    print("==="+widget.color.toString());
    print("==="+oldWidget.color.toString());
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: widget.color
      ),
    );
  }
}

