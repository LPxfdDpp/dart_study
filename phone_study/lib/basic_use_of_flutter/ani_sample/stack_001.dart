
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Stack001 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Stack001State();
}

class Stack001State extends State<Stack001> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  ValueNotifier<int> change;
  ValueNotifier<bool> moveChange;
  double _hStart;
  double _hUpdate;

  double _deviceWidth;
  @override
  Widget build(BuildContext context) {
    if(_deviceWidth == null){
      _deviceWidth = MediaQuery.of(context).size.width;
      _animationController = AnimationController(
          value: 0,
          lowerBound: -_deviceWidth,
          upperBound: _deviceWidth,
          vsync: this);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("hello"),
        ),
        body: GestureDetector(
          onHorizontalDragStart: (d){
            _hStart = d.localPosition.dx;
          },
          onHorizontalDragUpdate: (d){
            _hUpdate = d.localPosition.dx;
            if(_hUpdate > _hStart && moveChange.value){
              moveChange.value = false;
            }else if(_hUpdate < _hStart && !moveChange.value){
              moveChange.value = true;
            }
            _animationController.value = _hUpdate-_hStart;
          },
          onHorizontalDragEnd: (d){
            double cha = _hUpdate - _hStart;
            bool moveLeft;
            if(cha >= 0){
              moveLeft = false;
            }else{
              moveLeft = true;
            }

            if(!moveLeft){
              if(cha >= (_deviceWidth-_hStart)/3){
                _animationController.animateTo(_deviceWidth,duration:Duration(milliseconds: 200))
                    .whenComplete((){
                  change.value -= 1;
                  moveChange.value = true;
                });
              }else{
                _animationController.animateTo(0,duration:Duration(milliseconds: 200));
              }
            }else{
              if(-cha >= _hStart/3){
                _animationController.animateTo(-_deviceWidth,duration:Duration(milliseconds: 200))
                    .whenComplete((){
                  change.value += 1;
                  moveChange.value = true;
                });
              }else{
                _animationController.animateTo(0,duration:Duration(milliseconds: 200));
              }
            }

          },
          child: AniLayer(
            animationController: _animationController,
            change:change,
            moveChange:moveChange,
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    change = ValueNotifier<int>(0);
    moveChange = ValueNotifier<bool>(true);
  }

  @override
  void dispose(){
    _animationController.dispose();
    change.dispose();
    moveChange.dispose();
    super.dispose();
  }

}

class AniLayer extends StatefulWidget {
  final ValueNotifier<int> change;
  final ValueNotifier<bool> moveChange;
  final AnimationController animationController;

  AniLayer({Key key,this.change,this.moveChange,this.animationController}) : super(key: key);

  @override
  _AniLayerState createState() => _AniLayerState();
}

class _AniLayerState extends State<AniLayer> {
  ValueNotifier<int> indexShow = ValueNotifier<int>(0);
  ValueListenableBuilder aa;
  ValueListenableBuilder bb;
  String canAni = "bb";
  int old;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        aa,
        bb,
      ],
    );
  }
  List<String> messs = ["看似简单", "阿里山的空间", "士大夫事故发生的", "岁的法国", "啊可是觉得很烦"];
  @override
  void initState() {
    super.initState();
    aa = ValueListenableBuilder(
      key: Key("aa"),
      valueListenable: indexShow,
      builder: (_,v,child){
        return AnimatedBuilder(
          animation: widget.animationController,
          builder:(_,child){
            return Transform.translate(
                offset: Offset(
                    (canAni == "aa")?widget.animationController.value:0,0
                ),
                child: SizedBox.expand(
                    child: ColoredBox(
                      color: Colors.orangeAccent,
                      child: Center(
                        child: ValueListenableBuilder(
                          valueListenable: widget.moveChange,
                          builder: (_,vv,child){
                            if(!vv){
                              var v = indexShow.value;
                              return Text(messs[(canAni == "aa")?v:v-1]);
                            }
                            return child;
                          },
                          child: Text(messs[(canAni == "aa")?v:v+1]),
                        ),
                      ),
                    )));
          },
        );
      },
    );
    bb = ValueListenableBuilder(
      key: Key("bb"),
      valueListenable: indexShow,
      builder: (_,v,child){
        return AnimatedBuilder(
          animation: widget.animationController,
          builder:(_,child){
            return Transform.translate(
                offset: Offset(
                    (canAni == "bb")?widget.animationController.value:0,0),
                child: SizedBox.expand(
                    child: ColoredBox(
                      color: Colors.indigo,
                      child: Center(
                        child: ValueListenableBuilder(
                          valueListenable: widget.moveChange,
                          builder: (_,vv,child){
                            if(!vv){
                              var v = indexShow.value;
                              return Text(messs[(canAni == "bb")?v:v-1]);
                            }
                            return child;
                          },
                          child: Text(messs[(canAni == "bb")?v:v+1]),
                        ),
                      ),
                    )));
          },
        );
      },
    );

    widget.change.addListener(() {
      widget.animationController.value = 0;
      var v = widget.change.value;
      int action;
      if(old == null){
        old = v;
        if(v  == -1){
          action = 2;

        }else if(v == 1){
          action = 1;

        }
      }else if(old == v){
        action = 0;
      }else if(old < v){
        old = v;
        action = 1;

      }else{
        old = v;
        action = 2;

      }

      print(action);
      if(action == 1 || action == 2){
        setState(() {
          var temp = aa;
          aa = bb;
          bb = temp;
          if(canAni == "bb"){
            canAni = "aa";
          }else{
            canAni = "bb";
          }
          if(action == 1){
            indexShow.value += 1;
          }else{
            indexShow.value -= 1;
          }
        });
      }


    });
  }

  @override
  void dispose() {
    indexShow.dispose();
    super.dispose();
  }

}
