import 'dart:convert';

import 'package:flutter/material.dart';

getData() {
  return jsonDecode(
      '{"type":"COMPONENT","id":"9:4","parent":{"id":"0:1"},"name":"Frame 1","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","relativeTransform":[[1,0,413],[0,1,179]],"absoluteTransform":[[1,0,413],[0,1,179]],"x":413,"y":179,"width":181,"height":248,"rotation":0,"constrainProportions":false,"layoutGrow":0,"children":[{"type":"RECTANGLE","id":"9:5","parent":{"id":"9:4"},"name":"Rectangle 1","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.7686274647712708,"g":0.7686274647712708,"b":0.7686274647712708}}],"fillStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"INSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,10],[0,1,10]],"absoluteTransform":[[1,0,423],[0,1,189]],"x":10,"y":10,"width":161,"height":138,"rotation":0,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"MIN","vertical":"MIN"},"cornerRadius":0,"cornerSmoothing":0,"topLeftRadius":0,"topRightRadius":0,"bottomLeftRadius":0,"bottomRightRadius":0,"reactions":[]},{"type":"TEXT","id":"9:6","parent":{"id":"9:4"},"name":"Utils main.dart imports.dart MainPage.dart","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0,"g":0,"b":0}}],"fillStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"OUTSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,10],[0,1,158]],"absoluteTransform":[[1,0,423],[0,1,337]],"x":10,"y":158,"width":79,"height":80,"rotation":0,"layoutAlign":"INHERIT","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"SCALE","vertical":"SCALE"},"textStyleId":"","characters":"Utils\\nmain.dart\\nimports.dart\\nMainPage.dart","hasMissingFont":false,"autoRename":true,"fontSize":12,"paragraphIndent":0,"paragraphSpacing":0,"textAlignHorizontal":"LEFT","textAlignVertical":"TOP","textCase":"ORIGINAL","textDecoration":"NONE","textAutoResize":"WIDTH_AND_HEIGHT","letterSpacing":{"unit":"PERCENT","value":0},"lineHeight":{"unit":"PERCENT","value":169.68750953674316},"reactions":[]}],"exportSettings":[],"fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":1,"g":1,"b":1}}],"fillStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"INSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"cornerRadius":0,"cornerSmoothing":0,"topLeftRadius":0,"topRightRadius":0,"bottomLeftRadius":0,"bottomRightRadius":0,"paddingLeft":10,"paddingRight":10,"paddingTop":10,"paddingBottom":10,"primaryAxisAlignItems":"MIN","counterAxisAlignItems":"MIN","primaryAxisSizingMode":"FIXED","layoutGrids":[],"gridStyleId":"","backgrounds":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":1,"g":1,"b":1}}],"backgroundStyleId":"","clipsContent":false,"guides":[],"expanded":false,"constraints":{"horizontal":"MIN","vertical":"MIN"},"layoutMode":"VERTICAL","counterAxisSizingMode":"FIXED","horizontalPadding":10,"verticalPadding":10,"itemSpacing":10,"overflowDirection":"NONE","numberOfFixedChildren":0,"overlayPositionType":"CENTER","overlayBackground":{"type":"NONE"},"overlayBackgroundInteraction":"NONE","description":"","documentationLinks":[],"remote":false,"key":"706f32939774bb542bddf4f789e349e32aefa74f","reactions":[]}');
}

Widget getWidgetByMap(Map<String, dynamic> json) {
  print(json['type']);
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
    default:
      return SizedBox();
  }
}

EdgeInsets getPadding(Map<String, dynamic> json) {
  return EdgeInsets.only(
        top: json['paddingTop'],
        left: json['paddingLeft'],
        right: json['paddingRight'],
        bottom: json['paddingBottom'],
      );
}

Border getBorder(Map<String, dynamic> json) {
  final stroke = (json['strokes'] as List)
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
  final color1 = ([...json['strokes'], ...json['fills']])
      .firstWhere((element) => element['type'] == 'SOLID', orElse: () => null);

  if (color1 != null) {
    return getColor(color1['color'] ?? color1);
  }

  return Colors.transparent;
}

Color getColor(Map<String, dynamic> color, {num opacity = 1}) {
  return Color.fromRGBO(
    (color['r'] * 255).round(),
    (color['g'] * 255).round(),
    (color['b'] * 255).round(),
    opacity,
  );
}

Widget getChildrenByLayoutMode(Map<String, dynamic> json) {
  if (json == null || json['children'] == null) return SizedBox();
  if (json['layoutMode'] == 'VERTICAL') {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:
          (json['children'] as List).map((e) => getWidgetByMap(e)).toList(),
    );
  } else {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          (json['children'] as List).map((e) => getWidgetByMap(e)).toList(),
    );
  }
}
