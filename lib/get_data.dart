import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_visible/env.dart';

Future<String> getData() async {
  if (!AppEnv.isProd) {
    return '''


{"type":"FRAME","id":"121:9","parent":{"id":"105:50"},"name":"Frame 3","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","relativeTransform":[[1,0,5],[0,1,132]],"absoluteTransform":[[1,0,1078],[0,1,404]],"x":5,"y":132,"width":271,"height":48,"rotation":0,"layoutAlign":"INHERIT","constrainProportions":false,"layoutGrow":0,"children":[{"type":"TEXT","id":"105:23","parent":{"id":"121:9"},"name":"Apply","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.95686274766922,"g":0.9529411792755127,"b":0.9411764740943909}}],"fillStyleId":"S:523a244e30fac4b9f66e4093e4cd7fcad3e9a477,770:14","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"OUTSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,10],[0,1,13]],"absoluteTransform":[[1,0,1088],[0,1,417]],"x":10,"y":13,"width":251,"height":22,"rotation":0,"layoutAlign":"INHERIT","constrainProportions":false,"layoutGrow":1,"exportSettings":[],"constraints":{"horizontal":"CENTER","vertical":"CENTER"},"textStyleId":"","characters":"Apply","hasMissingFont":false,"autoRename":true,"fontSize":16,"paragraphIndent":0,"paragraphSpacing":0,"textAlignHorizontal":"CENTER","textAlignVertical":"CENTER","textCase":"ORIGINAL","textDecoration":"NONE","textAutoResize":"HEIGHT","letterSpacing":{"unit":"PIXELS","value":0},"lineHeight":{"unit":"PERCENT","value":139.9999976158142},"fontName":{"family":"Roboto","style":"Bold"},"reactions":[]}],"exportSettings":[],"fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.33725491166114807,"g":0.5372549295425415,"b":0.7529411911964417}}],"fillStyleId":"S:237336b54608a6cbff3e533a3e48da4a5eb9098c,1604:1","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"INSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"cornerRadius":8,"cornerSmoothing":0,"topLeftRadius":8,"topRightRadius":8,"bottomLeftRadius":8,"bottomRightRadius":8,"paddingLeft":10,"paddingRight":10,"paddingTop":13,"paddingBottom":13,"primaryAxisAlignItems":"CENTER","counterAxisAlignItems":"CENTER","primaryAxisSizingMode":"FIXED","layoutGrids":[],"gridStyleId":"","backgrounds":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.33725491166114807,"g":0.5372549295425415,"b":0.7529411911964417}}],"backgroundStyleId":"S:237336b54608a6cbff3e533a3e48da4a5eb9098c,1604:1","clipsContent":false,"guides":[],"expanded":true,"constraints":{"horizontal":"CENTER","vertical":"CENTER"},"layoutMode":"HORIZONTAL","counterAxisSizingMode":"AUTO","horizontalPadding":10,"verticalPadding":13,"itemSpacing":10,"overflowDirection":"NONE","numberOfFixedChildren":0,"overlayPositionType":"CENTER","overlayBackground":{"type":"NONE"},"overlayBackgroundInteraction":"NONE","reactions":[]}



''';
  }

  var res = js.context.callMethod('getData');
  while (res.isEmpty) {
    print('read data...');
    try {
      res = js.context.callMethod('getData');
    } catch (e) {
      print('error read');
    }
    await Future.delayed(Duration(seconds: 1));
  }
  print({res});
  return res as String;
}

Widget getWidgetByMap(Map<String, dynamic> json) {
  print('getWidgetByMap: ' + json['type']);
  switch (json['type']) {
    case 'COMPONENT':
      return Container(
        width: json['width'],
        height: json['height'],
        padding: getPadding(json),
        decoration: BoxDecoration(
          // color: getColorFromFills(json),
          color: Colors.white,
          border: getBorder(json),
        ),
        child: getChildrenByLayoutMode(json),
      );
    case 'RECTANGLE':
      return Container(
        width: json['width'],
        height: json['height'],
        decoration: BoxDecoration(
          color: getColorFromFills(json),
          border: getBorder(json),
        ),
        child: getChildrenByLayoutMode(json),
      );
    case 'TEXT':
      return getText(json);
    case 'FRAME':
      return Container(
        decoration: BoxDecoration(
          color: getColorFromFills(json),
          border: getBorder(json),
        ),
        padding: getPadding(json),
        child: getChildrenByLayoutMode(json),
      );
    case 'GROUP':
      var items = (getChildrenByLayoutMode(json));
      print('getChildrenByLayoutMode(json)');
      print(items);

      return Container(
        decoration: BoxDecoration(
          color: getColorFromFills(json),
          border: getBorder(json),
        ),
        padding: getPadding(json),
        child: items,
      );
    default:
      return SizedBox();
  }
}

