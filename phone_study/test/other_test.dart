import 'dart:convert';

//import 'package:built_collection/src/set.dart';
//import 'package:phone_study/built_value/guinea.dart';
//import 'package:phone_study/built_value/serializers.dart';
import 'package:test/test.dart';


void main(){

  test("description:study test 01", (){

    expect(true, false);

  });


  group("description:study group", (){

    test("description:in group test 01", (){
      expect(false, true);
    });
    test("description:in group test 02", (){
      expect(true, false);
    });
  },
  testOn: "vm");

//  test.test("just playaround", ()  {
//
//    var json = '{"name":"pig","text":"ttteaxt","nickName":"hahhaha","targets":["aa","bb"]}';
//
//
//    GuineaBuilder()
//    ..name = "ari"
//    ..text = "tttt"
//    ..targets = (SetBuilder<String>())
//    ..build();
//
//    print(standardSerializers.deserializeWith(Guinea.serializer,jsonDecode(json)).runtimeType);
//
//
//
//    test.expect(standardSerializers.deserializeWith(Guinea.serializer,jsonDecode(json)).name,test.equals('pig'));
////    test.expect(serializers.deserializeWith(Guinea.serializer,jsonDecode(json)).name,test.equals('pig'));
//
//  },skip: true);

}