import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_visible/env.dart';
import 'ext.dart';

Future<String> getData() async {
  if (!AppEnv.isProd) {
    return '''


{"type":"COMPONENT","id":"16:0","parent":{"id":"0:1"},"name":"Подготовлено, не трогать","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[{"type":"DROP_SHADOW","color":{"r":0,"g":0,"b":0,"a":0.25},"offset":{"x":0,"y":4},"radius":4,"spread":0,"visible":true,"blendMode":"NORMAL"}],"effectStyleId":"","relativeTransform":[[1,0,62],[0,1,568]],"absoluteTransform":[[1,0,62],[0,1,568]],"x":62,"y":568,"width":420,"height":122,"rotation":0,"constrainProportions":false,"layoutGrow":0,"children":[{"type":"FRAME","id":"7:204","parent":{"id":"16:0"},"name":"header__part","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","relativeTransform":[[1,0,16],[0,1,16]],"absoluteTransform":[[1,0,78],[0,1,584]],"x":16,"y":16,"width":388,"height":20,"rotation":0,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":0,"children":[{"type":"INSTANCE","id":"7:205","parent":{"id":"7:204"},"name":"icon / 16 / arrow right","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","relativeTransform":[[-1,0,20],[0,1,0]],"absoluteTransform":[[-1,0,98],[0,1,584]],"x":20,"y":0,"width":20,"height":20,"rotation":-180,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":0,"children":[{"type":"VECTOR","id":"I7:205;127:361","parent":{"id":"7:205"},"name":"icon","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[],"fillStyleId":"","strokes":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.6823529601097107,"g":0.003921568859368563,"b":0.2823529541492462}}],"strokeStyleId":"S:2c6c8455efbf2bc77c6284396d3a94dee8e9109a,823:1","strokeWeight":1.7999999523162842,"strokeAlign":"CENTER","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[-4.371138828673793e-8,1,5.5],[-1,-4.371138828673793e-8,13]],"absoluteTransform":[[4.371138828673793e-8,-1,92.5],[-1,-4.371138828673793e-8,597]],"x":5.5,"y":13,"width":10,"height":5,"rotation":90.00000250447808,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"MIN","vertical":"MIN"},"cornerRadius":0,"cornerSmoothing":0,"vectorNetwork":{"regions":[],"segments":[{"start":0,"end":1,"tangentStart":{"x":0,"y":0},"tangentEnd":{"x":0,"y":0}},{"start":1,"end":2,"tangentStart":{"x":0,"y":0},"tangentEnd":{"x":0,"y":0}}],"vertices":[{"x":10,"y":0,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":5,"y":5,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":0,"y":0,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"}]},"vectorPaths":[{"windingRule":"NONE","data":"M 10 0 L 5 5 L 0 0"}],"handleMirroring":"NONE","reactions":[]}],"exportSettings":[],"fills":[{"type":"SOLID","visible":false,"opacity":1,"blendMode":"NORMAL","color":{"r":1,"g":1,"b":1}}],"fillStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"INSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"cornerRadius":0,"cornerSmoothing":0,"topLeftRadius":0,"topRightRadius":0,"bottomLeftRadius":0,"bottomRightRadius":0,"paddingLeft":0,"paddingRight":0,"paddingTop":0,"paddingBottom":0,"primaryAxisAlignItems":"MIN","counterAxisAlignItems":"MIN","primaryAxisSizingMode":"AUTO","layoutGrids":[],"gridStyleId":"","backgrounds":[{"type":"SOLID","visible":false,"opacity":1,"blendMode":"NORMAL","color":{"r":1,"g":1,"b":1}}],"backgroundStyleId":"","clipsContent":false,"guides":[],"expanded":false,"constraints":{"horizontal":"MIN","vertical":"MIN"},"layoutMode":"NONE","counterAxisSizingMode":"FIXED","horizontalPadding":0,"verticalPadding":0,"itemSpacing":0,"overflowDirection":"NONE","numberOfFixedChildren":0,"overlayPositionType":"CENTER","overlayBackground":{"type":"NONE"},"overlayBackgroundInteraction":"NONE","mainComponent":{"id":"7:186"},"masterComponent":{"id":"7:186"},"scaleFactor":1,"reactions":[]},{"type":"TEXT","id":"7:206","parent":{"id":"7:204"},"name":"message header","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.6823529601097107,"g":0.003921568859368563,"b":0.2823529541492462}}],"fillStyleId":"S:2c6c8455efbf2bc77c6284396d3a94dee8e9109a,823:1","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"OUTSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,20],[0,1,0]],"absoluteTransform":[[1,0,98],[0,1,584]],"x":20,"y":0,"width":348,"height":20,"rotation":0,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":1,"exportSettings":[],"constraints":{"horizontal":"MIN","vertical":"CENTER"},"textStyleId":"","characters":"Технические работы 7","hasMissingFont":false,"autoRename":false,"fontSize":15,"paragraphIndent":0,"paragraphSpacing":0,"textAlignHorizontal":"CENTER","textAlignVertical":"CENTER","textCase":"ORIGINAL","textDecoration":"NONE","textAutoResize":"HEIGHT","letterSpacing":{"unit":"PIXELS","value":-0.23999999463558197},"lineHeight":{"unit":"PIXELS","value":20},"fontName":{"family":"Alef","style":"Regular"},"reactions":[]},{"type":"INSTANCE","id":"9:7","parent":{"id":"7:204"},"name":"icon / 16 / arrow right","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","relativeTransform":[[1,0,368],[0,1,0]],"absoluteTransform":[[1,0,446],[0,1,584]],"x":368,"y":0,"width":20,"height":20,"rotation":0,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":0,"children":[{"type":"VECTOR","id":"I9:7;127:361","parent":{"id":"9:7"},"name":"icon","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[],"fillStyleId":"","strokes":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.6823529601097107,"g":0.003921568859368563,"b":0.2823529541492462}}],"strokeStyleId":"S:2c6c8455efbf2bc77c6284396d3a94dee8e9109a,823:1","strokeWeight":1.7999999523162842,"strokeAlign":"CENTER","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[-4.371138828673793e-8,1,5.5],[-1,-4.371138828673793e-8,13]],"absoluteTransform":[[-4.371138828673793e-8,1,451.5],[-1,-4.371138828673793e-8,597]],"x":5.5,"y":13,"width":10,"height":5,"rotation":90.00000250447808,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"MIN","vertical":"MIN"},"cornerRadius":0,"cornerSmoothing":0,"vectorNetwork":{"regions":[],"segments":[{"start":0,"end":1,"tangentStart":{"x":0,"y":0},"tangentEnd":{"x":0,"y":0}},{"start":1,"end":2,"tangentStart":{"x":0,"y":0},"tangentEnd":{"x":0,"y":0}}],"vertices":[{"x":10,"y":0,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":5,"y":5,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":0,"y":0,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"}]},"vectorPaths":[{"windingRule":"NONE","data":"M 10 0 L 5 5 L 0 0"}],"handleMirroring":"NONE","reactions":[]}],"exportSettings":[],"fills":[{"type":"SOLID","visible":false,"opacity":1,"blendMode":"NORMAL","color":{"r":1,"g":1,"b":1}}],"fillStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"INSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"cornerRadius":0,"cornerSmoothing":0,"topLeftRadius":0,"topRightRadius":0,"bottomLeftRadius":0,"bottomRightRadius":0,"paddingLeft":0,"paddingRight":0,"paddingTop":0,"paddingBottom":0,"primaryAxisAlignItems":"MIN","counterAxisAlignItems":"MIN","primaryAxisSizingMode":"AUTO","layoutGrids":[],"gridStyleId":"","backgrounds":[{"type":"SOLID","visible":false,"opacity":1,"blendMode":"NORMAL","color":{"r":1,"g":1,"b":1}}],"backgroundStyleId":"","clipsContent":false,"guides":[],"expanded":false,"constraints":{"horizontal":"MIN","vertical":"MIN"},"layoutMode":"NONE","counterAxisSizingMode":"FIXED","horizontalPadding":0,"verticalPadding":0,"itemSpacing":0,"overflowDirection":"NONE","numberOfFixedChildren":0,"overlayPositionType":"CENTER","overlayBackground":{"type":"NONE"},"overlayBackgroundInteraction":"NONE","mainComponent":{"id":"7:186"},"masterComponent":{"id":"7:186"},"scaleFactor":1,"reactions":[]}],"exportSettings":[],"fills":[],"fillStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"INSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"cornerRadius":0,"cornerSmoothing":0,"topLeftRadius":0,"topRightRadius":0,"bottomLeftRadius":0,"bottomRightRadius":0,"paddingLeft":0,"paddingRight":0,"paddingTop":0,"paddingBottom":0,"primaryAxisAlignItems":"MIN","counterAxisAlignItems":"MIN","primaryAxisSizingMode":"FIXED","layoutGrids":[],"gridStyleId":"","backgrounds":[],"backgroundStyleId":"","clipsContent":false,"guides":[],"expanded":false,"constraints":{"horizontal":"MIN","vertical":"MIN"},"layoutMode":"HORIZONTAL","counterAxisSizingMode":"AUTO","horizontalPadding":0,"verticalPadding":0,"itemSpacing":0,"overflowDirection":"NONE","numberOfFixedChildren":0,"overlayPositionType":"CENTER","overlayBackground":{"type":"NONE"},"overlayBackgroundInteraction":"NONE","reactions":[]},{"type":"TEXT","id":"7:207","parent":{"id":"16:0"},"name":"message text","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.18039216101169586,"g":0.1921568661928177,"b":0.21568627655506134}}],"fillStyleId":"S:39f79c8de5cf82e77da0193aeed4527d14de7844,134:4","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"OUTSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,16],[0,1,44]],"absoluteTransform":[[1,0,78],[0,1,612]],"x":16,"y":44,"width":388,"height":36,"rotation":0,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"CENTER","vertical":"MIN"},"textStyleId":"","characters":"Уважаемые клиенты! 22 ноября 2020 года мы будем проводить технические работы в ароол...","hasMissingFont":false,"autoRename":false,"fontSize":13,"paragraphIndent":0,"paragraphSpacing":0,"textAlignHorizontal":"LEFT","textAlignVertical":"CENTER","textCase":"ORIGINAL","textDecoration":"NONE","textAutoResize":"HEIGHT","letterSpacing":{"unit":"PIXELS","value":-0.07999999821186066},"lineHeight":{"unit":"PIXELS","value":18},"fontName":{"family":"Actor","style":"Regular"},"reactions":[]},{"type":"TEXT","id":"7:208","parent":{"id":"16:0"},"name":"message date&time","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.35333332419395447,"g":0.4045666456222534,"b":0.4416666626930237}}],"fillStyleId":"S:5ee5074270f288dde234d467c445bbe4acdab876,59:79","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"OUTSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,16],[0,1,88]],"absoluteTransform":[[1,0,78],[0,1,656]],"x":16,"y":88,"width":388,"height":18,"rotation":0,"layoutAlign":"STRETCH","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"MIN","vertical":"MIN"},"textStyleId":"","characters":"22 ноября 2020  |  13:05","hasMissingFont":false,"autoRename":false,"fontSize":13,"paragraphIndent":0,"paragraphSpacing":0,"textAlignHorizontal":"LEFT","textAlignVertical":"TOP","textCase":"ORIGINAL","textDecoration":"NONE","textAutoResize":"HEIGHT","letterSpacing":{"unit":"PIXELS","value":-0.07999999821186066},"lineHeight":{"unit":"PIXELS","value":18},"fontName":{"family":"Actor","style":"Regular"},"reactions":[]}],"exportSettings":[],"fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":1,"g":1,"b":1}}],"fillStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":2,"strokeAlign":"INSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"cornerRadius":12,"cornerSmoothing":0,"topLeftRadius":12,"topRightRadius":12,"bottomLeftRadius":12,"bottomRightRadius":12,"paddingLeft":16,"paddingRight":16,"paddingTop":16,"paddingBottom":16,"primaryAxisAlignItems":"MIN","counterAxisAlignItems":"CENTER","primaryAxisSizingMode":"AUTO","layoutGrids":[],"gridStyleId":"","backgrounds":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":1,"g":1,"b":1}}],"backgroundStyleId":"","clipsContent":false,"guides":[],"expanded":false,"constraints":{"horizontal":"MIN","vertical":"MIN"},"layoutMode":"VERTICAL","counterAxisSizingMode":"FIXED","horizontalPadding":16,"verticalPadding":16,"itemSpacing":8,"overflowDirection":"NONE","numberOfFixedChildren":0,"overlayPositionType":"CENTER","overlayBackground":{"type":"NONE"},"overlayBackgroundInteraction":"NONE","description":"","documentationLinks":[],"remote":false,"key":"0e5aaf164b20074d040490b4a71f325c3d8710da","reactions":[{"action":{"type":"NODE","destinationId":null,"navigation":"NAVIGATE","transition":{"type":"PUSH","direction":"LEFT","matchLayers":false,"easing":{"type":"EASE_IN"},"duration":0.30000001192092896},"preserveScrollPosition":false},"trigger":{"type":"ON_CLICK"}}]}

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
