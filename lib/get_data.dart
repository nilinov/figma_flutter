import 'dart:async';
import 'dart:convert';
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_visible/env.dart';
import 'package:flutter_visible/json_text.dart';

const viewDebugProps = false;

Future<String> getData() async {
  if (!AppEnv.isProd) {
    // return json_text;

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

debugPrintWidget(String name, {int level = 0}) {
  print(List.generate(level, (index) => "\t").join('') + " $name");
}

Widget getWidgetByMap(Map<String, dynamic> json, int level) {
  if (json['visible'] == false) {
    return null;
  }

  if (json['svg'] != null) {
    debugPrintWidget("SvgPicture", level: level);
    return SvgPicture.string(
      json['svg'],
      key: Key('''SVG:${(json['svg'] as String).split('\"').join('"')}'''),
      height: json['height'],
      width: json['width'],
    );
  } else if (json['png'] != null) {
    debugPrintWidget("Image", level: level);
    return Image.memory(
      base64Decode(json['png']),
      key: Key('''PNG:${(json['png'] as String).split('\"').join('"')}'''),
      height: json['height'],
      width: json['width'],
    );
  }

  switch (json['type']) {
    case 'COMPONENT':
      var widget = (getChildrenByLayoutMode(json, level + 1));
      if (widget == null) return null;
      debugPrintWidget("Container", level: level);

      return Container(
        key: Key("COMPONENT:${json['name']}"),
        decoration: BoxDecoration(
          // color: getColorFromFills(json),
          color: Colors.white,
          border: getBorder(json),
          borderRadius: getBorderRadius(json),
        ),
        child: widget,
      );
    case 'RECTANGLE':
      var widget = (getChildrenByLayoutMode(json, level + 1));
      if (widget == null) return null;

      debugPrintWidget("Container", level: level);
      return Container(
        key: Key("RECTANGLE:${json['name']}"),
        width: json['width'],
        height: json['height'],
        decoration: BoxDecoration(
          color: getColorFromFills(json),
          border: getBorder(json),
          borderRadius: getBorderRadius(json),
        ),
        child: widget,
      );
    case 'VECTOR':
      debugPrintWidget("SvgPicture", level: level);
      return SvgPicture.string(
        json['svg'],
        key: Key("SVG:${(json['svg'] as String).split('\"').join('"')}"),
        height: json['height'],
        width: json['width'],
      );
    case 'TEXT':
      return getText(json, level + 1);
    case 'FRAME':
      final widget = getChildrenByLayoutMode(json, level + 1);

      if (widget == null) return null;

      debugPrintWidget("Container", level: level);
      return Container(
        // key: Key("FRAME:${json['name']}"),
        width: json['width'],
        height: json['height'],
        decoration: BoxDecoration(
          color: getColorFromFills(json),
          border: getBorder(json),
          borderRadius: getBorderRadius(json),
        ),
        padding: getPadding(json),
        child: widget,
      );
    case 'INSTANCE':
      var widget = (getChildrenByLayoutMode(json, level + 1));
      if (widget == null) return null;

      debugPrintWidget("Container", level: level);
      return Container(
        key: Key("INSTANCE:${json['name']}"),
        decoration: BoxDecoration(
          color: getColorFromFills(json),
          border: getBorder(json),
          borderRadius: getBorderRadius(json),
        ),
        padding: getPadding(json),
        child: widget,
      );
    case 'GROUP':
      Widget item = (getChildrenByLayoutMode(json, level + 1));
      print(item);

      if (item == null) return null;

      debugPrintWidget("Container", level: level);
      return Container(
        key: Key("GROUP:${json['name']}"),
        decoration: BoxDecoration(
          color: getColorFromFills(json),
          border: getBorder(json),
          borderRadius: getBorderRadius(json),
        ),
        padding: getPadding(json),
        child: item,
      );
    default:
      return null;
  }
}

EdgeInsets getPadding(Map<String, dynamic> json) {
  if (viewDebugProps) print('getPadding');
  return EdgeInsets.only(
    top: json['paddingTop'] ?? 0,
    left: json['paddingLeft'] ?? 0,
    right: json['paddingRight'] ?? 0,
    bottom: json['paddingBottom'] ?? 0,
  );
}

Border getBorder(Map<String, dynamic> json) {
  if (viewDebugProps) print('getBorder');
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
  if (viewDebugProps) print('getBorderRadius');
  if (json['topLeftRadius'] == null) return null;

  return BorderRadius.only(
    topLeft: Radius.circular(json['topLeftRadius'] ?? 0),
    topRight: Radius.circular(json['topRightRadius'] ?? 0),
    bottomLeft: Radius.circular(json['bottomLeftRadius'] ?? 0),
    bottomRight: Radius.circular(json['bottomRightRadius'] ?? 0),
  );
}

Widget getText(Map<String, dynamic> json, int level) {
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

  debugPrintWidget("Text", level: level + 1);
  Widget res = Text((json['characters'] as String).split('\\n').join('\n'),
      textAlign: textAlign, style: textStyle);

  // if (json['layoutAlign'] == 'STRETCH') {
  //   debugPrintWidget("Expanded", level: level);
  //   res = Expanded(child: res);
  // }

  //TODO vertical align

  return res;
}

Color getColorFromFills(Map<String, dynamic> json) {
  if (json == null) return Colors.transparent;

  if (viewDebugProps) print('getColorFromFills');
  final color1 = [...(json['strokes'] ?? []), ...(json['fills'] ?? [])]
      .firstWhere((element) => element['type'] == 'SOLID', orElse: () => null);

  if (color1 != null) {
    return getColor(color1['color'] ?? color1);
  }

  return Colors.transparent;
}

Color getColor(Map<String, dynamic> color, {num opacity = 1}) {
  if (viewDebugProps) print('getColor');

  if (color == null) return Colors.transparent;

  return Color.fromRGBO(
    (color['r'] * 255).round(),
    (color['g'] * 255).round(),
    (color['b'] * 255).round(),
    opacity,
  );
}

Widget getChildrenByLayoutMode(Map<String, dynamic> json, int level) {
  if (viewDebugProps) print('getChildrenByLayoutMode');

  if (json == null || json['children'] == null) return SizedBox();
  if (json['layoutMode'] == 'VERTICAL') {
    debugPrintWidget("Column", level: level);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: getLayoutChildren(json, space: json['itemSpacing'], axis: Axis.vertical, level: level),
    );
  } else if (json['layoutMode'] == 'HORIZONTAL') {
    debugPrintWidget("Row", level: level);
    return Row(
      crossAxisAlignment: getCrossAxisAlignment(json),
      mainAxisAlignment: getMainAxisAlignment(json),
      children: getLayoutChildren(json,
          space: json['itemSpacing'], axis: Axis.horizontal, level: level),
    );
  } else {
    final baseX = (json['type'] == 'GROUP') ? json['x'] : 0;
    final baseY = (json['type'] == 'GROUP') ? json['y'] : 0;

    final children = (json['children'] as List)
        .map((e) {
          final widget = getWidgetByMap(e, level + 1);

          if (widget == null) return null;

          if (viewDebugProps) if (viewDebugProps) {
            print('getChildrenByLayoutMode: Stack: widget');
            print(widget);
          }

          debugPrintWidget("Positioned", level: level + 1);
          return Positioned(
            child: widget,
            left: e['x'] - baseX,
            top: e['y'] - baseY,
            width: e['width'],
            height: e['height'],
          );
        })
        .where((element) => element != null)
        .toList();

    if (viewDebugProps) {
      print({children});
    }

    if (children.length == 0) return null;

    debugPrintWidget("Stack", level: level);
    return Stack(children: children);
  }
}

List<Widget> getLayoutChildren(Map<String, dynamic> json, {double space, Axis axis = Axis.horizontal, @required int level}) {
  final res = <Widget>[];

  for (var i = 0; i < (json['children'] as List).length; i++) {
    if (i != 0 && space != null && space != 0) {
      if (axis == Axis.horizontal) {
        res.add(SizedBox(width: space));
      } else {
        res.add(SizedBox(height: space));
      }
    }

    Widget widget = getWidgetByMap(json['children'][i], level + 1);

    if (widget is Text) {
      widget = Expanded(child: widget);
    }

    res.add(widget);
  }

  return res.where((element) => element != null).toList();
}

getCrossAxisAlignment(Map<String, dynamic> json) {
  if (viewDebugProps) print('getCrossAxisAlignment');
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
  if (viewDebugProps) print('getCrossAxisAlignment');
  if (json['constraints'] != null) {
    switch (json['constraints']['horizontal']) {
      case 'CENTER':
        return MainAxisAlignment.center;
      case 'SPACE_BETWEEN':
        return MainAxisAlignment.spaceBetween;
    }
  }
  switch (json['primaryAxisAlignItems']) {
    case 'CENTER':
      return MainAxisAlignment.center;
    case 'SPACE_BETWEEN':
      return MainAxisAlignment.spaceBetween;
  }

  return MainAxisAlignment.start;
}
