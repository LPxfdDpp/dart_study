import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class rubiks_cube_001 extends StatefulWidget {
  @override
  _rubiks_cube_001State createState() => _rubiks_cube_001State();
}

class _rubiks_cube_001State extends State<rubiks_cube_001> {
  @override
  Widget build(BuildContext context) {
    if (_width == null) {
      _width = MediaQuery.of(context).size.width;
      _height = MediaQuery.of(context).size.height;
    }

    return PageView.builder(
      itemCount: 10,
      controller: pageController,
      itemBuilder: (context, index) {
        return _buildPageItem(index);
      },
    );
  }

  PageController pageController;

  double _width;
  double _height;
  @override
  void initState() {
    super.initState();
    pageController = PageController()
      ..addListener(() {
        setState(() {
          _currPageValue = pageController.page;
          _currPageOffset = pageController.offset;
        });
      });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  double _currPageValue = 0;
  double _currPageOffset = 0;
  _buildPageItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      //当前的item

      double _animationvalue = lerpDouble(0.0, pi / 2, _currPageValue - index);
      matrix4 = Matrix4.identity()
        ..setEntry(3, 2, 0.0015)
        ..rotateY(_animationvalue);

      return Transform(
        transform: matrix4,
        origin: Offset(_width / 2, 0),
        alignment: Alignment.center,
        child: _homeCell(context, index),
      );
    } else if (index == _currPageValue.floor() + 1) {
      //右边的item
      double _animationvalue = lerpDouble(0.0, pi / 2, _currPageValue - index);

      matrix4 = Matrix4.identity()
        ..setEntry(3, 2, 0.0012)
        ..rotateY(_animationvalue);

      return Transform(
        transform: matrix4,
        origin: Offset(-_width / 2, 0),
        alignment: Alignment.center,
        child: _homeCell(context, index),
      );
    } else if (index == _currPageValue.floor() - 1) {
      //左边

      double _animationvalue =
      lerpDouble(0.0, pi / 2, _currPageValue - index + 1);

      matrix4 = Matrix4.identity()
        ..setEntry(3, 2, 0.0015)
        ..rotateY(_animationvalue);
    } else {
      //其他，不在屏幕显示的item
      matrix4 = Matrix4.identity();
    }

    return Transform(
      transform: matrix4,
      origin: Offset(_width / 2, 0),
      alignment: Alignment.center,
      child: _homeCell(context, index),
    );
  }

  _homeCell(BuildContext context,int index){

    return Container(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.deepPurple,
              width: 2
          )
      ),
      child: Text(index.toString()),
    );

  }


}