EdgeInsets getPadding(Map<String, dynamic> json) {
  print('getPadding');
  return EdgeInsets.only(
    top: json['paddingTop'] ?? 0,
    left: json['paddingLeft'] ?? 0,
    right: json['paddingRight'] ?? 0,
    bottom: json['paddingBottom'] ?? 0,
  );
}

Border getBorder(Map<String, dynamic> json) {
  print('getBorder');
  final stroke = ((json['strokes'] ?? []) as List)
      .firstWhere((element) => element['type'] == 'SOLID', orElse: () => null);

  if (stroke != null) {
    return Border.all(
      color: getColor(stroke['color']),
      width: json['strokeWeight'] ?? 0,
    );
  }

  return Border.all(width: 0, color: Colors.transparent);
}

Widget getText(Map<String, dynamic> json) {
  print('getText');
  TextAlign textAlign = TextAlign.left;
  switch (json['textAlignHorizontal']) {
    case 'LEFT':
      textAlign = TextAlign.left;
      break;
    case 'RIGHT':
      textAlign = TextAlign.right;
      break;
    case 'CENTER':
      textAlign = TextAlign.center;
      break;
  }

  TextStyle textStyle = TextStyle();
  if (json['fontSize'] != null)
    textStyle = textStyle.copyWith(fontSize: json['fontSize']);
  if (json['fills'] != null)
    textStyle = textStyle.copyWith(color: getColorFromFills(json));

  Widget res = Text(json['characters'], textAlign: textAlign, style: textStyle);
  if (json['layoutAlign'] == 'STRETCH') res = Expanded(child: res);

  //TODO vertical align

  return res;
}

Color getColorFromFills(Map<String, dynamic> json) {
  if (json == null) return Colors.transparent;

  print('getColorFromFills');
  final color1 = [...(json['strokes'] ?? []), ...(json['fills'] ?? [])]
      .firstWhere((element) => element['type'] == 'SOLID', orElse: () => null);

  if (color1 != null) {
    return getColor(color1['color'] ?? color1);
  }

  return Colors.transparent;
}

Color getColor(Map<String, dynamic> color, {num opacity = 1}) {
  print('getColor');

  if (color == null) return Colors.transparent;

  return Color.fromRGBO(
    (color['r'] * 255).round(),
    (color['g'] * 255).round(),
    (color['b'] * 255).round(),
    opacity,
  );
}

Widget getChildrenByLayoutMode(Map<String, dynamic> json) {
  print('getChildrenByLayoutMode');
  if (json == null || json['children'] == null) return SizedBox();
  if (json['layoutMode'] == 'VERTICAL') {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:
          (json['children'] as List).map((e) => getWidgetByMap(e)).toList(),
    );
  } else if (json['layoutMode'] == 'HORIZONTAL') {
    return Row(
      crossAxisAlignment: getCrossAxisAlignment(json),
      mainAxisAlignment: getMainAxisAlignment(json),
      children: (json['children'] as List).map((e) {
        return getWidgetByMap(e);
      }).toList(),
    );
  } else {
    final baseX = (json['type'] == 'GROUP') ? json['x'] : 0;
    final baseY = (json['type'] == 'GROUP') ? json['y'] : 0;

    final children = (json['children'] as List).map((e) {
      return Positioned(
        child: getWidgetByMap(e),
        left: e['x'] - baseX,
        top: e['y'] - baseY,
        width: e['width'],
        height: e['height'],
      );
    }).toList();

    print({children});

    return Stack(children: children);
  }
}

getCrossAxisAlignment(Map<String, dynamic> json) {
  print('getCrossAxisAlignment');
  if (json['constraints'] != null) {
    switch(json['constraints']['vertical']) {
      case 'CENTER':
        return CrossAxisAlignment.center;
      default:
        return CrossAxisAlignment.start;
    }
  }
}
getMainAxisAlignment(Map<String, dynamic> json) {
  print('getCrossAxisAlignment');
  if (json['constraints'] != null) {
    switch(json['constraints']['horizontal']) {
      case 'CENTER':
        return MainAxisAlignment.center;
      default:
        return MainAxisAlignment.start;
    }
  }
}
