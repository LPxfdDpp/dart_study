import 'dart:async';
import 'dart:isolate';
import 'dart:math';
//import 'package:flutter/foundation.dart' show describeEnum;

void main() async {
  print("main()                      Isolate.current.hashCode");
  print(Isolate.current.hashCode);

  await isolateCountEven(1000000000);

  Timer(Duration(days: 1), () {});
}

int countEven(int num) {
  int count = 0;
  while (num > 0) {
    if (num % 2 == 0) {
      count++;
    }
    num--;
  }
  return count;
}

Future<dynamic> isolateCountEven(int num) async {
  final response = ReceivePort();
  await Isolate.spawn(countEvent2, response.sendPort);
  final sendPort = await response.first;
  final answer = ReceivePort();
  sendPort.send([answer.sendPort, num]);
  print("isolateCountEven(int num) async {");
  print(Isolate.current.hashCode);
  return answer.first;
}

void countEvent2(SendPort port) {
  print("countEvent2(SendPort port) {");
  print(Isolate.current.hashCode);
  final rPort = ReceivePort();
  port.send(rPort.sendPort);
  rPort.listen((message) {
    print("countEvent2(SendPort port) {      rPort.listen((message) {");
    print(Isolate.current.hashCode);
    final send = message[0] as SendPort;
    final n = message[1] as int;
    send.send(countEven(n));
  });
}

enum SelectedColor {
  PrimaryColor,
  SecondaryColor,
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
