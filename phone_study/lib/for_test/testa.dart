import 'dart:async';
import 'dart:collection';
import 'dart:isolate';
import 'dart:math';
//import 'package:flutter/foundation.dart' show describeEnum;
import 'package:dio/dio.dart';



void main() async {

  String data = "https://petreasureceshiyong.oss-cn-hongkong.aliyuncs.com/temp/00";
  Worker worker = Worker();


  List.generate(10, (index) {

    worker.into(data+(index+1).toString()+".mp4").then((value){
      print("********************");
      print(value);
    }).catchError((e){
      print(e);
    });

  });

}



class Worker {

  ///定时抓取
  static const Duration timerDuration = Duration(milliseconds: 300);
  Timer _timer;

  ///确定要定时抓取后的检测器
  Timer _checkTimer;
  Duration checkDuration = Duration(milliseconds: 100);

  ///同时最多请求6个
  ///若已经6个了 新来的直接添加在后面 第一个任务即最早的任务直接丢弃
  List<String> working = List();

  ///新来的请求加到这里等待定时抓取
  List<String> entering = List();
  Map<String,Completer> enteringNoFuture = {};


  ///标记抓取的起点
  String flagUrl;

  ///生成的
  SendPort sendPort;

  Isolate _isolate;
  final _isolateReady = Completer<void>();

  Future<void> get isReady => _isolateReady.future;

  Worker(){
    init();
  }

  Future<void> init() async{
    _timer = Timer.periodic(timerDuration, (t){
      if(entering.length ==0){
        return;
      }

      //抓取开始
      flagUrl = entering[entering.length-1];
      //抓取是否有用的检测也开始
      _checkTimer = Timer(checkDuration, (){
        _checkTimer = null;

        //检测通过此次的抓取有用
        if(flagUrl != null){
          //从 flagUrl 开始向前拿3个任务
          work(flagUrl);

          int indexOfflagUrl = entering.indexOf(flagUrl);
          if(indexOfflagUrl == 0){
          }else if(indexOfflagUrl == 1){
            work(entering.elementAt(0));
          }else if(indexOfflagUrl == 2){
            work(entering.elementAt(0));
            work(entering.elementAt(1));
          }else{
            //再前面的任务直接销毁
            for(int i=indexOfflagUrl-3;i>=0;i--){
              enteringNoFuture[entering.elementAt(i)].completeError("drop");
              enteringNoFuture.remove(entering.elementAt(i));
            }
            //entering flagUrl之前的清除
            entering = entering.sublist(indexOfflagUrl+1);
          }
        }
      });
    });

    ///主线程的
    final receivePort = ReceivePort();
    receivePort.listen((_handleMessage));

    _isolate = await Isolate.spawn(_isolateEntry, receivePort.sendPort);
  }
  ///主线程在这里干事
  _handleMessage(dynamic message){
    if(message is SendPort){
      sendPort = message;
      _isolateReady.complete();
      return;
    }
    ///其他消息处理

  }


  static void _isolateEntry(dynamic message){
    ///主线程的
    SendPort sendPort;
    ///生成的
    final receivePort = ReceivePort();
    receivePort.listen((dynamic message){
      ///生成的在这里干事
      

    });

    if(message is SendPort){
      sendPort = message;
      sendPort.send(receivePort.sendPort);
      return;
    }

  }

  void work(String url) async{

    if(working.length == 6){
      enteringNoFuture[working.elementAt(0)].completeError("drop");
      enteringNoFuture.remove(working.elementAt(0));
      working.removeAt(0);
    }

    working.add(url);
    entering.remove(url);

    ///模拟任务
    Timer(Duration(seconds: Random().nextInt(5)), (){
      enteringNoFuture[url].complete(100);
      enteringNoFuture.remove(url);
    });
  }

  Future<int> into(String url){
    if(_checkTimer != null && _checkTimer.isActive){
      //上次的抓取丢弃
      flagUrl = null;
    }

    ///todo 这里会有bug
    if(entering.contains(url)){
      return Future.value(-2);
    }

    entering.add(url);
    var completer = Completer<int>();
    enteringNoFuture[url] = completer;

    return completer.future;
  }



  void dispose(){
    _isolate.kill();
  }


}