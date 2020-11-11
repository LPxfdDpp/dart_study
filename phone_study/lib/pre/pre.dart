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

  AnimationController _animationController;
  ValueNotifier<int> change;
  ValueNotifier<bool> moveChange;
  double _hStart;
  double _hUpdate;

  double _deviceWidth;
  @override
  Widget build(BuildContext context) {
    if(_deviceWidth == null){
      _deviceWidth = MediaQuery.of(context).size.width;
      _animationController = AnimationController(
          value: 0,
          lowerBound: -_deviceWidth,
          upperBound: _deviceWidth,
          vsync: this);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("hello"),
        ),
        body: GestureDetector(
          onHorizontalDragStart: (d){
            _hStart = d.localPosition.dx;
          },
          onHorizontalDragUpdate: (d){
            _hUpdate = d.localPosition.dx;
            if(_hUpdate > _hStart && moveChange.value){
              moveChange.value = false;
            }else if(_hUpdate < _hStart && !moveChange.value){
              moveChange.value = true;
            }
            _animationController.value = _hUpdate-_hStart;
          },
          onHorizontalDragEnd: (d){
            double cha = _hUpdate - _hStart;
            bool moveLeft;
            if(cha >= 0){
              moveLeft = false;
            }else{
              moveLeft = true;
            }

            if(!moveLeft){
              if(cha >= (_deviceWidth-_hStart)/3){
                _animationController.animateTo(_deviceWidth,duration:Duration(milliseconds: 200))
                .whenComplete((){
                  change.value -= 1;
                  moveChange.value = true;
                });
              }else{
                _animationController.animateTo(0,duration:Duration(milliseconds: 200));
              }
            }else{
              if(-cha >= _hStart/3){
                _animationController.animateTo(-_deviceWidth,duration:Duration(milliseconds: 200))
                .whenComplete((){
                  change.value += 1;
                  moveChange.value = true;
                });
              }else{
                _animationController.animateTo(0,duration:Duration(milliseconds: 200));
              }
            }

          },
          child: AniLayer(
              animationController: _animationController,
              change:change,
            moveChange:moveChange,
          ),
        ));
  }


  reCreateAni(){
  }


  @override
  void initState() {
    super.initState();
    change = ValueNotifier<int>(0);
    moveChange = ValueNotifier<bool>(true);
  }

  @override
  void dispose(){
    _animationController.dispose();
    change.dispose();
    moveChange.dispose();
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

class AniLayer extends StatefulWidget {
  final ValueNotifier<int> change;
  final ValueNotifier<bool> moveChange;
  final AnimationController animationController;

  AniLayer({Key key,this.change,this.moveChange,this.animationController}) : super(key: key);

  @override
  _AniLayerState createState() => _AniLayerState();
}

class _AniLayerState extends State<AniLayer> {
  ValueNotifier<int> indexShow = ValueNotifier<int>(0);
  ValueListenableBuilder aa;
  ValueListenableBuilder bb;
  String canAni = "bb";
  int old;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        aa,
        bb,
      ],
    );
  }
  List<String> messs = ["看似简单", "阿里山asdfasdfasdfa的空间", "士大夫事故asdfsda发生的", "岁的asddadsfadfdwew3法国", "啊可是觉得很烦"];
  @override
  void initState() {
    super.initState();
    aa = ValueListenableBuilder(
      key: Key("aa"),
      valueListenable: indexShow,
      builder: (_,v,child){
        return AnimatedBuilder(
          animation: widget.animationController,
          builder:(_,child){
            return Transform.translate(
                offset: Offset(
                    (canAni == "aa")?widget.animationController.value:0,0
                ),
                child: child);
          },
          child: SizedBox.expand(
              child: ColoredBox(
                color: Colors.orangeAccent,
                child: Center(
                  child: ValueListenableBuilder(
                    valueListenable: widget.moveChange,
                    builder: (_,vv,child){
                      if(!vv){
                        var v = indexShow.value;
                        return Text(messs[(canAni == "aa")?v:v-1]);
                      }
                      return child;
                    },
                    child: Text(messs[(canAni == "aa")?v:v+1]),
                  ),
                ),
              )),
        );
      },
    );
    bb = ValueListenableBuilder(
      key: Key("bb"),
      valueListenable: indexShow,
      builder: (_,v,child){
        return AnimatedBuilder(
          animation: widget.animationController,
          builder:(_,child){
            return Transform.translate(
                offset: Offset(
                    (canAni == "bb")?widget.animationController.value:0,0),
                child: child);
          },
          child: SizedBox.expand(
              child: ColoredBox(
                color: Colors.indigo,
                child: Center(
                  child: ValueListenableBuilder(
                    valueListenable: widget.moveChange,
                    builder: (_,vv,child){
                      if(!vv){
                        var v = indexShow.value;
                        return Text(messs[(canAni == "bb")?v:v-1]);
                      }
                      return child;
                    },
                    child: Text(messs[(canAni == "bb")?v:v+1]),
                  ),
                ),
              )),
        );
      },
    );

    widget.change.addListener(() {
      widget.animationController.value = 0;
      var v = widget.change.value;
      int action;
      if(old == null){
        old = v;
        if(v  == -1){
          action = 2;

        }else if(v == 1){
          action = 1;

        }
      }else if(old == v){
        action = 0;
      }else if(old < v){
        old = v;
        action = 1;

      }else{
        old = v;
        action = 2;

      }

      print(action);
      if(action == 1 || action == 2){
        setState(() {
          var temp = aa;
          aa = bb;
          bb = temp;
          if(canAni == "bb"){
            canAni = "aa";
          }else{
            canAni = "bb";
          }
          if(action == 1){
            indexShow.value += 1;
          }else{
            indexShow.value -= 1;
          }
        });
      }


    });
  }

  @override
  void dispose() {
    indexShow.dispose();
    super.dispose();
  }

}
