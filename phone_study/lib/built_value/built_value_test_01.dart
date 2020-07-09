



import 'package:built_collection/built_collection.dart';
import 'package:phone_study/built_value/guinea.dart';

void main() {



  var bt = Guinea((b)=>b..name="hhaha"
  ..text="test"
  ..targets = SetBuilder<String>(["a","b"])
  );

  var btq = Guinea((b)=>b..name="hhaha"
    ..text="test"
    ..targets = SetBuilder<String>(["a","b"])
  );

  var btw = Guinea((b)=>b..name="hhaha"
    ..text="test"
//    ..targets.addAll({"a","b"})
    ..targets.addAll({"b","a"})
  );

  print(bt);

  print(bt == btq);
  //三个的hashCode都是一样的 不管btw 是 addAll({"a","b"}) 还是 ({"b","a"})
  print(bt.hashCode);
  print(btq.hashCode);
  print(btw.hashCode);

  print("---------");

  var bt2 = bt.rebuild((r) => r..name = "ttt"
  ..targets = SetBuilder<String>({"rr","gg"})
//      ..type =GuineaType.valueOf("chineseGuinea")
      ..type =GuineaType.americalGuinea
  );


  print(bt2);
  print(GuineaType.values);

  print(bt);

  print("=========");

  print(bt2.toJson());

  //与上面btw的hashCode是相同的
  print(Guinea.fromJson(btw.toJson()).hashCode);

}