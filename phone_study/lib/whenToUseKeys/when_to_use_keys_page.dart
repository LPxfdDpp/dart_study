import 'dart:ui';

import 'package:flutter/material.dart';

class WhenToUseKeysPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => WhenToUseKeysPageState();

}

class WhenToUseKeysPageState extends State<WhenToUseKeysPage> {

  List<Widget> lists;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    lists = [
      StatelessColorfulTile(1),
      StatelessColorfulTile(2),
//      StatefulColorfulTile(1),
//      StatefulColorfulTile(2),
    ];

  }



@override
Widget build(BuildContext context) {
  // TODO: implement build
  return Container(
      decoration: BoxDecoration(
        color: Colors.blue[100],
//            image:DecorationImage(
//                fit: BoxFit.fitWidth,
//                alignment: Alignment.topCenter,
//                image: null
//            )
      ),
      child: WillPopScope(

        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.brown[100],
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            centerTitle: true,
            title: Container(
              alignment: Alignment(0, 0),
              width: MediaQuery.of(context).size.width,
              height: kBottomNavigationBarHeight,
              decoration: BoxDecoration(),
              child: Text.rich(
                TextSpan(
                    text: "when_to_use_keys学习页",
                    style: TextStyle(
                    )),
                textScaleFactor: 1.0,
              ),
            ),
          ),
          body: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  kBottomNavigationBarHeight -
                  MediaQueryData.fromWindow(window).padding.top -
                  kToolbarHeight,
              child: SafeArea(
                child: Row(
                  children: lists,
                ),
              )),
          floatingActionButton: FloatingActionButton(onPressed: swapTiles),
        ),
        onWillPop: () {},
      ));



}

  swapTiles(){
    setState(() {

      lists.insert(1, lists.removeAt(0));

    });
  }



}

class StatelessColorfulTile extends StatelessWidget {

   Color _color;

   int i;

  StatelessColorfulTile(int j):i=j,_color = j%2==0?Colors.blue:Colors.red;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: _color,
    );
  }
}
class StatefulColorfulTile extends StatefulWidget {

  final int i;

  const StatefulColorfulTile(int j) :i=j;

  @override
  State<StatefulWidget> createState() => StatefulColorfulTileState();

}

class StatefulColorfulTileState extends State<StatefulColorfulTile> {

  Color _color;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _color = widget.i%2==0?Colors.blue:Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: _color,
    );
  }
}