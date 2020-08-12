import 'package:flutter/material.dart';
import 'package:phone_study/main.dart';

class BasicUseOfFlutterPage2 extends StatefulWidget {
  final List<String> dataNavigatorPushed;

  BasicUseOfFlutterPage2(this.dataNavigatorPushed);
  @override
  _BasicUseOfFlutterPage2State createState() => _BasicUseOfFlutterPage2State();
}

class _BasicUseOfFlutterPage2State extends State<BasicUseOfFlutterPage2> with RouteAware  {



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapUp: (d){
          widget.dataNavigatorPushed.add("hahahahah");
//          Navigator.of(context).pop();
          Navigator.of(context).pop("kpkp");

//          OwnPopUp.showOwnPopup(context, d.globalPosition);
        },
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blueGrey,
          child:  Center(
            child: Text(widget.dataNavigatorPushed[0]),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    print('BasicUseOfFlutterPage2 initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();


    var preRoutPassInArguments = ModalRoute.of(context).settings.arguments;
    print("preRoutPassInArguments");
    print(preRoutPassInArguments);


    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
    print('RouteAware dispose');
  }

  /// RouteAware
  @override
  void didPush() {
    // Route was pushed onto navigator and is now topmost route.
    print('RouteAware didPush');
  }

  @override
  void didPopNext() {
    // Covering route was popped off the navigator.
    print('RouteAware didPopNext');
  }


}
