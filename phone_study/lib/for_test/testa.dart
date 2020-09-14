import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'dart:typed_data';
//import 'package:flutter/foundation.dart' show describeEnum;
import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';


void main() async {

  Dio _dio = Dio(
      BaseOptions(
        responseType : ResponseType.stream
    )
  );

  String message = "http://petreasureceshiyong.oss-cn-hongkong.aliyuncs.com/temp/001.mp4";

  // print(message.substring(message.lastIndexOf(".")));

  // Dio().get<ResponseBody>(message).then((media){

  List<int> fafa = List<int>();
  Uint8List fileBytes;

  CancelToken cancelToken = CancelToken();
  StreamSubscription subscription;

  cancelToken.whenCancel.then((value){
    subscription.cancel();
    fafa = null;
    fileBytes = null;
  } );

  _dio.request<ResponseBody>(message,cancelToken: cancelToken).then((media){
    subscription = media.data.stream.listen(
          (data) => fafa.addAll(data),
      onDone: () async {
        print("onDone");
        fileBytes = Uint8List.fromList(fafa);
        fafa = null;

        DefaultCacheManager().putFile(message, fileBytes,
          eTag:message,
          maxAge:const Duration(days: 30),
          fileExtension : message.substring(message.lastIndexOf(".")+1),
        ).then((_){

            print("99999999999999999999999999999    到此将结束");

            DefaultCacheManager().getFileFromCache(message).then((value){

              print(value.originalUrl);

            }); //这里就发视频信息

        });
      },
      cancelOnError: true,
    );
  });

  Timer(Duration(seconds: 5), (){
    cancelToken.cancel();
  });


}
void amain() async {

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



      dio.get<ResponseBody>(message,cancelToken:cancelToken,).then((media){
        
        media.data.stream.toList().then((value){
          
          
          
        });
        
      });
      

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

      return completer.future;
    }

    return Future.error("nothing");
  }


  File sa;
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

