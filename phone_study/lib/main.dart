import 'package:flutter/material.dart';
import 'basic_use_of_flutter/route/ownNavigatorObserver.dart';
import 'basic_use_of_flutter/route/ownRouteGenerator.dart';

void main() => runApp(new Phone_study());

class Phone_study extends StatelessWidget {


  // 全局的路由监听者，可在需要的widget中添加，应该放到一个全局定义的文件中
  //需要监听的Widget中 需要 extends State<xxx> with RouteAware {
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  @override
  Widget build(BuildContext context) {



    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/',
      onGenerateRoute: OwnRouteGenerator.generateRoute,
      navigatorObservers: [
        OwnNavigatorObserver(),
        routeObserver
      ],
    );

  }






}





//import 'package:flutter/material.dart';
//import 'dart:ui';
//@override
//Widget build(BuildContext context) {
//  // TODO: implement build
//  return Container(
//      decoration: BoxDecoration(
//        color: Colors.blue[100],
////            image:DecorationImage(
////                fit: BoxFit.fitWidth,
////                alignment: Alignment.topCenter,
////                image: null
////            )
//      ),
//      child: WillPopScope(
//        child: Scaffold(
//          backgroundColor: Colors.transparent,
//          appBar: AppBar(
//            elevation: 0,
//            backgroundColor: Colors.brown[100],
//            automaticallyImplyLeading: false,
//            titleSpacing: 0,
//            centerTitle: true,
//            title: Container(
//              alignment: Alignment(0, 0),
//              width: MediaQuery.of(context).size.width,
//              height: kBottomNavigationBarHeight,
//              decoration: BoxDecoration(),
//              child: Text.rich(
//                TextSpan(
//                    text: "bloc学习页",
//                    style: TextStyle(
//                    )),
//                textScaleFactor: 1.0,
//              ),
//            ),
//          ),
//          body: Container(
//              color: Colors.white,
//              width: MediaQuery.of(context).size.width,
//              height: MediaQuery.of(context).size.height -
//                  kBottomNavigationBarHeight -
//                  MediaQueryData.fromWindow(window).padding.top -
//                  kToolbarHeight,
//              child: SafeArea(
//                child: Text("ppppp"),
//              )),
//          bottomNavigationBar: Container(
//              color: Colors.amber[100],
//              height: kBottomNavigationBarHeight,
//              child: null),
//        ),
//        onWillPop: () {},
//      ));
//}