import 'package:flutter/src/widgets/navigator.dart';


class OwnNavigatorObserver extends NavigatorObserver {

  // 添加导航监听后，跳转的时候需要使用Navigator.push路由
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);

    print("---------");
print(route?.settings);
print(previousRoute?.settings);
    print("---------");
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);

    print("=======");
    print(route);
    print(previousRoute);
    print("=======");
  }

}