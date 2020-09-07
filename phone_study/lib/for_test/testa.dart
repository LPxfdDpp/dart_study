import 'dart:async';
import 'dart:isolate';
import 'dart:math';
//import 'package:flutter/foundation.dart' show describeEnum;
import 'package:dio/dio.dart';



void main() async {


       List<int> list1 = [1, 2, 3, 4];
       List<int> list2 = [5, 6, 7, 8, 9];
       // Copies the 4th and 5th items in list2 as the 2nd and 3rd items
      // of list1.
       list1.setRange(1, 3, list2, 3);
       list1.join(', '); // '1, 8, 9, 4'
    print(list1);



}



class AA<T> {


}