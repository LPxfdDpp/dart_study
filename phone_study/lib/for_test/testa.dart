import 'dart:async';
import 'dart:isolate';
import 'dart:math';
//import 'package:flutter/foundation.dart' show describeEnum;

void main() async{
//  StreamController _streamController = StreamController.broadcast(sync: false);
//
//// 接收所有
//  _streamController.stream.where((event) => event is WE).cast<WE>().listen((event) {
//    print(event.runtimeType);
//  });
//
//// 接收部分
//  _streamController.stream.where((event) => event is WE<DDEEMMOO>).cast<WE<DDEEMMOO>>().listen((event) {
//    print(event.runtimeType);
//  });
//
//  Timer(Duration(seconds: 2), (){
//    _streamController.add(WE());
//  });
//  Timer(Duration(seconds: 4), (){
//    _streamController.add(WE<int>());
//  });
//  Timer(Duration(seconds: 6), (){
//    _streamController.add(WE<DDEEMMOO>());
//  });


//var hhh = WE() as WE<DDEEMMOO>;

//print(WE() is dynamic);




// var oo =  Offset.zero;
//
// var ss = Size(50.0, 60.0);
//
// print((oo & ss).toString());


//  WE ppp = WE();

//  ppp?.hei();

"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";

}

enum SelectedColor {
  PrimaryColor,
  SecondaryColor,
}



class  WE<T> {
  hei(){
    print("hei");
  }
}

class WEE extends WE with A{

}


class DDEEMMOO with A,B {

  const DDEEMMOO.hehe();


  @override
  soo() {
    // TODO: implement soo
    throw UnimplementedError();
  }


}

abstract class HHH {


  soo(){
    print("soo");
  }

}

mixin A {

  run (){
    print("A");
  }

}

mixin B implements A,HHH {
//  run (){
//    print("B");
//  }
}







