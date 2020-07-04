import 'package:flutter/material.dart';

class SimpleQuadraticBezierWithAnimation01 extends StatefulWidget {
  @override
  _SimpleQuadraticBezierWithAnimation01State createState() => _SimpleQuadraticBezierWithAnimation01State();
}

class _SimpleQuadraticBezierWithAnimation01State extends State<SimpleQuadraticBezierWithAnimation01> with SingleTickerProviderStateMixin {
  ValueNotifier<Offset> _valueNotifier = ValueNotifier(null);
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _valueNotifier.addListener(() {
      setState(() {});
    });

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));

    _animation = Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: _animationController,curve: Curves.bounceOut))
      ..addListener((){
        setState(() {
          _baseWidth = _animationController.value;
        });
      });
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    _animationController.dispose();
    super.dispose();
  }

  var _phoneWidth;
  var _phoneHeight;
  double _baseWidth;

  @override
  Widget build(BuildContext context) {
    _phoneWidth ??= MediaQuery.of(context).size.width;
    _phoneHeight ??= MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("收付款"), leading: Icon(Icons.arrow_back_ios)),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/guineaPig.jpeg"),
                  fit: BoxFit.cover)),
          child: ClipPath(
            clipper: MyClipper(null == _valueNotifier.value
                ? Offset(_phoneWidth, 0)
                : _valueNotifier.value,baseWidth: _baseWidth),
            child: GestureDetector(
              onPanUpdate: (d) {
                if (_animationController.isDismissed && d.localPosition.dx < _phoneWidth * 2 / 3) {
                  _animationController.forward();
                } else {
                  _valueNotifier.value = d.localPosition;
                }
              },
              child: Opacity(
                opacity: null == _valueNotifier.value
                    ? 1
                    : _valueNotifier.value.dx / _phoneWidth,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  alignment: Alignment.center,
                  child: Text("data"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  Offset offset;
  double baseWidth;

  MyClipper(this.offset,{this.baseWidth});

  @override
  getClip(Size size) {
    var path = Path();

    Size ssize;
    if(null != baseWidth){
      ssize = Size((1-baseWidth)*size.width, size.height);
      offset = Offset((1-baseWidth)*offset.dx, offset.dy);
    }else{
      ssize = size;
    }

    path.lineTo(ssize.width, 0);

    path.quadraticBezierTo(
        offset.dx + 3, offset.dy * 1 / 4, offset.dx, offset.dy);
    path.quadraticBezierTo(
        offset.dx + 3, offset.dy * 7 / 4,

        (null == baseWidth)?size.width:(baseWidth >= 0.5?(1-baseWidth)*2*size.width:size.width),

        (null == baseWidth)?offset.dy*2:(offset.dy +baseWidth*2*(size.height-offset.dy)));
    path.lineTo(size.width, ssize.height);
    path.lineTo(0, ssize.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
