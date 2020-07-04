import 'package:flutter/material.dart';
import 'dart:async';

class PopupMenu01 extends StatefulWidget {
  @override
  _PopupMenu01State createState() => _PopupMenu01State();
}

class _PopupMenu01State extends State<PopupMenu01> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("画正五边形"), leading: Icon(Icons.arrow_back_ios),actions: <Widget>[


          GestureDetector(
              onTapDown: (de){
                _showMoreOptions(de.globalPosition);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text("点击下拉框")),
              ))

        ],),
        body: Center(
          child: Container(


          ),
        ),
      ),
    );
  }

  ///弹窗
  _showMoreOptions(Offset offset){
    //假想数据项
    List<String> items = [
      "编辑资料","试听安排","报名缴费","咨询登记","转介绍","转班调课","补课","停课","退费","添加档案",
      "编辑资料","试听安排","报名缴费","咨询登记","转介绍","转班调课","补课","停课","退费","添加档案"
    ];

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    //默认弹窗宽度
    var popWidth = 150.0;
    //默认弹窗上下padding
    var popPaddingTopBottom = 15.0;
    //弹窗距离右边宽度
    var popToRight = 15.0;
    //默认小三角高度 (解释:正方形容器内)
    var triangleWidth = 30.0;
    //默认小三角离对话框右边界的距离
    var triangleToRight = 10.0;
    //默认每个选项的高度
    var chooseOptionHeight = 55.0;

    //是否显示滑条 数据量小的话不会显示滑条
    var scrollBar = false;
    //滑条高度
    var scrollBarHeight = 25.0;
    ScrollController scrollController;
    //默认与上面是有点距离的
    var scrollBarDefaultPosition = 25.0;
    var scrollBarPositionController;
    //显示所有项目需要的高度
    var showOptionsHeight = items.length*(chooseOptionHeight+2);
    if((showOptionsHeight+popPaddingTopBottom*2) > screenHeight/2){
      scrollBarPositionController = StreamController<double>();
      scrollController = ScrollController()..addListener(() {
        //能滑动的距离范围
        var canScrollScope = (screenHeight/2-popPaddingTopBottom*2-scrollBarDefaultPosition);
        //已滑动的百分比
        var alreadyScrolledPercentage =(scrollController.offset/(showOptionsHeight-(screenHeight/2-popPaddingTopBottom*2)));
        //更新距离
        scrollBarPositionController.add(canScrollScope*alreadyScrolledPercentage+popPaddingTopBottom);
      });
      scrollBar = true;
    }
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
        builder: (context) => GestureDetector(
          onTap: (){
            if(null != scrollBarPositionController){
              scrollBarPositionController.close();
            }
            overlayEntry.remove();
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color.fromRGBO(0, 0, 0, 0.35),
            child: Stack(
              children: <Widget>[
                //所有选项
                Positioned(
                  left: screenWidth-popWidth-popToRight,
                  top: offset.dy+triangleWidth,
                  child: Container(
                      child: Container(
                        constraints: BoxConstraints(
                            minWidth: popWidth,
                            maxWidth: popWidth,
                            minHeight: 0,
                            maxHeight: screenHeight/2
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        padding: EdgeInsets.fromLTRB(0, popPaddingTopBottom, 0, popPaddingTopBottom),
                        child: ListView.separated(
                            controller:scrollController,
                            physics:ClampingScrollPhysics(),
                            padding:EdgeInsets.fromLTRB(15, 0, 15, 0),
                            shrinkWrap: true,
                            itemBuilder: (context,index) => Container(
                              height: chooseOptionHeight,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.map),
                                  SizedBox(width: 5,),
                                  Text(items[index],style: TextStyle(
                                      color: Color.fromRGBO(51, 51, 51, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      decoration:TextDecoration.none
                                  ),),
                                ],
                              ),
                            ),
                            separatorBuilder: (context,index) => Container(
                              child: Divider(
                                height: 2,
                              ),
                            ),
                            itemCount: items.length),
                      )
                  ),
                ),
                //小三角
                Positioned(
                    left: (screenWidth-popToRight)-triangleWidth-triangleToRight,
                    top: offset.dy,
                    child: ClipPath(
                      clipper: MyClipTriangle(),
                      child: Container(
                        width: triangleWidth,
                        height: triangleWidth,
                        color: Colors.white,
                      ),
                    )),
                //滑条
                scrollBar?Positioned(
                  top: offset.dy+triangleWidth,
                  right: 1+popToRight,
                  child: StreamBuilder<double>(
                      initialData:scrollBarDefaultPosition,
                      stream: scrollBarPositionController.stream,
                      builder: (context, snapshot) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(0, snapshot.data, 2, 0),
                          width: 2,
                          height: scrollBarHeight,
                          color: Colors.grey,
                        );
                      }
                  ),
                ):Container()
              ],
            ),
          ),
        )
    );
    overlayState.insert(overlayEntry);
  }
}


class MyClipTriangle extends CustomClipper<Path> {

  @override
  getClip(Size size) {
    var path = Path()
      ..moveTo(size.width/2, size.height*3/4)
      ..lineTo(size.width*3/4, size.height)
      ..lineTo(size.width/4, size.height)
      ..close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}