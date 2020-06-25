import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:phone_study/basic_use_of_flutter/basic_use_of_flutter_page_2.dart';
import 'package:phone_study/basic_use_of_flutter/route/page_route_builder.dart';
import 'package:phone_study/own_popup/own_popup.dart';

class BasicUseOfFlutterPage1 extends StatefulWidget {
  @override
  _BasicUseOfFlutterPage1State createState() => _BasicUseOfFlutterPage1State();
}

class _BasicUseOfFlutterPage1State extends State<BasicUseOfFlutterPage1> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTapUp: (de){
            Navigator.of(context).pushNamed("/basic_use_of_flutter_page_2",arguments: 'hello');
          },
          child: Container(
            width: 500,
            height: 500,
            color: Colors.amber,
            child: GestureDetector(
              onTapUp: (de){
                print(context.findRenderObject().runtimeType);


                OwnPopUp.showOwnPopup(context, de.globalPosition);
              },
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10) ,
                  width: 250,
                  height: 250,
                  color: Colors.green,
                  child: Column(
                    children: <Widget>[
                      Visibility(
                        visible: false,
//                    visible: true,
                        maintainState: true,
                        maintainSize: true,
                        maintainAnimation: true,
                        child: Container(
                          height: 50,
                          width: 200,
                          color: Colors.deepOrange,
                          child: Text("BasicUseOfFlutterPage1"),
                        ),
                      ),
                      Text("hehhehe")
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }










}
