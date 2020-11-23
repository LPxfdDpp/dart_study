import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
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


  double _popWidth;
  double _popHeight;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Center(
        child: GestureDetector(
          onTap: (){
            // _showOverlayPop(context,Offset(_width/2-_popWidth/2, _height/2-_popHeight/2));
          },
          child: ColoredBox(
            color: Colors.transparent,
            child: ConstrainedBox(
              constraints:BoxConstraints.tight(
                  Size(_width,_height )
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: ColoredBox(
                    color: Color(0xFF1F1F1F),
                    child: ConstrainedBox(
                      constraints:BoxConstraints(
                          maxHeight: _popHeight,
                          maxWidth: _popWidth,
                          minWidth: _popWidth
                      ),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 50),
                            child: Listener(
                              onPointerDown: (d){
                                // Feedback.forTap(context);
                                // Clipboard.setData(ClipboardData(text: ""));
                                HapticFeedback.vibrate();
                                // HapticFeedback.heavyImpact();

                                print("================111==============================");
                                print(_controller.position.maxScrollExtent);
                                if(_controller.position.maxScrollExtent == 0){
                                  setState(() {
                                    _visible = false;
                                  });
                                }
                              },
                              child: ListView(
                                controller:_controller,
                                shrinkWrap: true,
                                children: [
                                  SizedBox(
                                    width: _popWidth/2,
                                    height: _popWidth/2,
                                    child: Image.asset("assets/images/guineaPig.jpeg"),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment : MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Transform.translate(
                                        offset: Offset(0,-1),
                                        child: Text("点赞成功",style: TextStyle(
                                            fontSize: 16,
                                            decoration: TextDecoration.none,
                                            color: Color(0xffF0F0F0)
                                        ),),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: _popWidth,
                                    child: Center(
                                      child: Text("-10 Manna",style: TextStyle(
                                          fontSize: 14,
                                          decoration: TextDecoration.none,
                                          color: Color(0xffF0F0F0)
                                      ),),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20,right: 20),
                                    child: SizedBox(
                                      width: _popWidth,
                                      child: Center(
                                        child: Text(
                                          // "Manna是1440世界流通的时间币，一切消耗需花时间，一切收获可赚时间，如果成为时间管理大师，就看你的了",
                                          "，一切消耗需花时间，，，就看你的了",
                                          // "Manna是1440世界流Manna是1440世界流通的时间币Manna是1440世界流通的时间币Manna是1440世界流通的时间币Manna是1440世界流通的时间币Manna是1440世界流通的时间币Manna是1440世界流通的时间币Manna是1440世界流通的时间币Manna是1440世界流通的时间币Manna是1440世界流通的时间币Manna是1440世界流通的时间币Manna是1440世界流通的时间币Manna是1440世界流通的时间币Manna是1440世界流通的时间币Manna是1440世界流通的时间币Manna是1440世界流通的时间币通的时间币，一切消耗需花时间，一切收获可赚时间，如果成为时间管理大师，就看你的了",

                                          style: TextStyle(
                                              fontSize: 14,
                                              decoration: TextDecoration.none,
                                              color: Color(0xffBFBFBF)
                                          ),),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            child: AnimatedBuilder(
                              animation: _animationController,
                              builder: (_,child){
                                return Transform.translate(
                                  offset: Offset(0,_animationController.value*((_popHeight-50)/3)),
                                  child: Visibility(
                                    visible: _visible,
                                    child: child,
                                  ),
                                );
                              },
                              child: Container(
                                height: (_popHeight-50)*2/3,
                                width: 4,
                                decoration: BoxDecoration(
                                  color: Color(0xff3A3A3C),
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                              right: 19,
                              top: 15,
                              child: GestureDetector(
                                onTap: (){
                                },
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white
                                  ,
                                ),
                              )),
                          Positioned(
                              bottom: 0,
                              child: SizedBox(
                                height: 50,
                                width: _popWidth,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: (){

                                    },
                                    child: Text("我知道了",style: TextStyle(
                                        fontSize: 16,
                                        decoration: TextDecoration.none,
                                        color: Color(0xffF0F0F0)
                                    ),),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AnimationController _animationController;
  ScrollController _controller;
  bool _visible = true;

  double _width;
  double _height;
  @override
  void initState() {
    super.initState();
    var size = window.physicalSize / window.devicePixelRatio;
    _width = size.width;
    _height = size.height;

    _popWidth = _width*2/3;
    _popHeight = _popWidth/2*2.5;

    _controller = ScrollController()..addListener(() {
      print("==============================================");
      print(_controller.position.maxScrollExtent);
      print(_controller.position.pixels);
      _animationController.value = _controller.position.pixels/_controller.position.maxScrollExtent;
    });

    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
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



