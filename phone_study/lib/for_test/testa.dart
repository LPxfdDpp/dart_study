import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

import 'dart:async';
//
// Iterable naturalsDownFrom(n) sync* {
//   if (n > 0) {
//     yield n;
//     for (int i in naturalsDownFrom(n-1)) { yield i; }
//   }
// }


int level = 0;

Iterable naturalsDownFrom(n) sync* {
  level++;

  if (n > 0) {
    print("level: $level n:$n");
    yield n;

    for (int i in naturalsDownFrom(n-1)) {
      print("level: $level i:$i");
      yield i;
    }
  }
}


//  jjjjj() sync* {
//   yield 1;
//   yield 2;
// }


// main() {
//   // print(naturalsDownFrom(3));
//   // print(jjjjj());
//   var xcas = naturalsDownFrom(3).iterator;
//
//   while(xcas.moveNext()){
//     print(xcas.current);
//   }
//
// }
typedef MediaBeanUpdateInterested  = void Function(int newer);
main(){

 var bb = BB();
 var aa = AA();

bb.callBacks.add(aa.runn);

bb.go(100111);

}


class BB {
  List<MediaBeanUpdateInterested> callBacks = [];

  go(int aaa){
    callBacks.forEach((call)=>call(aaa));
  }
}

class AA {
  runn(int a){
    print(a);
  }
}