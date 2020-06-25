import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/*
  邓晖 2020-06-17
  封装了 路由跳转

 */
class NavigatorUtil {

  /// 跳转到新界面，移除之前的push
  static pushAndRemovePage({BuildContext context, Widget routePage}) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => routePage),
      (route) => route == null,
    );
  }

  /// 跳转到新界面，移除之前的push
  static pushAndRemovePage2({BuildContext context, Widget routePage}) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => routePage),
        ModalRoute.withName("myPage")
    );
  }

  /// 跳转到新界面
  static pushNewPage({BuildContext context, Widget routePage}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => routePage));
  }

  static pushNewPageBack({BuildContext context, Widget routePage}) {
    Navigator.of(context)
        .push(CupertinoPageRoute(builder: (context) => routePage));
  }
  /// 销毁当前页面并跳转指向新的页面
  static popAndPushNewPage({BuildContext context, String routeName}) {
    Navigator.popAndPushNamed(context, routeName);
  }

  static pushReplacementName({BuildContext context, String routeName}) {
    Navigator.pushReplacementNamed(context, routeName);
  }



//           bool value = await Navigator.push(context, MaterialPageRoute<bool>(
//             builder: (BuildContext context) {
//               return Center(
//                 child: GestureDetector(
//                   child: Text('OK'),
//                   onTap: () { Navigator.pop(context, true); }
//                 ),
//               );
//             }
//           ));
//
//           print(value);


}
