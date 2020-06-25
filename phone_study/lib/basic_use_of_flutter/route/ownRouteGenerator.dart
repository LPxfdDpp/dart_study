import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_study/basic_use_of_flutter/basic_use_of_flutter_page_2.dart';
import 'package:phone_study/basic_use_of_flutter/route/page_route_builder.dart';

///以下是各种测试页面
import 'package:phone_study/bloc_page/bloc_page.dart';
import 'package:phone_study/whenToUseKeys/when_to_use_keys_page.dart';
import 'package:phone_study/basic_use_of_flutter/basic_use_of_flutter_page_1.dart';
import 'package:phone_study/basic_use_of_flutter/basic_use_of_flutter_page_2.dart';
import 'package:phone_study/own_popup/own_popup.dart';
import 'package:phone_study/pre/pre.dart';

///全局路由管理
///路由方式 ：  Navigator.of(context).popAndPushNamed(routeName,arguments: ) 等等
class OwnRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        ///bloc学习页
//        return BlocPage(),
        ///when_to_use_keys_page学习页
//         return  WhenToUseKeysPage(),
//         return  Sample(),
        ///工作用
//          return   PrePage(),
        /// basic_use_of_flutter -》 route
        return MaterialPageRoute(builder: (_) => BasicUseOfFlutterPage1());
        /// 自定义弹出层
//        return MaterialPageRoute(builder: (_) => OwnPopUp());

      case '/basic_use_of_flutter_page_2':
        if (args is String) {
          return ScaleFadeRotateRouter(
            settings: settings,
            child: BasicUseOfFlutterPage2(args),
            durationMs: 500,
          );
        }
    }
  }
}
