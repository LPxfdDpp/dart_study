import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OwnPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTapUp: (de){
            showOwnPopup(context,de.globalPosition);
          },
          child: Container(
            padding: EdgeInsets.all(10) ,
            width: 200,
            height: 200,
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
    );
  }



  ///自定义弹窗
  ///static 便于其他页面也可以调用并测试
 static  showOwnPopup(BuildContext context,Offset offset) async{
    OverlayState overlayState = Overlay.of(context);

    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
            left: offset.dx,
            top: offset.dy,
            child: Container(
              width: 100,
              height: 100,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.deepOrange,
                child: Text("1"),
              ),
            )
        )
    );
    OverlayEntry overlayEntry2 = OverlayEntry(
        builder: (context) => Positioned(
            left: offset.dx+100,
            top: offset.dy+100,
            child: Container(
              width: 50,
              height: 50,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.blueGrey,
                child: Text("2"),
              ),
            )
        )
    );

    overlayState.insert(overlayEntry);
    overlayState.insert(overlayEntry2);
    await Future.delayed(Duration(seconds: 500));
    overlayEntry.remove();
    overlayEntry2.remove();
  }

}
