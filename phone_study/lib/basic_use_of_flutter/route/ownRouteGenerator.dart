import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_study/about_dio/about_dio_page.dart';
import 'package:phone_study/basic_use_of_flutter/about_inherited_widget/inherited_widget_check_01.dart';
import 'package:phone_study/basic_use_of_flutter/about_matrix/about_matrix_01.dart';
import 'package:phone_study/basic_use_of_flutter/about_provider/about_provider_01.dart';
import 'package:phone_study/basic_use_of_flutter/about_provider/provider_logic_01.dart';
import 'package:phone_study/basic_use_of_flutter/about_theme/theme_01.dart';
import 'package:phone_study/basic_use_of_flutter/ani_sample/rubiks_cube_001.dart';
import 'package:phone_study/basic_use_of_flutter/ani_sample/stack_001.dart';
import 'package:phone_study/basic_use_of_flutter/basic_use_of_flutter_page_2.dart';
import 'package:phone_study/basic_use_of_flutter/basic_use_of_flutter_page_1.dart';
import 'package:phone_study/basic_use_of_flutter/flutter_hero_widget/hero_play_01.dart';
import 'package:phone_study/basic_use_of_flutter/own_ImplicitlyAnimatedWidget/Implicitly_ani_style_01.dart';
import 'package:phone_study/basic_use_of_flutter/own_render_object/own_render_object_01.dart';
import 'package:phone_study/basic_use_of_flutter/own_tween/own_tween_01.dart';
import 'package:phone_study/basic_use_of_flutter/route/page_route_builder.dart';
import 'package:phone_study/own_popup/own_popup.dart';
import 'package:phone_study/pre/explore.dart';
import 'package:phone_study/pre/pre.dart';
import 'package:phone_study/seek/context_owner_build_scope_01.dart';
import 'package:phone_study/show_demo/alphabet_scroll/alphabet_scroll_01.dart';
import 'package:phone_study/show_demo/book_page_turning/style_01.dart';
import 'package:phone_study/show_demo/calender/calender_01.dart';
import 'package:phone_study/show_demo/customPainter/customerPainter_01.dart';
import 'package:phone_study/show_demo/customPainter/process_with_circle_01.dart';
import 'package:phone_study/show_demo/customPainter/regular_pentagon_01.dart';
import 'package:phone_study/show_demo/popup_menu/popupMenu_01.dart';
import 'package:phone_study/show_demo/simple_quadratic_bezier/simple_quadratic_bezier_01.dart';
import 'package:phone_study/show_demo/simple_quadratic_bezier/simple_quadratic_bezier_with_animation_01.dart';
import 'package:phone_study/show_demo/time_asix/time_axis_01.dart';
import 'package:provider/provider.dart';

///全局路由管理
///路由方式 ：  Navigator.of(context).popAndPushNamed(routeName,arguments: ) 等等
class OwnRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    Widget show;


    switch (settings.name) {
      case '/':
        ///bloc学习页
//        show =  BlocPage();
        ///when_to_use_keys_page学习页
//         show =  WhenToUseKeysPage();
//         show =  Sample();
        ///测试用
         show =   PrePage();

        /// Explore
        //   show =   Explore();

        ///customPainer
//          show = CustomerPainter01();
//          show = RegularPentagon01();
//          show = ProcessWithCircle01();
        ///日历
//            show = Calender01();
        ///贝塞尔曲线
//          show =   SimpleQuadraticBezier01();
//          show =   SimpleQuadraticBezierWithAnimation01();
        /// basic_use_of_flutter -》 route
//        show = BasicUseOfFlutterPage1() ;
        /// provider
//           show = AboutProvider01();
//           show = Provider(
//               create: (context)=>ProviderLogic01(),
//               child: AboutProvider01());
        /// hero 控件
        //  show = HeroPlay01();
        /// InheritedWidget
//            show = InheritedWidgetCheck01();
        ///theme
//          show = Theme01();
        /// 自定义弹出层
//        show = OwnPopUp();
//          show = PopupMenu01();
        /// 自定义时间轴
//          show = TimeAxis01();
        /// 翻页
//          show  = Style01();
        /// 自定义 ImplicitlyAnimatedWidget
//            show = ImplicitlyAniStyle01();
        /// 自定义 Tween
//            show = OwnTween01();
        /// 自定义 RenderObject
//              show = OwnRenderObject01();
        /// 右侧是浮动的a-z的字母条滑动 内容则是有a-z字母头的listview  (类似联系人列表)
//              show = AlphabetScroll01();
        /// 探索
//              show = ContextOwnerBuildScope01();
        /// 有关dio
//                show = AboutDioPage();
        break;
      case '/basic_use_of_flutter_page_2':

        return MaterialPageRoute(builder: (_) => BasicUseOfFlutterPage2(null),settings: settings);

//        if (args is List) {
//          return ScaleFadeRotateRouter(
//            settings: settings,
//            child: BasicUseOfFlutterPage2(args),
//            durationMs: 500,
//          );
//        }
    }
   return MaterialPageRoute(builder: (_) => show);

  }
}
