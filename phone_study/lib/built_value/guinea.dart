import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

part 'guinea.g.dart';

abstract class Guinea implements Built<Guinea, GuineaBuilder> {
  static Serializer<Guinea> get serializer => _$guineaSerializer;

  String get name;

  @nullable
  String get nickName;

  String get text;

  BuiltSet<String> get targets;

  Guinea._();
  factory Guinea([void Function(GuineaBuilder) updates]) = _$Guinea;
}
