import 'package:flutter/material.dart';

class TimeAxis01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义时间轴"),
      ),
      body: ListView(
        children: <Widget>[
          _timeAxisPiece(firstPiece: true),
          _timeAxisPiece(),
        ],
      ),
    );
  }
}

///竖向时间轴
_timeAxisPiece({bool firstPiece = false,double top = 5.0,bool haveTitle = true}){
  return Container(
    width: double.infinity,
    child: IntrinsicHeight(
      child: Row(
        children: <Widget>[
          //line
          Container(
            width: 20,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(0, top),
                    child: Container(
                      width: 9,
                      height: 9,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(4, 169, 128, 1),
                          borderRadius: BorderRadius.all(Radius.circular(60))
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(4, firstPiece?top:0, 0, 0),
                    width: 1,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(4, 169, 128, 1),
                        borderRadius: BorderRadius.all(Radius.circular(60))
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //title optional
                  haveTitle?Text("12:00-13:00",style: TextStyle(
                      color: Color.fromRGBO(4, 169, 128, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),):Container(),
                  haveTitle?SizedBox(height: 15,):Container(),
                  //body
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[200],
                              blurRadius: 6
                          )
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("素描课程·01班 ",style: TextStyle(
                            fontSize: 21,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: 10,),
                        Text("素描课程·01班 "),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
