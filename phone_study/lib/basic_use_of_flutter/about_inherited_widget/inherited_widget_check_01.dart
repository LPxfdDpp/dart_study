import 'package:flutter/material.dart';

class InheritedWidgetCheck01 extends StatefulWidget {
  @override
  _InheritedWidgetCheck01State createState() => _InheritedWidgetCheck01State();
}

class _InheritedWidgetCheck01State extends State<InheritedWidgetCheck01> {

  var color = Colors.brown;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ///点击后 OwnTestThis(which: 1,) 和 OwnTestThis(which: 2,) 都应该不会 rebuild
        GestureDetector(
          onTap: (){
            setState(() {
            });
          },
          child: Container(
            width: 50,
              height: 50,
              color: Colors.blue,
           ),
        ),
        GestureDetector(
          ///点击后 OwnTestThis(which: 1,) 应该会接到 rebuild 的命令  OwnTestThis(which: 2,) 应该不会 rebuild
          onTap: (){
              setState(() {
//                color =  Colors.brown;
              });
          },
          child: FrogColor(
              color: color,
              child: OwnTestThis()
          ),
        ),
        SizedBox(height: 30,),
        OwnTestThis()
      ],
    );
  }
}

class OwnTestThis extends StatefulWidget {
  @override
  _OwnTestThisState createState() => _OwnTestThisState();
}

class _OwnTestThisState extends State<OwnTestThis> {
  @override
  Widget build(BuildContext context) {
    print("InheritedWidget 的通知来了 ...");
    return Container(
      width: 50,
      height: 50,
      color: Colors.green,
    );
  }
}



 class FrogColor extends InheritedWidget {
   const FrogColor({
     Key key,
     @required this.color,
     @required Widget child,
   }) : assert(color != null),
        assert(child != null),
        super(key: key, child: child);

   final Color color;

   static FrogColor of(BuildContext context) {

//     To obtain the nearest instance of a particular type of inherited widget from a build context,
     return context.dependOnInheritedWidgetOfExactType<FrogColor>();
   }

   @override
   bool updateShouldNotify(FrogColor old) {

     print(color);
     print(old.color);

return     color != old.color ;


   }
 }
