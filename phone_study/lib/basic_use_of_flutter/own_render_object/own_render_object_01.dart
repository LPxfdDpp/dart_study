import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/*
   视频连接 ： https://www.youtube.com/watch?v=PnWxW21vDak
   已下代码就是视频中live coding 的内容
 */
class OwnRenderObject01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
//      child: Center(child: Text("hello"),),

      child: Center(child: GestureDetector(
          onTap: (){
            print("center");
          },
          child: Text("hello")),),

//      child: MyCenter(child: Text("MyCenter"),),

//      child: MyCenter(child: GestureDetector(
//          onTap: (){
//            print("MyCenter");
//          },
//          child: Text("MyCenter")),
//        ),
    );
  }
}

/// hitTest 没处理
/// 仅供学习用
class MyCenter extends SingleChildRenderObjectWidget {
  final Widget child;
  MyCenter({ Key key, this.child }) : super(key: key,child:child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _MyCenterRenderObject();
  }

}
class _MyCenterRenderObject extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  @override
  void performLayout() {
    if(child != null){
      size = constraints.biggest;

      child.layout(constraints.loosen(),parentUsesSize: true);

      double dx = (size.width-child.size.width)/2;
      double dy = (size.height-child.size.height)/2;

      BoxParentData childParentData = child.parentData;
      childParentData.offset = Offset(dx,dy);
    }else{
      size = Size(0, 0);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if(child != null){
      BoxParentData childParentData = child.parentData;
      context.paintChild(child, offset+childParentData.offset);
    }
  }

}



