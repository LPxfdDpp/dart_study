import 'package:flutter/material.dart';
import 'basic_use_of_flutter/route/ownNavigatorObserver.dart';
import 'basic_use_of_flutter/route/ownRouteGenerator.dart';

void main() => runApp(new Phone_study());

class Phone_study extends StatelessWidget {


  // 全局的路由监听者，可在需要的widget中添加，应该放到一个全局定义的文件中
  //需要监听的Widget中 需要 extends State<xxx> with RouteAware {
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  @override
  Widget build(BuildContext context) {



    return







      MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/',
      onGenerateRoute: OwnRouteGenerator.generateRoute,
      navigatorObservers: [
        OwnNavigatorObserver(),
        routeObserver
      ],
    );




  }






}
