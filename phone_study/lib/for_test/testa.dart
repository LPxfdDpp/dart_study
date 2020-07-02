import 'dart:math' as math;

void main() {





var dated = DateTime(2020,7,5);

print(dated.day);


}

class Animal {
  void chase(Animal x) {  }
}

class Mouse extends Animal {  }

class Cat extends Animal {
  void chase(covariant Mouse x) {  }
}








