import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class D79646453131313258d9I {

  static Dio _dio = Dio(
      BaseOptions(
          responseType : ResponseType.stream
      ));
  static const int _workingLength = 5;
  static List<String> _working = [];
  static Map<String, Completer<FileInfo>> _enteringNoFuture = {};
  static Map<String, CancelToken> _enteringNoCancelToken = {};
  static Map<String, List<int>> _mediaStream = {};
  static Map<String, StreamSubscription> _mediaStreamSubscription = {};



  Future<FileInfo> mayDownload(String url) async {
    print("99999999999999999999999999999      mayDownload");
    print("99999999999999999999999999999 "+url);

    if (_working.length == _workingLength) {
      print("99999999999999999999999999999        too many then drop");

      var which = _working.elementAt(0);

      _enteringNoCancelToken[which].cancel();
      _enteringNoCancelToken.remove(which);

      _enteringNoFuture[which].completeError("too many then drop");
      _enteringNoFuture.remove(which);

      _working.remove(which);
    }

    _working.add(url);
    var completer = Completer<FileInfo>();



    var cancelToken = CancelToken()..whenCancel.then((value){
      _mediaStreamSubscription[url].cancel();
      _mediaStreamSubscription.remove(url);
      _mediaStream.remove(url);
    } );
    _enteringNoFuture[url] = completer;
    _enteringNoCancelToken[url] = cancelToken;
    _mediaStream[url] = [];



    _dio.request<ResponseBody>(url,cancelToken: cancelToken).then((media){
      print("99999999999999999999999999999      datadata");

      _mediaStreamSubscription[url] = media.data.stream.listen(
            (data) => _mediaStream[url].addAll(data),
        onDone: () async {
          print("99999999999999999999999999999    onDone");
          DefaultCacheManager().putFile(url, Uint8List.fromList(_mediaStream[url]),
            eTag:url,
            maxAge:const Duration(days: 30),
            fileExtension : url.substring(url.lastIndexOf(".")+1),
          ).then((_){
            _mediaStream.remove(url);
            _mediaStreamSubscription.remove(url);

            if (!completer.isCompleted) {
              print("99999999999999999999999999999    到此将结束");

              DefaultCacheManager().getFileFromCache(url).then((value) => completer.complete(value)); //这里就发视频信息
              _working.remove(url);
              _enteringNoFuture.remove(url);
              _enteringNoCancelToken.remove(url);
            }
          });
        },
        onError: (e){
          //      todo  可能需要清理工作
        },
        cancelOnError: true,
      );
    }).catchError((_){
      print("99999999999999999999999999999   catchError" + url.substring(url.length - 7));

      if (!completer.isCompleted) {
        _enteringNoCancelToken.remove(url);
        _mediaStreamSubscription[url].cancel();
        _mediaStreamSubscription.remove(url);

        _enteringNoFuture[url].completeError("exception happen");
        _enteringNoFuture.remove(url);

        _working.remove(url);
        _mediaStream.remove(url);
      }
    });



    // try{
    //   _dio.get<ResponseBody>(url,cancelToken:cancelToken,).then((media){
    //     print("99999999999999999999999999999    media.data.stream.single");
    //
    //     media.data.stream.single.then((value){
    //       print("99999999999999999999999999999    CacheManager().putFile");
    //       CacheManager().putFile(url, value,
    //         eTag:url,
    //         maxAge:const Duration(days: 30),
    //         fileExtension : url.substring(url.lastIndexOf(".")+1),
    //       ).then((_){
    //         if (!completer.isCompleted) {
    //           print("99999999999999999999999999999    到此");
    //
    //           CacheManager().getFileFromCache(url).then((value) => completer.complete(value)); //这里就发视频信息
    //           _working.remove(url);
    //           _enteringNoFuture.remove(url);
    //           _enteringNoCancelToken.remove(url);
    //         }
    //       });
    //     }
    //     );
    //   }
    //
    //   );
    // }catch(e) {
    //   print("99999999999999999999999999999" + url.substring(url.length - 7));
    //   print(e.toString());
    //
    //   if (!completer.isCompleted) {
    //     _enteringNoCancelToken.remove(url);
    //
    //     _enteringNoFuture[url].completeError("exception happen");
    //     _enteringNoFuture.remove(url);
    //
    //     _working.remove(url);
    //   }
    // }


    // _dio
    //     .download(url, "./" + url.substring(url.length - 7),
    //         cancelToken: cancelToken)
    //     .then((value) {
    //   if (!completer.isCompleted) {
    //     completer.complete(url); //这里就发视频信息
    //     _working.remove(url);
    //     _enteringNoFuture.remove(url);
    //     _enteringNoCancelToken.remove(url);
    //   }
    // }).catchError((e) {
    //   print("99999999999999999999999999999" + url.substring(url.length - 7));
    //   print(e.toString());
    //
    //   if (!completer.isCompleted) {
    //     _enteringNoCancelToken.remove(url);
    //
    //     _enteringNoFuture[url].completeError("error");
    //     _enteringNoFuture.remove(url);
    //
    //     _working.remove(url);
    //   }
    // });

    return completer.future;
  }
}
