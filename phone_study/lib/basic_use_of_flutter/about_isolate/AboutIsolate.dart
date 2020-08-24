import 'dart:async';
import 'dart:isolate';

void main() async {
  print("main()                      Isolate.current.hashCode");
  print(Isolate.current.hashCode);

  await isolateCountEven(9999999999);

  print("done");

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

///isolateCountEven countEvent2 解释
///第一步 接收方和发送方交换 sendPort
///第二步 接收方定义listen做好接收消息的准备
///第三步 发送方可以通过接收方的sendPort发送消息了
Future<dynamic> isolateCountEven(int num) async {
  final response = ReceivePort();
  Isolate isolate = await Isolate.spawn(countEvent2, response.sendPort);
//  isolate.pauseCapability;
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