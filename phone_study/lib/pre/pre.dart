import 'dart:async';
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
  PageController pageController;
  AnimationController _animationController;
  int current = 0;


  @override
  Widget build(BuildContext context) {
    if(_animationController == null){
      _animationController = AnimationController.unbounded(value:0,vsync: this);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("hello"),
        ),
        body: PageView.builder(
            itemCount: iiiitems.length,
            controller: pageController,
            itemBuilder: (context, index) {
              Color ppp ;
              if(index == 1){
                ppp = Colors.green;
              }else if(index == 2){
                ppp = Colors.deepPurpleAccent;
              }else if(index == 3){
                ppp = Colors.deepOrangeAccent;
              }else{
                ppp = Colors.blueGrey;
              }

              return AnimatedBuilder(
                key: Key(index.toString()),
                  animation: _animationController,
                  builder: (context, child) {

                    return Opacity(
                        opacity:1.0,
                        child: Transform.translate(
                        offset: Offset(getOffset(index),0),
                          child: child,
                        ),
                    );


                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.cyan, width: 2)),
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        color: ppp??Colors.transparent,
                        child: Text(iiiitems[index].toString()),
                      ),
                    ),
                  ));
            }));
  }

  List<int> iiiitems = [0,1,2,3,4,5,6,7,8,9];

  double pre = 0;
  int thisCurrent=0;
  double after;
  @override
  void initState() {
    super.initState();
    pageController = PageController()..addListener(() {
      var ww = MediaQuery.of(context).size.width;

      var ppp = pageController.position.pixels;
      int kp = (ppp+ww)~/ww;
      double sy = (ppp+ww)%ww;

//      if(sy >= ww/2){
//        current = kp;
//      }else{
//        current = kp-1;
//      }

      if(thisCurrent == -1){
        if(sy >= ww/2){
          thisCurrent = kp;
        }else{
          thisCurrent = kp-1;
        }


      }

      _animationController.value = (ppp>pre)?sy:-sy;
    });

    Timer(Duration(milliseconds: 32), (){
      pageController.position.isScrollingNotifier.addListener(() {
        if(pageController.position.isScrollingNotifier.value){
          pre = pageController.position.pixels;
          thisCurrent = -1;
        }
//        else{
//          after = pageController.position.pixels;
//        }
      });
    });

  }

  getOffset(int index){
    if(_animationController.value > 0){//左滑
      if(index == thisCurrent){
        return 0.0;
      }
      else if(index < thisCurrent){
        return 0.0;
      }
      else if(index ==  thisCurrent+1){
        return -MediaQuery.of(context).size.width+(_animationController.value);
      }else{
        return 0.0;
      }
    }else{//右滑
//      return 0.0;//左右滑动会有不同的效果

      if(index == thisCurrent){
        return 0.0;
      }
      else if(index == thisCurrent-1){
        return MediaQuery.of(context).size.width+(_animationController.value);
      }
      else if(index >  thisCurrent){
        return 0.0;
      }else{
        return 0.0;
      }
    }

  }







// GestureDetector(
// onTap: (){
// print("====================");
// setState(() {
// x = 0;
// });
// },
// child: Scaffold(
// body: Center(
// child: GestureDetector(
// onTap: (){
// if(_controller.isCompleted){
// _controller.reset();
// }
// _controller.forward();
// },
// child: Transform(
// alignment:Alignment.center,
// transform: Matrix4(
// 1,0,0,0,
// 0,1,0,0,
// 0,0,1,0.003,
// 0,0,0,1
// )..rotateY(x/360*(2*pi))..translate(-x),
// child: Container(
// width: 200,
// height: 200,
// decoration: BoxDecoration(
// gradient: LinearGradient(
// colors:[
// Colors.deepOrange,
// Colors.blueGrey,
// Colors.lightGreen,
// ]
// )
// ),
// ),
// ),
// ),
// ),
//
// ),
// );































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


