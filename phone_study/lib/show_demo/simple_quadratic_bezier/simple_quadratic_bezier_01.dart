import 'package:flutter/material.dart';

class SimpleQuadraticBezier01 extends StatefulWidget {
  @override
  _SimpleQuadraticBezier01State createState() => _SimpleQuadraticBezier01State();
}

class _SimpleQuadraticBezier01State extends State<SimpleQuadraticBezier01> {
  @override
  void initState() {
    super.initState();

    items = [ GestureDetector(
      onTap: (){
        setState(() {
          items.insert(0, items.removeAt(1));
        });
      },
      child: ClipPath(
        clipper:OwnClipper("left"),
        child: Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: Colors.lightBlueAccent,
          ),
        ),
      ),
    ),
      GestureDetector(
        onTap: (){
          setState(() {
            items.insert(0, items.removeAt(1));
          });
        },
        child: ClipPath(
          clipper:OwnClipper("right"),
          child: Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: Colors.orangeAccent,
            ),
          ),
        ),
      ),];
  }

  var _phoneWidth;
  List<Widget> items;


  @override
  Widget build(BuildContext context) {

    _phoneWidth ??= MediaQuery.of(context).size.width;



    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text("收付款"),
            leading:Icon(Icons.arrow_back_ios)
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(15, 20, 15, 0),

          child: Stack(children: items,),
        ),
      ),
    );
  }
}
class OwnClipper extends CustomClipper<Path> {
  final String type;

  const OwnClipper(this.type);

  @override
  Path getClip(Size size) {
    var path = Path();
    if(type == "left"){
      var width = size.width;
      var height = 25.0;

      path.lineTo(width/2-22,0);
      path.quadraticBezierTo(width/2-6, 3, width/2, height);
      path.quadraticBezierTo(width/2+6, 2*height-3, width/2+22, 2*height);
      path.lineTo(width-6,2*height);
      path.quadraticBezierTo(width-1, 2*height+1, width, 2*height+6);
      path.lineTo(width,size.height);
      path.lineTo(0,size.height);
      path.close();
    }else if(type == "right"){
      var width = size.width;
      var height = 25.0;

      path.lineTo(0,2*height+6);
      path.quadraticBezierTo(1, 2*height+1, 6, 2*height);
      path.lineTo(width/2-22,2*height);
      path.quadraticBezierTo(width/2-6, 2*height-3, width/2, height);
      path.quadraticBezierTo(width/2+6, 3, width/2+22, 0);
      path.lineTo(width,0);
      path.lineTo(width,size.height);
      path.lineTo(0,size.height);
      path.close();
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper)=>true;

}