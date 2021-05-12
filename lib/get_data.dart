import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_visible/env.dart';

Future<String> getData() async {
  if (!AppEnv.isProd) {
    return '''
  {"type":"FRAME","id":"105:50","parent":{"id":"0:1"},"name":"input / regular","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","relativeTransform":[[1,0,1073],[0,1,272]],"absoluteTransform":[[1,0,1073],[0,1,272]],"x":1073,"y":272,"width":343,"height":48,"rotation":0,"constrainProportions":false,"layoutGrow":0,"children":[{"type":"RECTANGLE","id":"105:51","parent":{"id":"105:50"},"name":"Rectangle 1065","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.9490196108818054,"g":0.95686274766922,"b":0.9647058844566345}}],"fillStyleId":"S:f7bbc61b8a6a4e69a6b641b6dc0a5b16a46ef435,1629:1","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"INSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,0],[0,1,0]],"absoluteTransform":[[1,0,1073],[0,1,272]],"x":0,"y":0,"width":343,"height":48,"rotation":0,"layoutAlign":"INHERIT","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"SCALE","vertical":"SCALE"},"cornerRadius":8,"cornerSmoothing":0,"topLeftRadius":8,"topRightRadius":8,"bottomLeftRadius":8,"bottomRightRadius":8,"reactions":[]},{"type":"TEXT","id":"105:52","parent":{"id":"105:50"},"name":"Name","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.2705882489681244,"g":0.2823529541492462,"b":0.30980393290519714}}],"fillStyleId":"S:905eb497ff6a01d3c01d6d6d266c4883aabcd3d5,770:9","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"OUTSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,16],[0,1,13]],"absoluteTransform":[[1,0,1089],[0,1,285]],"x":16,"y":13,"width":194,"height":22,"rotation":0,"layoutAlign":"INHERIT","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"SCALE","vertical":"SCALE"},"textStyleId":"S:ff81115c4f3c405b3803e1d333e6ee27325138a7,1604:13","characters":"i.shabuninaitmegstar.com","hasMissingFont":true,"autoRename":true,"fontSize":16,"paragraphIndent":0,"paragraphSpacing":0,"textAlignHorizontal":"LEFT","textAlignVertical":"CENTER","textCase":"ORIGINAL","textDecoration":"NONE","textAutoResize":"WIDTH_AND_HEIGHT","letterSpacing":{"unit":"PIXELS","value":0},"lineHeight":{"unit":"PERCENT","value":139.9999976158142},"fontName":{"family":"SF Pro Text","style":"Regular"},"reactions":[]},{"type":"FRAME","id":"105:58","parent":{"id":"105:50"},"name":"icon / 26 / hide","removed":false,"visible":false,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","relativeTransform":[[1,0,305],[0,1,11]],"absoluteTransform":[[1,0,1378],[0,1,283]],"x":305,"y":11,"width":26,"height":26,"rotation":0,"layoutAlign":"CENTER","constrainProportions":false,"layoutGrow":0,"children":[{"type":"BOOLEAN_OPERATION","id":"105:59","parent":{"id":"105:58"},"name":"Union","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.6847849488258362,"g":0.7302533388137817,"b":0.7836292386054993}}],"fillStyleId":"S:a5200e4acf0716330f8d636e2e77d781a811f3a8,1604:18","strokes":[],"strokeStyleId":"","strokeWeight":1.7999999523162842,"strokeAlign":"CENTER","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,0.08657430857419968],[0,1,1.7726938724517822]],"absoluteTransform":[[1,0,1378.0865478515625],[0,1,284.772705078125]],"x":0.08657430857419968,"y":1.7726938724517822,"width":25.826772689819336,"height":22.45462989807129,"rotation":0,"layoutAlign":"CENTER","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"cornerRadius":0,"cornerSmoothing":0,"children":[{"type":"VECTOR","id":"105:60","parent":{"id":"105:59"},"name":"Union (Stroke)","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.5408853888511658,"g":0.5891614556312561,"b":0.6458333134651184}}],"fillStyleId":"S:04300f06b4ebbf951e723f5ea2b0688ffbd21955,59:42","strokes":[],"strokeStyleId":"","strokeWeight":1.600000023841858,"strokeAlign":"CENTER","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,0.08657430857419968],[0,1,5.460014820098877]],"absoluteTransform":[[1,0,1378.0865478515625],[0,1,288.46002197265625]],"x":0.08657430857419968,"y":5.460014820098877,"width":25.826772689819336,"height":15.079999923706055,"rotation":0,"layoutAlign":"INHERIT","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"SCALE","vertical":"SCALE"},"cornerRadius":0,"cornerSmoothing":0,"vectorNetwork":{"regions":[{"windingRule":"EVENODD","loops":[[0,1,2,3],[4,5,6,7,8,9,10,11]]}],"segments":[{"start":0,"end":1,"tangentStart":{"x":-4.397114337727269,"y":0},"tangentEnd":{"x":2.2173822463180883,"y":3.2785785861516716}},{"start":2,"end":0,"tangentStart":{"x":-2.2173887551451053,"y":3.2785810657048002},"tangentEnd":{"x":4.397114337727269,"y":0}},{"start":3,"end":2,"tangentStart":{"x":4.397114337727269,"y":0},"tangentEnd":{"x":-2.217382556262232,"y":-3.2785785861516716}},{"start":1,"end":3,"tangentStart":{"x":2.2173881352568183,"y":-3.278580755760659},"tangentEnd":{"x":-4.397113717838981,"y":0}},{"start":4,"end":5,"tangentStart":{"x":-5.366506799477755,"y":0},"tangentEnd":{"x":2.5224452346474875,"y":-4.196889145865459}},{"start":6,"end":4,"tangentStart":{"x":-2.5224395006808296,"y":-4.1968913154744465},"tangentEnd":{"x":5.366505559701181,"y":0}},{"start":7,"end":6,"tangentStart":{"x":0,"y":0},"tangentEnd":{"x":0,"y":0}},{"start":8,"end":7,"tangentStart":{"x":0,"y":0},"tangentEnd":{"x":0,"y":0}},{"start":9,"end":8,"tangentStart":{"x":5.366506799477755,"y":0},"tangentEnd":{"x":-2.5224444597871285,"y":4.196889765753741}},{"start":10,"end":9,"tangentStart":{"x":2.5224385708483985,"y":4.196891005530306},"tangentEnd":{"x":-5.366505559701181,"y":0}},{"start":11,"end":10,"tangentStart":{"x":0,"y":0},"tangentEnd":{"x":0,"y":0}},{"start":5,"end":11,"tangentStart":{"x":0,"y":0},"tangentEnd":{"x":0,"y":0}}],"vertices":[{"x":12.913385105133093,"y":13.000000746496761,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":2.4466304175511686,"y":7.540000581741309,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":23.380143047128527,"y":7.539998722076462,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":12.913385105133093,"y":2.0799999520696457,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":12.913385105133093,"y":0,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":0.32199918868625566,"y":7.004251595798729,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":25.50477543828398,"y":7.004252835575293,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":25.826772689819336,"y":7.540001201629591,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":25.50477295873083,"y":8.075748947795608,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":12.913385105133093,"y":15.079999923706055,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":0.32199849131193237,"y":8.075747708019042,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":0,"y":7.539999341964744,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"}]},"vectorPaths":[{"windingRule":"EVENODD","data":"M 2.4466304175511686 7.540000581741309 C 4.664012663869257 10.818579167892981 8.516270767405825 13.000000746496761 12.913385105133093 13.000000746496761 C 17.310499442860362 13.000000746496761 21.162754291983422 10.818579787781262 23.380143047128527 7.539998722076462 C 21.162760490866294 4.261420135924791 17.310499442860362 2.0799999520696457 12.913385105133093 2.0799999520696457 C 8.516271387294111 2.0799999520696457 4.6640185528079865 4.26141982598065 2.4466304175511686 7.540000581741309 Z M 0.32199918868625566 7.004251595798729 C 2.8444444233337434 2.8073624499332697 7.546878305655338 0 12.913385105133093 0 C 18.279890664834273 0 22.98233593760315 2.807361520100846 25.50477543828398 7.004252835575293 L 25.826772689819336 7.540001201629591 L 25.50477295873083 8.075748947795608 C 22.9823284989437 12.272638713549348 18.27989190461085 15.079999923706055 12.913385105133093 15.079999923706055 C 7.546879545431913 15.079999923706055 2.8444370621603308 12.272638713549348 0.32199849131193237 8.075747708019042 L 0 7.539999341964744 L 0.32199918868625566 7.004251595798729 Z"}],"handleMirroring":"NONE","reactions":[]},{"type":"VECTOR","id":"105:61","parent":{"id":"105:59"},"name":"Ellipse 19 (Stroke)","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.5408853888511658,"g":0.5891614556312561,"b":0.6458333134651184}}],"fillStyleId":"S:04300f06b4ebbf951e723f5ea2b0688ffbd21955,59:42","strokes":[],"strokeStyleId":"","strokeWeight":1.600000023841858,"strokeAlign":"CENTER","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,6.759875528514385],[0,1,6.7600109577178955]],"absoluteTransform":[[1,0,1384.7598876953125],[0,1,289.760009765625]],"x":6.759875528514385,"y":6.7600109577178955,"width":12.479999542236328,"height":12.480002403259277,"rotation":0,"layoutAlign":"INHERIT","constrainProportions":true,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"SCALE","vertical":"SCALE"},"cornerRadius":0,"cornerSmoothing":0,"vectorNetwork":{"regions":[{"windingRule":"EVENODD","loops":[[0,1,2,3],[4,5,6,7]]}],"segments":[{"start":0,"end":1,"tangentStart":{"x":0,"y":-2.2975047761819813},"tangentEnd":{"x":-2.2975042494822517,"y":0}},{"start":2,"end":0,"tangentStart":{"x":-2.2975042494822517,"y":0},"tangentEnd":{"x":0,"y":2.2975047761819813}},{"start":3,"end":2,"tangentStart":{"x":0,"y":2.2975047761819813},"tangentEnd":{"x":2.2975042494822517,"y":0}},{"start":1,"end":3,"tangentStart":{"x":2.2975042494822517,"y":0},"tangentEnd":{"x":0,"y":-2.2975047761819813}},{"start":4,"end":5,"tangentStart":{"x":-3.4462563742233776,"y":0},"tangentEnd":{"x":0,"y":-3.446257164272972}},{"start":6,"end":4,"tangentStart":{"x":0,"y":-3.446257164272972},"tangentEnd":{"x":3.4462563742233776,"y":0}},{"start":7,"end":6,"tangentStart":{"x":3.4462563742233776,"y":0},"tangentEnd":{"x":0,"y":3.446257164272972}},{"start":5,"end":7,"tangentStart":{"x":0,"y":3.446257164272972},"tangentEnd":{"x":-3.4462563742233776,"y":0}}],"vertices":[{"x":2.0799998720487,"y":6.24000120162964,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":6.239999771118164,"y":2.0800003488858465,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":6.239999771118164,"y":10.400001589457132,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":10.399999205271435,"y":6.24000120162964,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":6.239999771118164,"y":0,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":0,"y":6.24000120162964,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":12.479999542236328,"y":6.24000120162964,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":6.239999771118164,"y":12.48000240325928,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"}]},"vectorPaths":[{"windingRule":"EVENODD","data":"M 6.239999771118164 2.0800003488858465 C 3.9424955216359123 2.0800003488858465 2.0799998720487 3.942496425447658 2.0799998720487 6.24000120162964 C 2.0799998720487 8.537505977811621 3.9424955216359123 10.400001589457132 6.239999771118164 10.400001589457132 C 8.537504020600416 10.400001589457132 10.399999205271435 8.537505977811621 10.399999205271435 6.24000120162964 C 10.399999205271435 3.942496425447658 8.537504020600416 2.0800003488858465 6.239999771118164 2.0800003488858465 Z M 0 6.24000120162964 C 0 2.7937440373566678 2.7937433968947865 0 6.239999771118164 0 C 9.686256145341542 0 12.479999542236328 2.7937440373566678 12.479999542236328 6.24000120162964 C 12.479999542236328 9.686258365902612 9.686256145341542 12.48000240325928 6.239999771118164 12.48000240325928 C 2.7937433968947865 12.48000240325928 0 9.686258365902612 0 6.24000120162964 Z"}],"handleMirroring":"NONE","reactions":[]},{"type":"VECTOR","id":"105:62","parent":{"id":"105:59"},"name":"Vector 3 (Stroke)","removed":false,"visible":true,"locked":false,"opacity":1,"blendMode":"PASS_THROUGH","isMask":false,"effects":[],"effectStyleId":"","fills":[{"type":"SOLID","visible":true,"opacity":1,"blendMode":"NORMAL","color":{"r":0.5408853888511658,"g":0.5891614556312561,"b":0.6458333134651184}}],"fillStyleId":"S:04300f06b4ebbf951e723f5ea2b0688ffbd21955,59:42","strokes":[],"strokeStyleId":"","strokeWeight":1.7999999523162842,"strokeAlign":"CENTER","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"relativeTransform":[[1,0,1.7726665660738945],[0,1,1.7726938724517822]],"absoluteTransform":[[1,0,1379.7725830078125],[0,1,284.772705078125]],"x":1.7726665660738945,"y":1.7726938724517822,"width":22.45462989807129,"height":22.45462989807129,"rotation":0,"layoutAlign":"INHERIT","constrainProportions":false,"layoutGrow":0,"exportSettings":[],"constraints":{"horizontal":"SCALE","vertical":"SCALE"},"cornerRadius":0,"cornerSmoothing":0,"vectorNetwork":{"regions":[{"windingRule":"EVENODD","loops":[[0,1,2,3]]}],"segments":[{"start":0,"end":1,"tangentStart":{"x":0,"y":0},"tangentEnd":{"x":0,"y":0}},{"start":2,"end":0,"tangentStart":{"x":0,"y":0},"tangentEnd":{"x":0,"y":0}},{"start":3,"end":2,"tangentStart":{"x":0,"y":0},"tangentEnd":{"x":0,"y":0}},{"start":1,"end":3,"tangentStart":{"x":0,"y":0},"tangentEnd":{"x":0,"y":0}}],"vertices":[{"x":20.79999929327982,"y":0,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":0,"y":20.79999929327982,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":22.45462989807129,"y":1.6546298299311135,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"},{"x":1.6546298299311135,"y":22.45462989807129,"strokeCap":"NONE","strokeJoin":"MITER","cornerRadius":0,"handleMirroring":"NONE"}]},"vectorPaths":[{"windingRule":"EVENODD","data":"M 0 20.79999929327982 L 20.79999929327982 0 L 22.45462989807129 1.6546298299311135 L 1.6546298299311135 22.45462989807129 L 0 20.79999929327982 Z"}],"handleMirroring":"NONE","reactions":[]}],"booleanOperation":"UNION","expanded":false,"reactions":[]}],"exportSettings":[],"fills":[{"type":"SOLID","visible":false,"opacity":1,"blendMode":"NORMAL","color":{"r":1,"g":1,"b":1}}],"fillStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"INSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"cornerRadius":0,"cornerSmoothing":0,"topLeftRadius":0,"topRightRadius":0,"bottomLeftRadius":0,"bottomRightRadius":0,"paddingLeft":0,"paddingRight":0,"paddingTop":0,"paddingBottom":0,"primaryAxisAlignItems":"MIN","counterAxisAlignItems":"MIN","primaryAxisSizingMode":"AUTO","layoutGrids":[],"gridStyleId":"","backgrounds":[{"type":"SOLID","visible":false,"opacity":1,"blendMode":"NORMAL","color":{"r":1,"g":1,"b":1}}],"backgroundStyleId":"","clipsContent":false,"guides":[],"expanded":false,"constraints":{"horizontal":"MAX","vertical":"CENTER"},"layoutMode":"NONE","counterAxisSizingMode":"FIXED","horizontalPadding":0,"verticalPadding":0,"itemSpacing":0,"overflowDirection":"NONE","numberOfFixedChildren":0,"overlayPositionType":"CENTER","overlayBackground":{"type":"NONE"},"overlayBackgroundInteraction":"NONE","reactions":[]}],"exportSettings":[],"fills":[{"type":"SOLID","visible":false,"opacity":1,"blendMode":"NORMAL","color":{"r":1,"g":1,"b":1}}],"fillStyleId":"","strokes":[],"strokeStyleId":"","strokeWeight":1,"strokeAlign":"INSIDE","strokeCap":"NONE","strokeJoin":"MITER","strokeMiterLimit":4,"dashPattern":[],"cornerRadius":0,"cornerSmoothing":0,"topLeftRadius":0,"topRightRadius":0,"bottomLeftRadius":0,"bottomRightRadius":0,"paddingLeft":0,"paddingRight":0,"paddingTop":0,"paddingBottom":0,"primaryAxisAlignItems":"MIN","counterAxisAlignItems":"MIN","primaryAxisSizingMode":"AUTO","layoutGrids":[],"gridStyleId":"","backgrounds":[{"type":"SOLID","visible":false,"opacity":1,"blendMode":"NORMAL","color":{"r":1,"g":1,"b":1}}],"backgroundStyleId":"","clipsContent":false,"guides":[],"expanded":false,"constraints":{"horizontal":"MIN","vertical":"MIN"},"layoutMode":"NONE","counterAxisSizingMode":"FIXED","horizontalPadding":0,"verticalPadding":0,"itemSpacing":0,"overflowDirection":"NONE","numberOfFixedChildren":0,"overlayPositionType":"CENTER","overlayBackground":{"type":"NONE"},"overlayBackgroundInteraction":"NONE","reactions":[]}
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
  } else if (json['layoutMode'] == 'HORIZONTAL') {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          (json['children'] as List).map((e) => getWidgetByMap(e)).toList(),
    );
  } else if (json['layoutMode'] == 'NONE') {
    return Stack(
      children: (json['children'] as List).map((e) {
        return Positioned(
          child: getWidgetByMap(e),
          left: e['x'],
          top: e['y'],
          width: e['width'],
          height: e['height'],
        );
      }).toList(),
    );
  }
}
