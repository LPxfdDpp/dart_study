import 'dart:async';
import 'dart:isolate';
import 'dart:math';
//import 'package:flutter/foundation.dart' show describeEnum;
import 'package:http/http.dart' as http;

void main() async {
  print("main()                      Isolate.current.hashCode");

  Hekpp().ke();

int kk = 9999;

print(kk >= 1000?(kk/1000).toStringAsFixed(1)+"k":kk.toString());


  Timer(Duration(days: 1), () {});
}



class Hekpp extends Hkep {

//  @override
//  ke() async{
//    var ppp = await Future.delayed(Duration(seconds: 3),()=>89);
//    print(ppp);
//  }

}
class Hkep {

  ke(){
    print("Hkep ke");
  }

}





class WE<T> {
  hei() {
    print("hei");
  }
}

class WEE extends WE with A {}

class DDEEMMOO with A, B {
  const DDEEMMOO.hehe();

  @override
  soo() {
    // TODO: implement soo
    throw UnimplementedError();
  }
}

abstract class HHH {
  soo() {
    print("soo");
  }
}

mixin A {
  run() {
    print("A");
  }
}

mixin B implements A, HHH {
//  run (){
//    print("B");
//  }
}
