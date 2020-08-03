import 'package:flutter/material.dart';

class AboutBoxConstraine01 extends StatefulWidget {
  @override
  _AboutBoxConstraine01State createState() => _AboutBoxConstraine01State();
}

class _AboutBoxConstraine01State extends State<AboutBoxConstraine01> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

///限制传递规则
///首先，上层 widget 向下层 widget 传递约束条件。
///然后，下层 widget 向上层 widget 传递大小信息。
///最后，上层 widget 决定下层 widget 的位置。
///
/// 屏幕会强制紧接着的控件占满整个屏幕 即 minWidth = maxWidth = 屏幕宽度 高度类似
///
/// -A控件若允许子控件的大小小于A的大小的话，就说A对其子控件使用了 宽松约束 loose .
/// -若强制子控件和自身一样大的话，就说A对其子控件使用了 严格约束 tight (比如 SizedBox.expand).
///
/// Expanded 会强制子控件使用固定的宽度或高度 子控件自己设置的已经不起作用 相当于子控件的父控件宽或高已写死
/// Flexible 着相当于给子控件宽或高设置了个最大值的限制
///
/// ConstrainedBox 在父控件传来的限制范围内应用自己的限制 若父控件大小写死了 则自己的限制会被忽略
///
/// LimitedBox 只会在父控件是unconstrained时才会生效
///
///
/// UnconstrainedBox 不会限制孩子控件的大小 但孩子控件超出屏幕允许会报错
///
/// OverflowBox 不会限制孩子控件的大小 且孩子控件超出屏幕不会报错
///
/// FittedBox 通过比例来调整子控件的显示 若子控件无限大小则报错  其他信息写起来太麻烦 你懂的...
///
/// Center Align 告诉子控件可以任意大小 但要在他们所受的限制范围内
/// Row 同 UnconstrainedBox一样
///
///