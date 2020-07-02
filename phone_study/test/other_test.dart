import 'dart:convert';

import 'package:built_collection/src/set.dart';
import 'package:phone_study/built_value/guinea.dart';
import 'package:phone_study/built_value/serializers.dart';
import 'package:test/test.dart' as test;


void main(){

  test.test("just playaround", ()  {

    var json = '{"name":"pig","text":"ttteaxt","nickName":"hahhaha","targets":["aa","bb"]}';


    GuineaBuilder()
    ..name = "ari"
    ..text = "tttt"
    ..targets = (SetBuilder<String>())
    ..build();

    print(standardSerializers.deserializeWith(Guinea.serializer,jsonDecode(json)).runtimeType);



    test.expect(standardSerializers.deserializeWith(Guinea.serializer,jsonDecode(json)).name,test.equals('pig'));
//    test.expect(serializers.deserializeWith(Guinea.serializer,jsonDecode(json)).name,test.equals('pig'));

  });

}