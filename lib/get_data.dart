import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_visible/env.dart';

Future<String> getData() async {
  if (!AppEnv.isProd) {
    return '''


{"type":"FRAME","id":"105:16","parent":{"id":"0:1"},"name":"Tab_1","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","relativeTransform":[[1,0,828],[0,1,365]],"absoluteTransform":[[1,0,828],[0,1,365]],"x":828,"y":365,"width":223,"height":50,"rotation":0,"constrainProportions":false,"layoutGrow":0,"children":[{"type":"TEXT","id":"105:17","parent":{"id":"105:16"},"name":"Traveling","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":1,"g":1,"b":1}}],"fillStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"OUTSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,79],[0,1,5]],"absoluteTransform":[[1,0,907],[0,1,370]],"x":79,"y":5,"width":65,"height":40,"rotation":0,"layoutAlign":"INHERIT","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"CENTER","vertical":"CENTER"},"textStyleId":"","characters":"Traveling","hasMissingFont":false,"autoRename":true,"fontSize":16,"paragraphIndent":0,"paragraphSpacing":0,"textAlignHorizontal":"CENTER","textAlignVertical":"CENTER","textCase":"ORIGINAL","textDecoration":"NONE","textAutoResize":"NONE","letterSpacing":{"unit":"PERCENT","value":0},"lineHeight":{"unit":"PIXELS","value":30},"fontName":{"family":"Roboto","style":"Regular"},"reactions":[]}],"exportSettings":[],"fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.2705882489681244,"g":0.2823529541492462,"b":0.30980393290519714}}],"fillStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"INSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"cornerRadius":20,"cornerSmoothing":0,"topLeftRadius":20,"topRightRadius":20,"bottomLeftRadius":20,"bottomRightRadius":20,"paddingLeft":20,"paddingRight":20,"paddingTop":0,"paddingBottom":0,"primaryAxisAlignItems":"CENTER","counterAxisAlignItems":"CENTER","primaryAxisSizingMode":"FIXED","layoutGrids":[],"gridStyleId":"","backgrounds":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.2705882489681244,"g":0.2823529541492462,"b":0.30980393290519714}}],"backgroundStyleId":"","clipsContent":false,"guides":[],"expanded":true,"constraints":{"horizontal":"MIN","vertical":"MIN"},"layoutMode":"HORIZONTAL","counterAxisSizingMode":"FIXED","horizontalPadding":20,"verticalPadding":0,"itemSpacing":10,"overflowDirection":"NONE","numberOfFixedChildren":0,"overlayPositionType":"CENTER","overlayBackground":{"type":"NONE"},"overlayBackgroundInteraction":"NONE","reactions":[]}


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
