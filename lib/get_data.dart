import 'dart:async';
import 'dart:convert';
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_visible/env.dart';

Future<String> getData() async {
  if (!AppEnv.isProd) {
    return await rootBundle.loadString('assets/data.json');
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

  if (json['visible'] == false) {
    print('skip hidden component');
    return SizedBox();
  }

  if (json['svg'] != null) {
    print(json);
    return SvgPicture.string(
      json['svg'],
      key: Key("SVG:${(json['svg'] as String).split('\"').join('"')}"),
      height: json['height'],
      width: json['width'],
    );
  } else if (json['png'] != null) {
    print(json);
    return Image.memory(
      base64Decode(json['png']),
      key: Key("PNG:${(json['png'] as String).split('\"').join('"')}"),
      height: json['height'],
      width: json['width'],
    );
  }

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
    case 'INSTANCE':
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

  Widget res = Text((json['characters'] as String).split('\\n').join('\n'),
      textAlign: textAlign, style: textStyle);
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
      children: getLayoutChildren(json, space: json['itemSpacing'], axis: Axis.vertical),
    );
  } else if (json['layoutMode'] == 'HORIZONTAL') {
    return Row(
      crossAxisAlignment: getCrossAxisAlignment(json),
      mainAxisAlignment: getMainAxisAlignment(json),
      children: getLayoutChildren(json, space: json['itemSpacing'], axis: Axis.horizontal),
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

List<Widget> getLayoutChildren(Map<String, dynamic> json, {double space, Axis axis = Axis.horizontal}) {
  final res = <Widget>[];

  for (var i = 0; i < (json['children'] as List).length; i++) {
    if (i != 0 && space != null && space != 0) {
      if (axis == Axis.horizontal) {
        res.add(SizedBox(width: space));
      } else {
        res.add(SizedBox(height: space));
      }
    }

    res.add(getWidgetByMap(json['children'][i]));
  }

  return res.toList();
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
