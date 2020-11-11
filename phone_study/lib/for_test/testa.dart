import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

import 'dart:async';

main(){

  bool setStating = true;

  print((setStating)?0: (){
    print(1);
    setStating = false;
  }.call());

  print(setStating);

}


