import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:phone_study/built_value/serializers.dart';

part 'guinea.g.dart';


///flutter packages pub run build_runner build
///flutter packages pub run build_runner watch

abstract class Guinea implements Built<Guinea, GuineaBuilder> {
  static Serializer<Guinea> get serializer => _$guineaSerializer;

  String get name;

  //可空测试
  @nullable
  String get nickName;

  String get text;

  //集合测试
  BuiltSet<String> get targets;

  //枚举测试
  @nullable
  GuineaType get type;

  Guinea._();
  factory Guinea([void Function(GuineaBuilder) updates]) = _$Guinea;

  //转为json测试
  String toJson(){
    //这种自带的序列化方式不会返回正常的json (下面的fromJson也类似) 返回例子如下：
    //["name","ttt","text","test","targets",["rr","gg"],"type","americalGuinea"]
//    return json.encode(serializers.serializeWith(Guinea.serializer, this));
    //装了 StandardJsonPlugin 后 返回例子如下：
    //{"name":"ttt","text":"test","targets":["rr","gg"],"type":"americalGuinea"}
    return json.encode(standardSerializers.serializeWith(Guinea.serializer, this));
  }
  //从json转入测试
  static Guinea fromJson(String jsonString){
//    return serializers.deserializeWith(Guinea.serializer, json.decode(jsonString));
    return standardSerializers.deserializeWith(Guinea.serializer, json.decode(jsonString));
  }

}

//built_value的枚举
class GuineaType extends EnumClass {
  static Serializer<GuineaType> get serializer => _$guineaTypeSerializer;

  static const GuineaType chineseGuinea = _$chineseGuinea;
  static const GuineaType americalGuinea = _$americalGuinea;

  const GuineaType._(String name) : super(name);

  static BuiltSet<GuineaType> get values => _$values;
  static GuineaType valueOf(String name) => _$valueOf(name);
}