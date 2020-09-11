import 'dart:async';
import 'dart:collection';
import 'dart:isolate';
import 'dart:math';
//import 'package:flutter/foundation.dart' show describeEnum;
import 'package:dio/dio.dart';


void smain() async {

  String message = "https://petreasureceshiyong.oss-cn-hongkong.aliyuncs.com/temp/001.mp4";

  print(message.substring(message.length-7));
}
void main() async {

  Dio dio = Dio(
      BaseOptions(receiveTimeout: 20000)
  );


   List<String> working = [];
   Map<String,Completer<String>> enteringNoFuture = {};
   Map<String,CancelToken> enteringNoCancelToken = {};

   Future<String> work(dynamic message) async{
    if(message is String){
      if(working.length == 6){

        var which = working.elementAt(0);

        enteringNoCancelToken[which].cancel();
        enteringNoCancelToken.remove(which);

        enteringNoFuture[which].completeError("drop");
        enteringNoFuture.remove(which);

        working.remove(which);
      }

      working.add(message);
      var completer = Completer<String>();
      var cancelToken = CancelToken();
      enteringNoFuture[message] = completer;
      enteringNoCancelToken[message] = cancelToken;



      dio.download(message, "./"+message.substring(message.length-7),cancelToken:cancelToken).then((value){
        if(! completer.isCompleted){
          completer.complete(message);//这里就发视频信息
          working.remove(message);
          enteringNoFuture.remove(message);
          enteringNoCancelToken.remove(message);
        }
      }).catchError((e){
        print("99999999999999999999999999999"+message.substring(message.length-7));
        print(e.toString());

        if(! completer.isCompleted){
          enteringNoCancelToken.remove(message);

          enteringNoFuture[message].completeError("error");
          enteringNoFuture.remove(message);

          working.remove(message);
        }
      });

//      Timer(Duration(seconds: Random().nextInt(10)), (){
//
//        if(! completer.isCompleted){
//          completer.complete(message);
//          working.remove(message);
//          enteringNoFuture.remove(message);
//        }
//      });

      return completer.future;
    }

    return Future.error("nothing");
  }


  String data = "https://petreasureceshiyong.oss-cn-hongkong.aliyuncs.com/temp/00";


  List.generate(10, (index) {

    work(data+(index+1).toString()+".mp4").then((value){
      print("***********************");
      print(value);
    }).catchError((e){
      print("=======================");
      print(e.toString());
    });

  });

//  var tt;
//   tt = Timer.periodic(Duration(seconds: 2), (t){
//
//    print("(((((((((((((((((((((((((((((((((((");
//    print(working.length);
//    print(enteringNoFuture.length);
//    if(working.length == 0){
//
//      List.generate(10, (index) {
//
//        work(data+(index+1).toString()+".mp4").then((value){
//          print("***********************111");
//          print(value);
//        }).catchError((e){
//          print("=======================222");
//          print(e.toString());
//        });
//
//      });
//
//      tt.cancel();
//
//    }
//  });


}

