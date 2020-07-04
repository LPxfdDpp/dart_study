import 'dart:developer';
import 'dart:math' as math;
import 'package:logging/logging.dart' as llog;

void main() {
  hei(){
    var inFuction = const Mouses("kity");

    print(inFuction.hashCode);

  }

 var one = const Mouses("kity");
 var two = const Mouses("kity");
 var three = Mouses("jemi");

 print(one == two);

print(one.hashCode);
print(two.hashCode);
print(three.hashCode);


hei();


  var ppp = {3,4,5};




}

class Mouses {
  final String name;

  const Mouses(this.name);
}

class Animal {
  void chase(Animal x) {  }
}

class Mouse extends Animal {

}

class Cat extends Animal {
  void chase(covariant Mouse x) {  }
}








