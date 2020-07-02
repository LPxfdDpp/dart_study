import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:phone_study/own_popup/own_popup.dart';

class BasicUseOfFlutterPage1 extends StatefulWidget {
  @override
  _BasicUseOfFlutterPage1State createState() => _BasicUseOfFlutterPage1State();
}

class _BasicUseOfFlutterPage1State extends State<BasicUseOfFlutterPage1>  with WidgetsBindingObserver  {

  final List<String> ppp = ['hello'];

  @override
  Widget build(BuildContext context) {
    print("ppppp");
    print(ppp);
//    Future.delayed(Duration(seconds: 10)).then((value) => OwnPopUp.showOwnPopup(context, Offset(30, 200)));

    Future.delayed(Duration(seconds: 5)).then((value) => print(ppp));

    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTapUp: (de){
            //这个 ppp 可以接收进来此页面的参数 也能接收回到此页面的参数
            Navigator.of(context).pushNamed("/basic_use_of_flutter_page_2",arguments: ppp);
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


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  ///WidgetsBindingObserver  正常情况添加给home页 做app整个生命周期的监听 比如 app进入后台回到前台。。。
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    print('==========');
  }






}
