import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_study/bloc_page/colb_page/colb_page_bloc.dart';

class BlocPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.blue[100],
//            image:DecorationImage(
//                fit: BoxFit.fitWidth,
//                alignment: Alignment.topCenter,
//                image: null
//            )
        ),
        child: WillPopScope(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.brown[100],
              automaticallyImplyLeading: false,
              titleSpacing: 0,
              centerTitle: true,
              title: Container(
                alignment: Alignment(0, 0),
                width: MediaQuery.of(context).size.width,
                height: kBottomNavigationBarHeight,
                decoration: BoxDecoration(),
                child: Text.rich(
                  TextSpan(
                      text: "bloc学习页",
                      style: TextStyle(
                      )),
                  textScaleFactor: 1.0,
                ),
              ),
            ),
            body: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height -
                    kBottomNavigationBarHeight -
                    MediaQueryData.fromWindow(window).padding.top -
                    kToolbarHeight,
                child: SafeArea(
                  ///1 providing our bloc
                  child: BlocProvider<ColbPageBloc>(
                      create: (context) => ColbPageBloc(),
                      child: BlocPageReal(),
                  ),
                )),
            bottomNavigationBar: Container(
                color: Colors.amber[100],
                height: kBottomNavigationBarHeight,
                child: null),
          ),
          onWillPop: () {},
        ));
  }

}

///步骤
//1 providing our bloc

//2 access bloc

//3 build the provided bloc widgets

//4 add events

//5 output the state
class BlocPageReal extends StatelessWidget{

  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ///2 access bloc
    final ColbPageBloc _colbPageBloc = BlocProvider.of<ColbPageBloc>(context);

    return Center(
      child: Padding(padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration.collapsed(hintText: "enter the number to change"),
              keyboardType: TextInputType.number,
              controller: numberController,

            ),
            Container(
              margin: const EdgeInsetsDirectional.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: (){
                      ///4 add events
                      _colbPageBloc.add(ConvertToHexEvent(numberController.text));
                    },
                    child: Text("to hex"),
                  ),
                  SizedBox(width: 10,),
                  RaisedButton(onPressed: (){
                    ///4 add events
                    _colbPageBloc.add(ConvertToBinaryEvent(numberController.text));
                  },
                    child: Text("to binary"),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              alignment: Alignment(0, 0),
              child:
              ///3 build the provided bloc widgets
              ///5 output the state
              BlocBuilder<ColbPageBloc,ColbPageState>(builder: (context,state) => Text(state.value,style: TextStyle(
                  fontSize: 40
              ),)),
            )
          ],
        ),),
    );

  }

}