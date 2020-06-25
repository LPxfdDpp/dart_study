import 'package:flutter/material.dart';
import 'package:phone_study/basic_use_of_flutter/basic_use_of_flutter_page_1.dart';
import 'package:phone_study/own_popup/own_popup.dart';

class BasicUseOfFlutterPage2 extends StatefulWidget {
  final String dataNavigatorPushed;

  BasicUseOfFlutterPage2(this.dataNavigatorPushed);
  @override
  _BasicUseOfFlutterPage2State createState() => _BasicUseOfFlutterPage2State();
}

class _BasicUseOfFlutterPage2State extends State<BasicUseOfFlutterPage2> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapUp: (d){
//          Navigator.of(context).pop();


          OwnPopUp.showOwnPopup(context, d.globalPosition);
        },
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blueGrey,
          child:  Center(
            child: Text(widget.dataNavigatorPushed),
          ),
        ));
  }


}
