library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:phone_study/built_value/guinea.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';

/// Collection of generated serializers for the built_value chat example.
@SerializersFor([
  Guinea,
])
///原生的结构人不容易看  模型也不会在里面看到
final Serializers serializers = _$serializers;
///json格式的人容易看
Serializers standardSerializers = (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();