import 'dart:async';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:phone_study/pre/pre.dart';
import 'basic_use_of_flutter/route/ownNavigatorObserver.dart';
import 'basic_use_of_flutter/route/ownRouteGenerator.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/scheduler.dart' show timeDilation;

// 全局的路由监听者，可在需要的widget中添加，应该放到一个全局定义的文件中
//需要监听的Widget中 需要 extends State<xxx> with RouteAware {
// final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
final RouteObserver<Route> routeObserver = RouteObserver<Route>();

ui.Color color;

ui.Picture paint(ui.Rect paintBounds) {
  // First we create a PictureRecorder to record the commands we're going to
  // feed in the canvas. The PictureRecorder will eventually produce a Picture,
  // which is an immutable record of those commands.
  final ui.PictureRecorder recorder = ui.PictureRecorder();

  // Next, we create a canvas from the recorder. The canvas is an interface
  // which can receive drawing commands. The canvas interface is modeled after
  // the SkCanvas interface from Skia. The paintBounds establishes a "cull rect"
  // for the canvas, which lets the implementation discard any commands that
  // are entirely outside this rectangle.
  final ui.Canvas canvas = ui.Canvas(recorder, paintBounds);

  // The commands draw a circle in the center of the screen.
  final ui.Size size = paintBounds.size;
  canvas.drawCircle(
    size.center(ui.Offset.zero),
    size.shortestSide * 0.45,
    ui.Paint()..color = color,
  );

  // When we're done issuing painting commands, we end the recording an receive
  // a Picture, which is an immutable record of the commands we've issued. You
  // can draw a Picture into another canvas or include it as part of a
  // composited scene.

  var picture = recorder.endRecording();

  return picture;
}

ui.Scene composite(ui.Picture picture, ui.Rect paintBounds) {
  // The device pixel ratio gives an approximate ratio of the size of pixels on
  // the device's screen to "normal" sized pixels. We commonly work in logical
  // pixels, which are then scalled by the device pixel ratio before being drawn
  // on the screen.
  final double devicePixelRatio = ui.window.devicePixelRatio;

  // This transform scales the x and y coordinates by the devicePixelRatio.
  final Float64List deviceTransform = Float64List(16)
    ..[0] = devicePixelRatio
    ..[5] = devicePixelRatio
    ..[10] = 1.0
    ..[15] = 1.0;

  // We build a very simple scene graph with two nodes. The root node is a
  // transform that scale its children by the device pixel ratio. This transform
  // lets us paint in "logical" pixels which are converted to device pixels by
  // this scaling operation.
  final ui.SceneBuilder sceneBuilder = ui.SceneBuilder()
    ..pushTransform(deviceTransform)
    ..addPicture(ui.Offset.zero, picture)
    ..pop();

  // When we're done recording the scene, we call build() to obtain an immutable
  // record of the scene we've recorded.
  return sceneBuilder.build();
}

///beginFrame sky engin的实现方法
// void beginFrame(Duration timeStamp) {
//   final ui.Rect paintBounds = ui.Offset.zero & (ui.window.physicalSize / ui.window.devicePixelRatio);
//   // First, record a picture with our painting commands.
//   final ui.Picture picture = paint(paintBounds);
//   // Second, include that picture in a scene graph.
//   final ui.Scene scene = composite(picture, paintBounds);
//   // Third, instruct the engine to render that scene graph.
//   ui.window.render(scene);
// }

