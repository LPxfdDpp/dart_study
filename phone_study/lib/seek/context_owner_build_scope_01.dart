import 'package:flutter/material.dart';

///不和规范 比如 Widget应该是final的
///
///可以在子控件操作父控件的built方法
///也可在父控件操作某个子控件的built方法
class ContextOwnerBuildScope01 extends StatefulWidget {
  @override
  _ContextOwnerBuildScope01State createState() => _ContextOwnerBuildScope01State();
}

class _ContextOwnerBuildScope01State extends State<ContextOwnerBuildScope01> {
  @override
  Widget build(BuildContext context) {
    print("build");
    /// todo 为什么这个hashcode都是相同的?
    print(context.owner.hashCode);
    print(context.hashCode);

    return Scaffold(
      body: SSS(),
    );
  }
}

StatelessElement kkk;

class SSS extends StatelessWidget {

  @override
  StatelessElement createElement(){
    return kkk = StatelessElement(this);
  }

  @override
  Widget build(BuildContext context) {
    print("SSS build");
    print(context.owner.hashCode);
    print(context.hashCode);

    return Container(
      child: SSSs(),
    );
  }
}


class SSSs extends StatelessWidget {

  @override
  StatelessElement createElement()=>StatelessElement(this);

  @override
  Widget build(BuildContext context) {
    print("SSSSSsSSSsSSSsSSSsS build");
    print(context.owner.hashCode);
    print(context.hashCode);

    Future.delayed(Duration(seconds: 5),(){
      print("here");
      ///此处手动调用父控件的built方法
      context.owner.buildScope(kkk,(){
        kkk.markNeedsBuild();
      });
    });

    return Container();
  }
}
