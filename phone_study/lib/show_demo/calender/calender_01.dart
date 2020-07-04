import 'package:flutter/material.dart';
import 'dart:math';

class Calender01 extends StatefulWidget {
  @override
  _Calender01State createState() => _Calender01State();
}

class _Calender01State extends State<Calender01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          //移除顶部 阴影0
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Text("选择提醒时间",
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
        body: SafeArea(
            child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: AboutCalenderWidget(),
                  ),
                ])));
  }
}

//日历是否是收缩状态
bool _calenderShrinkWraped = false;
class AboutCalenderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AboutCalenderWidgetState();
}

class _AboutCalenderWidgetState extends State<AboutCalenderWidget> {
  final DateTime _now = DateTime.now();
  DateTime _currentDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(60),
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300],
                blurRadius: 8
            )
          ]
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                      "周日",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          color: Colors.grey),
                    )),
                Expanded(
                  child: Text("周一",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          color: Colors.grey)),
                ),
                Expanded(
                    child: Text("周二",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.none,
                            color: Colors.grey))),
                Expanded(
                    child: Text("周三",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.none,
                            color: Colors.grey))),
                Expanded(
                    child: Text("周四",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.none,
                            color: Colors.grey))),
                Expanded(
                    child: Text("周五",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.none,
                            color: Colors.grey))),
                Expanded(
                    child: Text("周六",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.none,
                            color: Colors.grey))),
              ],
            ),
          ),
          _generateGrid(_currentDate),
          Container(
            height: 45,
            alignment: Alignment(0,0),
            width: double.infinity,
            child: GestureDetector(
              onTap: (){},
              child: Transform.rotate(
                  angle:_calenderShrinkWraped?-2*pi/4:2*pi/4,
                  child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _calenderShrinkWraped = !_calenderShrinkWraped;
                        });
                      },
                      child: Icon(Icons.arrow_back_ios,color: Colors.grey,))),
            ),
          )
        ],
      ),
    );
  }

  _generateGrid(DateTime dateChoose) {
    //总共有多少个格子
    List<String> total = [];
    //本月有几天
    int days = _days(dateChoose.year, dateChoose.month);
    //上个月有几天
    int daysBefore = _days(
        (_currentDate.month == 1) ? (_currentDate.year - 1) : _currentDate.year,
        (_currentDate.month == 1) ? 12 : _currentDate.month - 1);
    //本月第一天是星期几
    int first = _xingQi(dateChoose.year, dateChoose.month);

    //上面空的天数
    int kong = 0;
    if (first != 7) {
      kong = first;
    }

    for (int i = kong; i > 0; i--) {
      total.add((daysBefore - i + 1).toString());
    }
    for (int i = 1; i <= days; i++) {
      total.add(i < 10 ? "0" + i.toString() : i.toString());
    }
    //下面空的天数
    int kongBack = 42 - total.length;
    for (int i = 1; i <= kongBack; i++) {
      total.add((i < 10) ? "0" + i.toString() : i.toString());
    }

    //生成控件
    List<Widget> every = [];
    for (int i = 0; i < total.length; i++) {
      //收缩状态只显示一行
      if(_calenderShrinkWraped && i == 7){
        break;
      }

      bool grey = false;
      if ((i + 1) <= kong || (i + 1) > (kong + days)) {
        grey = true;
      }

      List<Widget> items = [];

      //几号
      items.add(Container(
        width: (MediaQuery.of(context).size.width) / 7,
        height: (MediaQuery.of(context).size.width) / 7,
        alignment: Alignment(0, 0),
        child: Text(
          total[i],
          style: TextStyle(
              fontSize: 14,
              decoration: TextDecoration.none,
              color: grey
                  ? Color.fromRGBO(160, 168, 172, 1)
                  : Color.fromRGBO(51, 51, 51, 1)),
        ),
      ));
      //今天？
      if (_now.year == _currentDate.year &&
          _now.month == _currentDate.month &&
          _now.day == i + 1 - kong) {
        items.add(Container(
          width: (MediaQuery.of(context).size.width - 1) / 7,
          height: (MediaQuery.of(context).size.width - 1) / 7,
          alignment: Alignment(0, 0),
          child: Container(
            width: (MediaQuery.of(context).size.width - 1) / 7 - 25,
            height: (MediaQuery.of(context).size.width - 1) / 7 - 25,
            alignment: Alignment(0, 0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(0, 212, 143, 1),
                      Color.fromRGBO(0, 168, 126, 1),
                    ]),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 168, 126, 0.5), blurRadius: 6)
                ]),
            child: Text("今",
                style: TextStyle(
                    fontSize: 17,
                    decoration: TextDecoration.none,
                    color: Colors.white)),
          ),
        ));
      }
      //计划
      if (!grey && Random().nextInt(30) % 2 == 1) {
        //今天就不显示计划了
        if(!(_now.year == _currentDate.year &&
            _now.month == _currentDate.month &&
            _now.day == i + 1 - kong)){
          items.add(Container(
            width: (MediaQuery.of(context).size.width - 1) / 7,
            height: (MediaQuery.of(context).size.width - 1) / 7,
            alignment: Alignment(0, 0),
            padding: EdgeInsets.fromLTRB(22, 0, 0, 18),
            child: Container(
              width: 10,
              height: 10,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 153, 139, 1),
                shape: BoxShape.circle,
              ),
              child: Text("1",style: TextStyle(
                  fontSize: 6,
                  color: Colors.white
              ),),
            ),
          ));
        }
      }

      every.add(Stack(
        children: items,
      ));
    }

    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: GridView.count(
          controller: ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          crossAxisCount: 7,
          children: every,
        ));
  }

  ///某月有几天
  int _days(int year, int month) {
    int days = 0;
    if (month != 2) {
      switch (month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
          days = 31;
          break;
        case 4:
        case 6:
        case 9:
        case 11:
          days = 30;
      }
    } else {
//      闰年
      if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)
        days = 29;
      else
        days = 28;
    }
    return days;
  }

  ///某月第一天是星期几
  int _xingQi(int year, int month) {
    return DateTime(year, month, 1).weekday;
  }
}

