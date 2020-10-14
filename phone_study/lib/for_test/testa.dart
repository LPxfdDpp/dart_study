import 'dart:async';

void main() {


  int fff;

  NKd().addToScene(fff,300);




  // Timer(Duration(days: 1), () {});
}

class NKd {

  say() async{
    for (var i = 0; i < 10; ++i) {
      await Future.delayed(Duration(seconds: 2),);
      print(i);
    }
  }
  void addToScene(int aa, [ int cc = 200 ]) {

    print(aa);
    print(cc);
  }
}