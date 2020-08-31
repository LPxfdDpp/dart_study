import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class Explore extends StatefulWidget {
  Explore({Key key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset.toInt() >= HEAD_LINE_HEIGHT &&
          !_titleShowInfo.value) {
        _titleShowInfo.value = true;
      } else if (_scrollController.offset.toInt() < HEAD_LINE_HEIGHT &&
          _titleShowInfo.value) {
        _titleShowInfo.value = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  double _width;
  double _height;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    if (_width == null) {
      _width = MediaQuery.of(context).size.width;
      _height = MediaQuery.of(context).size.height;
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: widgetAppBar(),
      body: Container(
        child: Stack(
          children: <Widget>[
            ListView(
              controller: _scrollController,
              children: <Widget>[
                widgetHeadLine(),
                widgetContentText(),
                widgetContentImage(),
                widgetReact(),
                ...widgetAboutComments(),
                Container(
                  width: 10,
                  height: 700,
                  color: Colors.deepOrange,
                  child: Text("测试滑动用"),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: widgetBottomReplay(),
            )
          ],
        ),
      ),
    );
  }


  Widget widgetCommentsPiece(List<String> fake){
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: _width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue
            ),
          ),
          const SizedBox(width: 5,),
          Expanded(
            child: ChangeNotifierProvider<ValueNotifier<int>>.value(
              value: _mainCommentsOnClickNotifiers["1"],
              child: Consumer<ValueNotifier<int>>(
                builder: (ctx,_,__){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(fake[0],style: const TextStyle(color: Colors.white),),
                                Text(fake[1],style: const TextStyle(color: Colors.white,),),
                                Text(fake[2],style: const TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepOrange
                            ),
                          ),
                        ],
                      ),
                      ..._mainCommentNoSmallPieces["1"],
                      GestureDetector(
                        child: Text(fake[3],style: const TextStyle(color: Colors.white),),
                        onTap: (){
                          _mainCommentNoSmallPieces["1"].add(widgetCommentsSmallPiece());
                          _mainCommentsOnClickNotifiers["1"].value += 1;
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  final Map<String,List<Widget>>_mainCommentNoSmallPieces = {"1":[]};
  Widget widgetCommentsSmallPiece(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue
          ),
        ),
        const SizedBox(width: 5,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("海底2万里",style: const TextStyle(color: Colors.white),),
              Text("拉萨大家发爱丽丝的房间慷慨大方的的疯狂酒店开房间东方酒店开房间欧萨啊拉萨大家发爱丽丝的付款就",style: const TextStyle(color: Colors.white,),),
              Text("12分钟前",style: const TextStyle(color: Colors.white),),
            ],
          ),
        ),
        const SizedBox(width: 5,),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue
          ),
        ),
      ],
    );
  }


  List<String> fakeTexts = ["用户名字","回复阿斯蒂芬就 爱丽丝大家 啊爱丽丝大家阿萨的客户爱多久发货啊速度飞快阿斯蒂芬","12分钟前","展开回复v"];

  final Map<String,ValueNotifier<int>> _mainCommentsOnClickNotifiers = {"1":ValueNotifier<int>(0)};
  final List<Widget> _mainComments = [];
  List<Widget> widgetAboutComments(){
    List.generate(1, (index) => _mainComments.add(widgetCommentsPiece(fakeTexts)));

    return [
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        width: _width,
        height: 25,
        color: Colors.blueGrey,
        child: Text("评论 (254)",style: const TextStyle(color: Colors.white),),
      ),
      ..._mainComments];
  }


  Widget widgetReact(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,18,20,0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(Icons.access_time,color: Colors.white,),
          const SizedBox(width: 5,),
          Text("5.7k",style: const TextStyle(color: Colors.white),),
          const SizedBox(width: 15,),
          Icon(Icons.access_time,color: Colors.white,),
          const SizedBox(width: 5,),
          Text("分享",style: const TextStyle(color: Colors.white),),
        ],
      ),
    );
  }

  Widget widgetContentText(){
      return Padding(
        padding:const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Text(
        """
        对已有Parquet表进行迁移：支持通过Spark Datasource/DeltaStreamer引导已存在的Parquet表迁移至Hudi，同时可通过Hive，SparkSQL，AWS Athena进行查询（PrestoDB即将支持），技术细节请参考RFC-15。该特性暂时标记为experimental，在后续的0.6.x版本将持续进行完善。与传统重写方案相比资源消耗和耗时都有数据量的提升。
bulk_insert支持原生写入：避免在bulk_insert写入路径中进行DataFrame - RDD转化，可显著提升bulk load的性能。后续的0.6.x版本将应用到其他的写操作以使得schema管理更为轻松，彻底避免spark-avro的转化
        """
          ,style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget widgetContentImage(){
    return SizedBox(
      width: _width,
      height: _width,
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
        },
        itemCount: 3,
        pagination: SwiperPagination(
            builder:OwnDotSwiperPaginationBuilder(
              activeColor: Colors.white,
              color: Colors.grey
            )
        ),
//        control: SwiperControl(),
      ),
    );
  }


  static const double HEAD_LINE_HEIGHT = 40;
  Widget widgetHeadLine() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        width: _width,
        height: HEAD_LINE_HEIGHT+11,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  color: Colors.deepPurple,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "月落乌啼霜满天",
                  style: const TextStyle(color: Colors.white),
                ),
                Spacer(),
                Container(
                  height: 30,
                  padding: const EdgeInsets.fromLTRB(19, 0, 19, 0),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      border: Border.fromBorderSide(
                          BorderSide(color: Colors.white, width: 1))),
                  child: Text(
                    "关注",
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            Spacer(),
            Container(
              width: _width,
              height: 1,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  Widget widgetBottomReplay() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      color: Colors.deepPurple,
      height: 56,
      width: _width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 17, right: 17),
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(56)),
                  color: Colors.blueGrey),
              child: Text(
                "随便说点什么吧",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                border: const Border.fromBorderSide(
                    BorderSide(color: Colors.white, width: 1))),
            height: 40,
            width: 40,
            child: Icon(
              Icons.send,
              color: Colors.lightBlueAccent,
            ),
          ),
        ],
      ),
    );
  }

  final ValueNotifier<bool> _titleShowInfo = ValueNotifier<bool>(false);
  AppBar widgetAppBar() {
    Widget title() {
      return ChangeNotifierProvider<ValueNotifier<bool>>.value(
        value: _titleShowInfo,
        child: Consumer<ValueNotifier<bool>>(builder: (ctx, _, __) {
          if (_titleShowInfo.value) {
            return Center(
                child: Text(
              "留言板 info",
              style: const TextStyle(color: Colors.white),
            ));
          } else {
            return Center(
                child: Text(
              "留言板",
              style: const TextStyle(color: Colors.white),
            ));
          }
        }),
      );
    }

    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: title(),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.more_horiz,
            color: Colors.white,
          ),
          onPressed: () {
            _titleShowInfo.value = true;
          },
        )
      ],
    );
  }
}


