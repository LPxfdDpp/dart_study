
import 'dart:async';

import 'package:flutter/material.dart';

class AlphabetScroll01 extends StatefulWidget {
  @override
  _AlphabetScroll01State createState() => _AlphabetScroll01State();
}

class _AlphabetScroll01State extends State<AlphabetScroll01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _bjxuContent(),
      ),
    );
  }




  ///班级学员的内容
  //控制显示内容用的
  ScrollController _scrollController = ScrollController();
  //控制右边滑条用的
  StreamController<String> _streamController = StreamController.broadcast();
  //活动条小格的宽高
  double _geziKG = 15;
  //活动条弹出小球的宽高
  double _tanchuKG = 30;
  //右边滑动条弹出需要
  OverlayState _overlayState;
  OverlayEntry _overlayEntry;
  //先前显示的zi
  String _zi;
  //A B C。。。在内容中的位置
  Map<String,double> _everyPosition;

  static const List<String> _alp = [
    "A","B","C","D","E","F","G","H","I","J","K",
    "L","M","N","O","P","Q","R","S","T","U","V",
    "W","X","Y","Z"
  ];
  //默认每个字母控件高度30 具体内容高度100
  double _wenHeight = 30;
  double _neiHeight = 120;
  _bjxuContent(){
    //右边滑动条弹出需要
    _showRightPop(BuildContext context,Offset offset){
      if(null != _overlayEntry){
        _overlayEntry.remove();
        _overlayEntry = null;
      }
      _overlayEntry = OverlayEntry(
          builder: (context) => Positioned(
              left: offset.dx,
              top: offset.dy,
              child: Container(
                width: 30,
                height: 30,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.deepOrange,
                  child: Text("1"),
                ),
              )
          )
      );
      _overlayState.insert(_overlayEntry);
    }

    if(null == _overlayState){
      _overlayState = Overlay.of(context);
    }
    //假数据
    Map<String,List<String>> fake = {
      "A":["阿牛","阿玛","阿曼"],
      "B":["笔译","比尔","避三","必死","比武","必留","比起","比吧"],
      "C":["c笔译","c比尔","c避三","c必死","c比武","c必留","c比起","c比吧"],
      "M":["M笔译","M比尔","M避三","M必死","M比武","M必留","M比起","M比吧"],
    };
    var keys = fake.keys;

    ///A B C ... 位置生成
    if(null == _everyPosition){
      _everyPosition = {};
      _alp.forEach((element) {
        if(element == "A"){
          _everyPosition["A"] = 0;
        }else{
          if(fake.containsKey(element)){
            int wei = _alp.indexOf(element)-1;
            double preHeight;
            while(null == _everyPosition[_alp.elementAt(wei)]){
              wei--;
            }
            preHeight = _everyPosition[_alp.elementAt(wei)];
            double ownHeight = preHeight +_wenHeight+ fake[_alp.elementAt(wei)].length*_neiHeight;
            _everyPosition[element] = ownHeight;
          }
        }
      });
    }
    ///要生成的控件个数
    int geshu = 0;
    keys.forEach((element) =>geshu += 1+fake[element].length);

    return Column(
      children: <Widget>[
        Flexible(
          child: Stack(children: <Widget>[
            //显示条
            ListView.builder(
              shrinkWrap: true,
              controller: _scrollController,
              itemBuilder: (context,index){
                //当前index 对应 fake 里的哪个key
                String key;
                //当前index 对应 fake 里key值的那个位置 坐标从1开始  若此值为0这表示是标题字母
                int pos;

                int posiFlag = 0;
                for (var i = 0; i < fake.length; ++i) {
                  int temp =fake[keys.elementAt(i)].length;
                  if(temp+posiFlag >= index){
                    key = keys.elementAt(i);
                    pos = index-posiFlag;
                    break;
                  }else{
                    posiFlag += temp+1;
                  }
                }

                return pos == 0?Container(
                  width: double.infinity,
                  height: _wenHeight,
                  child: Text(key,style:const TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                ): Container(
                  margin:const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  width: double.infinity,
                  height: _neiHeight,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.brown,
                      )
                  ),
                  alignment: Alignment.center,
                  child: Text(fake[key][pos-1]),
                );
              },
              itemCount: geshu,
            ),
            //右边滑动条
            Positioned(
              right: 0,
              bottom: 0,
              child: SafeArea(
                child: Container(
                  width: _geziKG,
                  child: GestureDetector(
                    onPanUpdate: (de){
                      int wei = de.localPosition.dy~/_geziKG;
                      String zi = _alp[wei];

                      Offset global = de.globalPosition;

                      if(fake.containsKey(zi) && (null == _zi || _zi != zi)){
                        _zi = zi;

                        _scrollController.animateTo(_everyPosition[zi], duration: Duration(milliseconds: 500), curve: Curves.ease);
                        _streamController.add(zi);

                        var now = Offset(global.dx -de.localPosition.dx-_tanchuKG, global.dy +(_geziKG/2-de.localPosition.dy%_geziKG)-_tanchuKG/2);
                        _showRightPop(context,now);
                      }
                    },
                    onPanEnd: (de){
                      _zi = null;
                      _streamController.add('');
                      if(null != _overlayEntry){
                        _overlayEntry.remove();
                        _overlayEntry = null;
                      }
                    },
                    child: Column(
                      children: _alp.map<Widget>((e) => StreamBuilder<String>(
                          stream: _streamController.stream,
                          builder: (context, snapshot) {
                            var bkColor = Colors.blueGrey[200];
                            if(snapshot.hasData && snapshot.data == e){
                              bkColor = Colors.green;
                            }
                            return Container(
                              height: _geziKG,
                              width: _geziKG,
                              child: Text(e,style: const TextStyle(
                                  fontSize: 9
                              ),),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: bkColor
                              ),
                            );
                          }
                      )).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],),
        ),
      ],
    );
  }
}
