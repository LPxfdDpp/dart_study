
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';


///注意添加这个(这个方法需要 describeEnum)
import 'package:flutter/foundation.dart' show describeEnum;

///
/// 关于枚举的 describeEnum方法 和 extension的使用
///
class AboutEnumBababab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AboutEnumBabababState();
}

class AboutEnumBabababState extends State<AboutEnumBababab>  {


  bool isPrimaryColor = true;
  @override
  Widget build(BuildContext context) {
    SelectedColor selectedColor = getRandomSelectedColor(isPrimaryColor);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            FlatButton(
              onPressed: () {
                setState(() {
                  isPrimaryColor = !isPrimaryColor;
                });
              },
              child: Text(selectedColor.displayColorChangeText),
            )
          ],
        ),
        body: Column(
          children: [
            Text(() {
              switch (selectedColor) {
                case SelectedColor.PrimaryColor:
                  return 'This is the Primary Color';
                case SelectedColor.SecondaryColor:
                  return 'This is the Secondary Color';
                default:
                  return 'SelectedScheme Title is null';
              }
            }()),
            Text(() {
              switch (selectedColor) {
                case SelectedColor.PrimaryColor:
                  return 'This is the Primary Color';
                case SelectedColor.SecondaryColor:
                  return 'This is the Secondary Color';
                default:
                  return 'SelectedScheme Title is null';
              }
            }()),
            Text(selectedColor.displayTitle),
            Text(selectedColor.name),
            Text(selectedColor.displayTitle),
          ],
        ),
      ),
    );
  }
}


enum SelectedColor {
  PrimaryColor,
  SecondaryColor,
}

extension SelectedColorExtension on SelectedColor {
  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case SelectedColor.PrimaryColor:
        return 'This is the Primary Color';
      case SelectedColor.SecondaryColor:
        return 'This is the Secondary Color';
      default:
        return 'SelectedScheme Title is null';
    }
  }

  String get displayColorChangeText {
    switch (this) {
      case SelectedColor.PrimaryColor:
        return 'Change to Secondary Color';
      case SelectedColor.SecondaryColor:
        return 'Change to Primary Color';
      default:
        return 'SelectedScheme is null';
    }
  }

  Color color() {
    switch (this) {
      case SelectedColor.PrimaryColor:
        return Colors.red;
      case SelectedColor.SecondaryColor:
        return Colors.blue;
      default:
        return Colors.transparent;
    }
  }
}

SelectedColor getRandomSelectedColor(bool isPrimary) {
  switch (isPrimary) {
    case true:
      return SelectedColor.PrimaryColor;
    case false:
      return SelectedColor.SecondaryColor;
    default:
      return null;
  }
}
