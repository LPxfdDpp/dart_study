import 'dart:async';
import 'dart:isolate';
import 'dart:math';
//import 'package:flutter/foundation.dart' show describeEnum;
import 'package:dio/dio.dart';



void main() async {


  print(AA<String>() is AA);
  print(AA() is AA<String>);
  print(AA<String>() is AA<int>);
  print(AA<String>() is AA<String>);



  Dio dio = Dio();


  dio.options = dio.options.merge(
    baseUrl: "https://www.baidu.com",
  );

  dio.get("/lxmhhy/p/13614097.html").then((value) {

    print(value.data);
  }).catchError((e){
    print(e);
  });



}



class AA<T> {


}