///复制了 flutter_swiper 的默认圆圈指示
///改了下使当前圆圈变成条状
class OwnDotSwiperPaginationBuilder extends SwiperPlugin {
  ///color when current index,if set null , will be Theme.of(context).primaryColor
  final Color activeColor;

  ///,if set null , will be Theme.of(context).scaffoldBackgroundColor
  final Color color;

  ///Size of the dot when activate
  final double activeSize;

  ///Size of the dot
  final double size;

  /// Space between dots
  final double space;

  final Key key;

  const OwnDotSwiperPaginationBuilder(
      {this.activeColor,
        this.color,
        this.key,
        this.size: 10.0,
        this.activeSize: 10.0,
        this.space: 3.0});

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    if (config.itemCount > 20) {
      print(
          "The itemCount is too big, we suggest use FractionPaginationBuilder instead of DotSwiperPaginationBuilder in this sitituation");
    }
    Color activeColor = this.activeColor;
    Color color = this.color;

    if (activeColor == null || color == null) {
      ThemeData themeData = Theme.of(context);
      activeColor = this.activeColor ?? themeData.primaryColor;
      color = this.color ?? themeData.scaffoldBackgroundColor;
    }

    if (config.indicatorLayout != PageIndicatorLayout.NONE &&
        config.layout == SwiperLayout.DEFAULT) {
      return new PageIndicator(
        count: config.itemCount,
        controller: config.pageController,
        layout: config.indicatorLayout,
        size: size,
        activeColor: activeColor,
        color: color,
        space: space,
      );
    }

    List<Widget> list = [];

    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;

    for (int i = 0; i < itemCount; ++i) {
      bool active = i == activeIndex;
      list.add(active?Container(
        key: Key("pagination_$i"),
        margin: EdgeInsets.all(space),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(32)),
            color: active ? activeColor : color,
          ),
          width: active ? 2*size : size,
          height: active ? size : size,
        ),
      ):Container(
        key: Key("pagination_$i"),
        margin: EdgeInsets.all(space),
        child: ClipOval(
          child: Container(
            color: active ? activeColor : color,
            width: active ? activeSize : size,
            height: active ? activeSize : size,
          ),
        ),
      ));
    }

    if (config.scrollDirection == Axis.vertical) {
      return new Column(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    } else {
      return new Row(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    }
  }
}
