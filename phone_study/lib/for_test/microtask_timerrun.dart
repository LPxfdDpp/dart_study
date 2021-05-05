import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

import 'dart:async';

typedef DDointerRoute1 = void Function({int a});
typedef DDointerRoute2 = void Function({int b});
typedef DDointerRoute3 = void Function(int a);

final int a = (){
  print("sdasfadfasdfasdfas");
  return 100;
}();

main(){



  int a = 0;
  for(int i=0;i<10000000;i++){
    // Timer.run(() {
    //   a++;
    // });

    if(i == 500000){
      Timer.run(() {
        print("here1");
      });
    }
    if(i == 2000000){
      Timer.run(() {
        print("here2");
      });
    }
    if(i == 5000000){
      Timer.run(() {
        print("here3");
      });
    }
    if(i == 8000000){
      Timer.run(() {
        print("here4");
      });
    }
    Future.microtask(() {
      a++;
    });
  }

  Timer.run(() {
    print("there");
  });

  // print(a);

  Future.microtask(() {
    print(a);
  });

  // Timer(Duration(days: 1), (){});



}

class A {


}

class B extends A {

}


