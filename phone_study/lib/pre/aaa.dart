import 'package:flutter/material.dart';

class PlaylistDetailPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _PlaylistDetailPageState();
}

class _PlaylistDetailPageState extends State<PlaylistDetailPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: _initialPage,)
      ..addListener(() {
        _animationController.value = pageController.offset;
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // TransformerPageController pageController;
  PageController pageController;
  AnimationController _animationController;

  int _currentAlbum;
  int _initialPage = 0;
  double _width;
  
  @override
  Widget build(BuildContext context) {
    if(_width == null){
      _currentAlbum =_initialPage;
      _width = MediaQuery.of(context).size.width;
      _animationController = AnimationController(value: 0.0,vsync: this,lowerBound: 0.0,upperBound: 9*_width);
    }

    return PageView.builder(
      itemCount: 9,
      controller: pageController,
      onPageChanged: (page){
        _currentAlbum = page;
      },
      itemBuilder: (context, index) {

        return RepaintBoundary(
          child: AnimatedBuilder(
            animation: _animationController,

            builder: (context, child) {
              double thisOne = _width*index;
              double scale = 0.8;
              double opacity = 0.3;
              double currentValue = _animationController.value;
              if(
              currentValue - thisOne >= _width
              ||
                  currentValue+_width <= thisOne
              ){
              }else{
                double wei = currentValue - thisOne;
                if(wei >=0 ){
                  scale  = 1 - (wei/_width)*0.2;
                  opacity = 1 - (wei/_width)*0.7;
                }else if(wei <0 ){
                  wei = -wei;
                  scale  = 0.8 + (1-wei/_width)*0.2;
                  opacity = 0.3 + (1-wei/_width)*0.7;

                  ///其他效果
//                  wei = -wei;
//                  if(wei <= _width/2){
//                    scale  = 0.8 + ((_width/2-wei)/(_width/2))*0.2;
//                    opacity = 0.3 + ((_width/2-wei)/(_width/2))*0.7;
//                  }else if(wei > _width/2){
//                    scale = 0.8;
//                    opacity = 0.3;
//                  }
                }
              }


//            double distance = (_animationController.value - zhongZou);

//            if(distance >= _width/2){
//              scale = 0.8;
//            }else if(distance ){
//
//            }



              return Opacity(
              opacity: opacity,
//                opacity: 1,
                child: Transform.scale(
                scale: scale,
//                  scale: 1,
                  child: child,
                ),
              );
            },
            child: SSD(
              index: index,
            ),
          ),
        );
      },
    );
  }
}

class SSD extends StatefulWidget {
  final int index;

  const SSD({Key key, this.index}) : super(key: key);

  @override
  _SSDState createState() => _SSDState();
}

class _SSDState extends State<SSD> {


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: widget.index%2 == 0?Colors.green:Colors.deepPurpleAccent,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(child: Text(widget.index.toString())),
    );
  }
}

