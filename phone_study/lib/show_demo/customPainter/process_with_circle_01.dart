import 'package:flutter/material.dart';



///
///
///   已经显示的     |---------------------|  尚未显示的
///      o o        |  进度条              | o o o o o o
///                 |---------------------|
///
class ProcessWithCircle01 extends StatefulWidget {
  @override
  _ProcessWithCircle01State createState() => _ProcessWithCircle01State();
}

class _ProcessWithCircle01State extends State<ProcessWithCircle01> with SingleTickerProviderStateMixin {


  AnimationController _animationController;
  int _alreadyShowed = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,lowerBound: 0,upperBound: 1,duration: Duration(seconds: 2));
    _animationController.addListener(() {
      setState(() {
        if(_animationController.isCompleted){
          if(_alreadyShowed < 9){
            _alreadyShowed++;
            _animationController.reset();
            _animationController.forward();
          }
        }
      });
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      resizeToAvoidBottomInset:true,
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.deepOrange,
          child: CustomPaint(
            painter: MyPainer(dianShu:9,alreadyShowed: _alreadyShowed,jingdu: _animationController.value),
          ),
        ),
      ),
    );
  }
}
class MyPainer extends CustomPainter {

  //总点的个数
  final dianShu;
  //已经显示的点
  final int alreadyShowed;
  //当前进度 百分比
  final jingdu;

  MyPainer({this.dianShu,this.alreadyShowed,this.jingdu});

  @override
  void paint(Canvas canvas, Size size) {
    print(size.height);

    //点的总宽度
    var dianWidth = size.width/8;
    //每个点的宽度 也即是他们的高度 也即是控件的高度
    var eachWH = dianWidth/(dianShu);
    //进度bar的总宽度
    var totalProgress;
    if(alreadyShowed != null) {
      totalProgress = size.width - eachWH*(dianShu+dianShu+2);//需要给空间
    }else{
      totalProgress = size.width - eachWH*(dianShu+dianShu+1);
    }
    //进度的宽度
    var jingDuProcess = totalProgress*jingdu;

    //圆圈的笔
    var pain = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = Colors.white
      ..strokeWidth = 1.0;
    //全部进度条
    var totalProgressPain = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = Colors.grey[200]
      ..strokeWidth = 1.0;
    //当前进度条
    var jingDuProcessPain = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = Colors.lightGreen
      ..strokeWidth = 1.0;

    //循环画左边的圈
    var temp = 0;
    while(temp<alreadyShowed){
      canvas.drawOval(Rect.fromCircle(center:Offset((2*temp+1)*eachWH+eachWH/2, eachWH/2),radius: eachWH/2), pain);
      temp++;
    }
    //画进度条背景
    canvas.drawRect(Rect.fromLTWH((alreadyShowed+alreadyShowed+1)*eachWH, 0, totalProgress, eachWH), totalProgressPain);
    //画进度条进度
    canvas.drawRect(Rect.fromLTWH((alreadyShowed+alreadyShowed+1)*eachWH, 0, jingDuProcess, eachWH), jingDuProcessPain);
    //循环画右边的圈
    temp = 0;
    while(temp<dianShu-alreadyShowed){
      canvas.drawOval(Rect.fromCircle(center:Offset(((alreadyShowed+alreadyShowed+1)*eachWH)+totalProgress+((2*temp+1)*eachWH+eachWH/2), eachWH/2),radius: eachWH/2), pain);
      temp++;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}