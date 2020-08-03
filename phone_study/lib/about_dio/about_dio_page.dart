
import 'dart:async';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

///复制一点有用的东西
///
/// 拦截器中支持异步任务
///拦截器中不仅支持同步任务，而且也支持异步任务, 下面是在请求拦截器中发起异步任务的一个实例:
///
///dio.interceptors.add(InterceptorsWrapper(
///    onRequest:(Options options) async{
///        //...If no token, request token firstly.
///        Response response = await dio.get("/token");
///        //Set the token to headers
///        options.headers["token"] = response.data["data"]["token"];
///        return options; //continue
///    }
///));
///Lock/unlock 拦截器
///你可以通过调用拦截器的 lock()/unlock 方法来锁定/解锁拦截器。一旦请求/响应拦截器被锁定，接下来的请求/响应将会在进入请求/响应拦截器之前排队等待，直到解锁后，这些入队的请求才会继续执行(进入拦截器)。这在一些需要串行化请求/响应的场景中非常实用，后面我们将给出一个示例。
///
///tokenDio = Dio(); //Create a instance to request the token.
///tokenDio.options = dio.options;
///dio.interceptors.add(InterceptorsWrapper(
///    onRequest:(Options options) async {
///        // If no token, request token firstly and lock this interceptor
///        // to prevent other request enter this interceptor.
///        dio.interceptors.requestLock.lock();
///        // We use a Dio(to avoid dead lock) instance to request token.
///        Response response = await tokenDio.get("/token");
///        //Set the token to headers
///        options.headers["token"] = response.data["data"]["token"];
///        dio.interceptors.requestLock.unlock();
///        return options; //continue
///    }
///));
class AboutDioPage extends StatefulWidget {
  @override
  _AboutDioPageState createState() => _AboutDioPageState();
}

class _AboutDioPageState extends State<AboutDioPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: (){
              fire();
            },
            child: Text("点击测试拦截器顺序")),
      ),
    );
  }


  fire( ) async{
    var dio = Dio();
    dio.options.baseUrl = "https://baidu.com";//正常情况
//    dio.options.baseUrl = "https:baidu.com";//错误情况
    dio.interceptors
      ..add(CacheInterceptor1())
      ..add(CacheInterceptor2())
      ..add(LogInterceptor(requestHeader: false, responseHeader: false));

    await dio.get("/"); // second request
//    await dio.get("/"); // Will hit cache
//    // Force refresh
//    await dio.get("/", options: Options(extra: {'refresh': true}));
  }
}
class CacheInterceptor1 extends Interceptor {
  CacheInterceptor1();

  var _cache = Map<Uri, Response>();

  @override
  Future onRequest(RequestOptions options) async {
    print("CacheInterceptor1 onRequest");
    Response response = _cache[options.uri];
    if (options.extra["refresh"] == true) {
      print("${options.uri}: force refresh, ignore cache! \n");
      return options;
    } else if (response != null) {
      print("cache hit: ${options.uri} \n");
      return response;
    }
  }

  @override
  Future onResponse(Response response) async {
    print("CacheInterceptor1 onResponse");
    _cache[response.request.uri] = response;
  }

  @override
  Future onError(DioError e) async {
    print('CacheInterceptor1 onError: $e');
  }
}
class CacheInterceptor2 extends Interceptor {
  CacheInterceptor2();

  @override
  Future onRequest(RequestOptions options) async {
    print("CacheInterceptor2 onRequest");
  }

  @override
  Future onResponse(Response response) async {
    print("CacheInterceptor2 onResponse");
  }

  @override
  Future onError(DioError e) async {
    print('CacheInterceptor2 onError: $e');
  }
}