///beginFrame 这个方式更接近flutter框架的实现
void beginFrame(Duration timeStamp) {
  final double devicePixelRatio = ui.window.devicePixelRatio;

  ///以下皆与 画的准备和画(动词) 有关 flag:开始
  //创建一个画板
  final ui.PictureRecorder recorder = ui.PictureRecorder();
  //基于画板创建一个 Canvas
  final ui.Canvas canvas = ui.Canvas(recorder);
  canvas.scale(devicePixelRatio, devicePixelRatio);
  var centerX = ui.window.physicalSize.width / 2.0;
  var centerY = ui.window.physicalSize.height / 2.0;
  //画一个 100 的剧中蓝色
  canvas.drawRect(Rect.fromCenter(center: Offset.zero, width: 100, height: 100),
      new Paint()..color = color);
  PictureLayer pictureLayer = PictureLayer(Rect.zero);
  pictureLayer.picture = recorder.endRecording();
  ///以下皆与 画的准备和画(动词) 有关 flag:结束

  final ui.SceneBuilder sceneBuilder = ui.SceneBuilder();
  OffsetLayer rootLayer = OffsetLayer();

  OffsetLayer offsetLayer = OffsetLayer(offset: Offset(centerX, centerY));
  rootLayer.append(offsetLayer);

  offsetLayer.append(pictureLayer);

  rootLayer.addToScene(sceneBuilder);
  ui.window.render(sceneBuilder.build());
}

void handlePointerDataPacket(ui.PointerDataPacket packet) {
  // The pointer packet contains a number of pointer movements, which we iterate
  // through and process.
  for (final ui.PointerData datum in packet.data) {
    if (datum.change == ui.PointerChange.down) {
      // If the pointer went down, we change the color of the circle to blue.
      color = const ui.Color(0xFF0000FF);
      // Rather than calling paint() synchronously, we ask the engine to
      // schedule a frame. The engine will call onBeginFrame when it is actually
      // time to produce the frame.
      ui.window.scheduleFrame();
    } else if (datum.change == ui.PointerChange.up) {
      // Similarly, if the pointer went up, we change the color of the circle to
      // green and schedule a frame. It's harmless to call scheduleFrame many
      // times because the engine will ignore redundant requests up until the
      // point where the engine calls onBeginFrame, which signals the boundary
      // between one frame and another.
      color = const ui.Color(0xFF00FF00);
      ui.window.scheduleFrame();
    }
  }
}

///启动入口 001
void main1() {
// void main() {
  color = const ui.Color(0xFF00FF00);
  // The engine calls onBeginFrame whenever it wants us to produce a frame.
  ui.window.onBeginFrame = beginFrame;
  // The engine calls onPointerDataPacket whenever it had updated information
  // about the pointers directed at our app.
  ui.window.onPointerDataPacket = handlePointerDataPacket;
  // Here we kick off the whole process by asking the engine to schedule a new
  // frame. The engine will eventually call onBeginFrame when it is time for us
  // to actually produce the frame.
  ui.window.scheduleFrame();
}


///启动入口 002
void main2() {
// void main() {

  // todo 微任务了解
  // if (_videoPlayerController.value.position.inMilliseconds >=
  //     _videoPlayerController.value.duration.inMilliseconds) {

  runApp(Directionality(
      textDirection:TextDirection.ltr,
    child: GestureDetector(
      onTap: (){
        debugDumpRenderTree();
      },
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 50,
            child: Container(
              width: 90,
              height: 90,
              color: Colors.green,
            ),
          ),
        ],
      ),
    ),
  ));
}
class Main2TestPage extends StatefulWidget {
  @override
  _Main2TestPageState createState() => _Main2TestPageState();
}
class _Main2TestPageState extends State<Main2TestPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ColoredBox(
          color: Colors.lightGreen,
          child: SizedBox(
            width: double.infinity,
            height: 150,
          ),
        ),
        ColoredBox(
          color: Colors.deepPurple,
          child: SizedBox(
            width: double.infinity,
            height: 150,
          ),
        ),
      ],
    );
  }
}

///启动入口 000
// void main0() {
void main() {
  ///没啥效果
  // debugDisablePhysicalShapeLayers = true;

//  debugPaintLayerBordersEnabled = true;
//  debugRepaintRainbowEnabled = true;

 // debugPaintPointersEnabled = true;

  runApp(Phone_study());
}

class Phone_study extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/',
      onGenerateRoute: OwnRouteGenerator.generateRoute,
      navigatorObservers: [OwnNavigatorObserver(), routeObserver],
    );
  }
}
