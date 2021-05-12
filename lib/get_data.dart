import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_visible/env.dart';
import 'ext.dart';

Future<String> getData() async {
  if (!AppEnv.isProd) {
    return '''


{"type":"FRAME","id":"124:283","parent":{"id":"0:1"},"name":"Frame 1","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","relativeTransform":[[1,0,2768],[0,1,1001]],"absoluteTransform":[[1,0,2768],[0,1,1001]],"x":2768,"y":1001,"width":375,"height":267,"rotation":0,"constrainProportions":false,"layoutGrow":0,"children":[{"type":"TEXT","id":"124:147","parent":{"id":"124:283"},"name":"Поделиться купоном","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.0784313753247261,"g":0.11764705926179886,"b":0.18039216101169586}}],"fillStyleId":"S:5a38d41a9fd942c5ee7ee2871ff0a4804cbaa2bd,5:1","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"OUTSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,16],[0,1,0]],"absoluteTransform":[[1,0,2784],[0,1,1001]],"x":16,"y":0,"width":343,"height":35,"rotation":0,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"MIN","vertical":"MIN"},"textStyleId":"","characters":"Поделиться купоном","hasMissingFont":false,"autoRename":true,"fontSize":25,"paragraphIndent":0,"paragraphSpacing":0,"textAlignHorizontal":"LEFT","textAlignVertical":"TOP","textCase":"ORIGINAL","textDecoration":"NONE","textAutoResize":"HEIGHT","letterSpacing":{"unit":"PIXELS","value":-0.23000000417232513},"lineHeight":{"unit":"PERCENT","value":139.9999976158142},"fontName":{"family":"Roboto","style":"Bold"},"reactions":[]},{"type":"TEXT","id":"124:148","parent":{"id":"124:283"},"name":"Введите номер телефона друга, с которым вы хотите поделиться этим купоном","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.0784313753247261,"g":0.11764705926179886,"b":0.18039216101169586}}],"fillStyleId":"S:5a38d41a9fd942c5ee7ee2871ff0a4804cbaa2bd,5:1","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"OUTSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,16],[0,1,62]],"absoluteTransform":[[1,0,2784],[0,1,1063]],"x":16,"y":62,"width":343,"height":42,"rotation":0,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"MIN","vertical":"MIN"},"textStyleId":"","characters":"Введите номер телефона друга, с которым вы хотите поделиться этим купоном","hasMissingFont":false,"autoRename":true,"fontSize":15,"paragraphIndent":0,"paragraphSpacing":0,"textAlignHorizontal":"LEFT","textAlignVertical":"TOP","textCase":"ORIGINAL","textDecoration":"NONE","textAutoResize":"HEIGHT","letterSpacing":{"unit":"PIXELS","value":-0.23000000417232513},"lineHeight":{"unit":"PERCENT","value":139.9999976158142},"fontName":{"family":"Roboto","style":"Regular"},"reactions":[]},{"type":"FRAME","id":"124:278","parent":{"id":"124:283"},"name":"input / filled in","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","relativeTransform":[[1,0,16],[0,1,131]],"absoluteTransform":[[1,0,2784],[0,1,1132]],"x":16,"y":131,"width":343,"height":64,"rotation":0,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":0,"children":[{"type":"TEXT","id":"124:279","parent":{"id":"124:278"},"name":"Large Title","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":0,"strokeAlign":"CENTER","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,16],[0,1,32]],"absoluteTransform":[[1,0,2800],[0,1,1164]],"x":16,"y":32,"width":319,"height":20,"rotation":0,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"MIN","vertical":"CENTER"},"textStyleId":"","characters":"+7 (999) 678-99-00|","hasMissingFont":false,"autoRename":false,"fontSize":15,"paragraphIndent":0,"paragraphSpacing":0,"textAlignHorizontal":"LEFT","textAlignVertical":"CENTER","textCase":"ORIGINAL","textDecoration":"NONE","textAutoResize":"NONE","letterSpacing":{"unit":"PIXELS","value":-0.23999999463558197},"lineHeight":{"unit":"PIXELS","value":20},"fontName":{"family":"Roboto","style":"Regular"},"reactions":[]},{"type":"TEXT","id":"124:280","parent":{"id":"124:278"},"name":"Large Title","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.5408853888511658,"g":0.5891614556312561,"b":0.6458333134651184}}],"fillStyleId":"S:04300f06b4ebbf951e723f5ea2b0688ffbd21955,59:42","strokes":[],"strokeStyleId":"","strokeWeight":0,"strokeAlign":"CENTER","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,16],[0,1,12]],"absoluteTransform":[[1,0,2800],[0,1,1144]],"x":16,"y":12,"width":343,"height":16,"rotation":0,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"MIN","vertical":"MIN"},"textStyleId":"","characters":"Номер телефона","hasMissingFont":false,"autoRename":false,"fontSize":13,"paragraphIndent":0,"paragraphSpacing":0,"textAlignHorizontal":"LEFT","textAlignVertical":"CENTER","textCase":"ORIGINAL","textDecoration":"NONE","textAutoResize":"NONE","letterSpacing":{"unit":"PIXELS","value":-0.07999999821186066},"lineHeight":{"unit":"PIXELS","value":18},"fontName":{"family":"Roboto","style":"Regular"},"reactions":[]},{"type":"VECTOR","id":"124:281","parent":{"id":"124:278"},"name":"Vector 132","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[],"fillStyleId":"","strokes":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.8941176533699036,"g":0.9058823585510254,"b":0.929411768913269}}],"strokeStyleId":"S:14c9c70773d580dafa48b4e0acff80c46ccbf371,7:38","strokeWeight":0.5,"strokeAlign":"CENTER","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,2.4492937051703357e-16,16],[-2.4492937051703357e-16,1,64]],"absoluteTransform":[[1,2.4492937051703357e-16,2800],[-2.4492937051703357e-16,1,1196]],"x":16,"y":64,"width":359,"height":0,"rotation":1.4033419209422001e-14,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"MIN","vertical":"MAX"},"cornerRadius":0,"cornerSmoothing":0,"vectorNetwork":{"regions":[],"segments":[{"start":0,"end":1,"tangentStart":{"x":0,"y":0},"tangentEnd":{"x":0,"y":0}}],"vertices":[{"x":0,"y":0,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":359,"y":0,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"}]},"vectorPaths":[{"windingRule":"NONE","data":"M 0 0 L 359 0"}],"handleMirroring":"NONE","reactions":[]},{"type":"INSTANCE","id":"124:282","parent":{"id":"124:278"},"name":"icon / 16 / arrow right","removed":false,"visible":false,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","relativeTransform":[[1,0,351],[0,1,24]],"absoluteTransform":[[1,0,3135],[0,1,1156]],"x":351,"y":24,"width":16,"height":16,"rotation":0,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":0,"children":[{"type":"VECTOR","id":"I124:282;127:361","parent":{"id":"124:282"},"name":"Rectangle 1051","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[],"fillStyleId":"","strokes":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.5408853888511658,"g":0.5891614556312561,"b":0.6458333134651184}}],"strokeStyleId":"S:04300f06b4ebbf951e723f5ea2b0688ffbd21955,59:42","strokeWeight":1.7999999523162842,"strokeAlign":"CENTER","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[-4.371138828673793e-8,1,5.5],[-1,-4.371138828673793e-8,13]],"absoluteTransform":[[-4.371138828673793e-8,1,3140.5],[-1,-4.371138828673793e-8,1169]],"x":5.5,"y":13,"width":10,"height":5,"rotation":90.00000250447808,"layoutAlign":"INHERIT","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"MIN","vertical":"MIN"},"cornerRadius":0,"cornerSmoothing":0,"vectorNetwork":{"regions":[],"segments":[{"start":0,"end":1,"tangentStart":{"x":0,"y":0},"tangentEnd":{"x":0,"y":0}},{"start":1,"end":2,"tangentStart":{"x":0,"y":0},"tangentEnd":{"x":0,"y":0}}],"vertices":[{"x":10,"y":0,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":5,"y":5,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":0,"y":0,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"}]},"vectorPaths":[{"windingRule":"NONE","data":"M 10 0 L 5 5 L 0 0"}],"handleMirroring":"NONE","reactions":[]}],"exportSettings":[],"fills":[{"type":"SOLID","visible":false,"opacity":1,"blendMode":"NORMAL","color":{"r":1,"g":1,"b":1}}],"fillStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"INSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"cornerRadius":0,"cornerSmoothing":0,"topLeftRadius":0,"topRightRadius":0,"bottomLeftRadius":0,"bottomRightRadius":0,"paddingLeft":0,"paddingRight":0,"paddingTop":0,"paddingBottom":0,"primaryAxisAlignItems":"MIN","counterAxisAlignItems":"MIN","primaryAxisSizingMode":"AUTO","layoutGrids":[],"gridStyleId":"","backgrounds":[{"type":"SOLID","visible":false,"opacity":1,"blendMode":"NORMAL","color":{"r":1,"g":1,"b":1}}],"backgroundStyleId":"","clipsContent":false,"guides":[],"expanded":false,"constraints":{"horizontal":"MIN","vertical":"MIN"},"layoutMode":"NONE","counterAxisSizingMode":"FIXED","horizontalPadding":0,"verticalPadding":0,"itemSpacing":0,"overflowDirection":"NONE","numberOfFixedChildren":0,"overlayPositionType":"CENTER","overlayBackground":{"type":"NONE"},"overlayBackgroundInteraction":"NONE","mainComponent":{"id":"7:186"},"masterComponent":{"id":"7:186"},"scaleFactor":1,"reactions":[]}],"exportSettings":[],"fills":[],"fillStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"INSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"cornerRadius":0,"cornerSmoothing":0,"topLeftRadius":0,"topRightRadius":0,"bottomLeftRadius":0,"bottomRightRadius":0,"paddingLeft":0,"paddingRight":0,"paddingTop":0,"paddingBottom":0,"primaryAxisAlignItems":"MIN","counterAxisAlignItems":"MIN","primaryAxisSizingMode":"AUTO","layoutGrids":[],"gridStyleId":"","backgrounds":[],"backgroundStyleId":"","clipsContent":false,"guides":[],"expanded":true,"constraints":{"horizontal":"MIN","vertical":"MIN"},"layoutMode":"NONE","counterAxisSizingMode":"FIXED","horizontalPadding":0,"verticalPadding":0,"itemSpacing":0,"overflowDirection":"NONE","numberOfFixedChildren":0,"overlayPositionType":"CENTER","overlayBackground":{"type":"NONE"},"overlayBackgroundInteraction":"NONE","reactions":[]},{"type":"FRAME","id":"125:12","parent":{"id":"124:283"},"name":"Frame 4","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","relativeTransform":[[1,0,16],[0,-1,267]],"absoluteTransform":[[1,0,2784],[0,-1,1268]],"x":16,"y":267,"width":343,"height":45,"rotation":0,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":0,"children":[{"type":"TEXT","id":"125:13","parent":{"id":"125:12"},"name":"Поделиться","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":1,"g":1,"b":1}}],"fillStyleId":"S:bca1279ba9d01401bb45dd11415a9c63cc0ca7e4,90:2","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"OUTSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,10],[0,-1,33.5]],"absoluteTransform":[[1,0,2794],[0,1,1234.5]],"x":10,"y":33.5,"width":323,"height":22,"rotation":0,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":1,"exportSettings":[],"constraints":{"horizontal":"CENTER","vertical":"CENTER"},"textStyleId":"","characters":"Поделиться","hasMissingFont":false,"autoRename":true,"fontSize":17,"paragraphIndent":0,"paragraphSpacing":0,"textAlignHorizontal":"CENTER","textAlignVertical":"CENTER","textCase":"ORIGINAL","textDecoration":"NONE","textAutoResize":"HEIGHT","letterSpacing":{"unit":"PIXELS","value":-0.4099999964237213},"lineHeight":{"unit":"PIXELS","value":22},"fontName":{"family":"Roboto","style":"Black"},"reactions":[]}],"exportSettings":[],"fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.6823529601097107,"g":0.003921568859368563,"b":0.2823529541492462}}],"fillStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"INSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"cornerRadius":8,"cornerSmoothing":0,"topLeftRadius":8,"topRightRadius":8,"bottomLeftRadius":8,"bottomRightRadius":8,"paddingLeft":10,"paddingRight":10,"paddingTop":13,"paddingBottom":13,"primaryAxisAlignItems":"CENTER","counterAxisAlignItems":"CENTER","primaryAxisSizingMode":"FIXED","layoutGrids":[],"gridStyleId":"","backgrounds":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.6823529601097107,"g":0.003921568859368563,"b":0.2823529541492462}}],"backgroundStyleId":"","clipsContent":false,"guides":[],"expanded":true,"constraints":{"horizontal":"CENTER","vertical":"CENTER"},"layoutMode":"HORIZONTAL","counterAxisSizingMode":"FIXED","horizontalPadding":10,"verticalPadding":13,"itemSpacing":10,"overflowDirection":"NONE","numberOfFixedChildren":0,"overlayPositionType":"CENTER","overlayBackground":{"type":"NONE"},"overlayBackgroundInteraction":"NONE","reactions":[]}],"exportSettings":[],"fills":[],"fillStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"INSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"cornerRadius":0,"cornerSmoothing":0,"topLeftRadius":0,"topRightRadius":0,"bottomLeftRadius":0,"bottomRightRadius":0,"paddingLeft":16,"paddingRight":16,"paddingTop":0,"paddingBottom":0,"primaryAxisAlignItems":"MIN","counterAxisAlignItems":"MIN","primaryAxisSizingMode":"AUTO","layoutGrids":[],"gridStyleId":"","backgrounds":[],"backgroundStyleId":"","clipsContent":false,"guides":[],"expanded":true,"constraints":{"horizontal":"CENTER","vertical":"MIN"},"layoutMode":"VERTICAL","counterAxisSizingMode":"FIXED","horizontalPadding":16,"verticalPadding":0,"itemSpacing":27,"overflowDirection":"NONE","numberOfFixedChildren":0,"overlayPositionType":"CENTER","overlayBackground":{"type":"NONE"},"overlayBackgroundInteraction":"NONE","reactions":[]}


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

  Widget res = Text(json['characters'], textAlign: textAlign, style: textStyle);
  if (json['layoutAlign'] == 'STRETCH')
    res = Expanded(child: res);

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
