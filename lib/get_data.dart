import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_visible/env.dart';
import 'ext.dart';

Future<String> getData() async {
  if (!AppEnv.isProd) {
    return '''


{"type":"COMPONENT","id":"9:4","parent":{"id":"0:1"},"name":"Frame 1","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","relativeTransform":[[1,0,413],[0,1,179]],"absoluteTransform":[[1,0,413],[0,1,179]],"x":413,"y":179,"width":181,"height":248,"rotation":0,"constrainProportions":false,"layoutGrow":0,"children":[{"type":"RECTANGLE","id":"9:5","parent":{"id":"9:4"},"name":"Rectangle 1","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.7686274647712708,"g":0.7686274647712708,"b":0.7686274647712708}}],"fillStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"INSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,10],[0,1,10]],"absoluteTransform":[[1,0,423],[0,1,189]],"x":10,"y":10,"width":161,"height":138,"rotation":0,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"MIN","vertical":"MIN"},"cornerRadius":0,"cornerSmoothing":0,"topLeftRadius":0,"topRightRadius":0,"bottomLeftRadius":0,"bottomRightRadius":0,"reactions":[]},{"type":"TEXT","id":"9:6","parent":{"id":"9:4"},"name":"Utils main.dart imports.dart MainPage.dart","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0,"g":0,"b":0}}],"fillStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"OUTSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,10],[0,1,158]],"absoluteTransform":[[1,0,423],[0,1,337]],"x":10,"y":158,"width":79,"height":80,"rotation":0,"layoutAlign":"INHERIT","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"SCALE","vertical":"SCALE"},"textStyleId":"","characters":"Utils\\nmain.dart\\nimports.dart\\nMainPage.dart","hasMissingFont":false,"autoRename":true,"fontSize":12,"paragraphIndent":0,"paragraphSpacing":0,"textAlignHorizontal":"LEFT","textAlignVertical":"TOP","textCase":"ORIGINAL","textDecoration":"NONE","textAutoResize":"WIDTH_AND_HEIGHT","letterSpacing":{"unit":"PERCENT","value":0},"lineHeight":{"unit":"PERCENT","value":169.68750953674316},"reactions":[]}],"exportSettings":[],"fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":1,"g":1,"b":1}}],"fillStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"INSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"cornerRadius":0,"cornerSmoothing":0,"topLeftRadius":0,"topRightRadius":0,"bottomLeftRadius":0,"bottomRightRadius":0,"paddingLeft":10,"paddingRight":10,"paddingTop":10,"paddingBottom":10,"primaryAxisAlignItems":"MIN","counterAxisAlignItems":"MIN","primaryAxisSizingMode":"FIXED","layoutGrids":[],"gridStyleId":"","backgrounds":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":1,"g":1,"b":1}}],"backgroundStyleId":"","clipsContent":false,"guides":[],"expanded":false,"constraints":{"horizontal":"MIN","vertical":"MIN"},"layoutMode":"VERTICAL","counterAxisSizingMode":"FIXED","horizontalPadding":10,"verticalPadding":10,"itemSpacing":10,"overflowDirection":"NONE","numberOfFixedChildren":0,"overlayPositionType":"CENTER","overlayBackground":{"type":"NONE"},"overlayBackgroundInteraction":"NONE","description":"","documentationLinks":[],"remote":false,"key":"706f32939774bb542bddf4f789e349e32aefa74f","reactions":[]}



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
          borderRadius: getBorderRadius(json),
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
          borderRadius: getBorderRadius(json),
        ),
        child: getChildrenByLayoutMode(json),
      );
    case 'TEXT':
      return getText(json);
    case 'FRAME':
      return Container(
        width: json['width'],
        height: json['height'],
        decoration: BoxDecoration(
          color: getColorFromFills(json),
          border: getBorder(json),
          borderRadius: getBorderRadius(json),
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
          borderRadius: getBorderRadius(json),
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

BorderRadius getBorderRadius(Map<String, dynamic> json) {
  print('getBorderRadius');
  if (json['topLeftRadius'] == null) return null;

  return BorderRadius.only(
    topLeft: Radius.circular(json['topLeftRadius'] ?? 0),
    topRight: Radius.circular(json['topRightRadius'] ?? 0),
    bottomLeft: Radius.circular(json['bottomLeftRadius'] ?? 0),
    bottomRight: Radius.circular(json['bottomRightRadius'] ?? 0),
  );
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
    switch (json['constraints']['vertical']) {
      case 'CENTER':
        return CrossAxisAlignment.center;
    }
  }
  switch (json['counterAxisAlignItems']) {
    case 'CENTER':
      return CrossAxisAlignment.center;
  }
  return CrossAxisAlignment.start;
}

getMainAxisAlignment(Map<String, dynamic> json) {
  print('getCrossAxisAlignment');
  if (json['constraints'] != null) {
    switch (json['constraints']['horizontal']) {
      case 'CENTER':
        return MainAxisAlignment.center;
    }
  }
  switch (json['primaryAxisAlignItems']) {
    case 'CENTER':
      return MainAxisAlignment.center;
  }

  return MainAxisAlignment.start;
}
