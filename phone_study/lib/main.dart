import 'package:flutter/material.dart';
import 'package:phone_study/blocPage/bloc_page.dart';

void main() => runApp(new Phone_study());

class Phone_study extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),

      ///bloc学习页
      home: BlocPage(),
//      home: new Sample(),
//      home: new Sample(),
//      home: new Sample(),
//      home: new Sample(),

      routes: <String, WidgetBuilder>{
        '/blocPage':(BuildContext context) => BlocPage(),
      },
    );

  }

}






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