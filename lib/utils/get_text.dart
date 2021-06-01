import 'package:flutter_visible/imports.dart';

TextStyle getTextStyle(Map<String, dynamic> json) {
  TextStyle textStyle = TextStyle();
  if (json['fontSize'] != null)
    textStyle = textStyle.copyWith(fontSize: json['fontSize']);
  if (json['fills'] != null)
    textStyle = textStyle.copyWith(color: getColorFromFills(json));

  return textStyle;
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

  debugPrintWidget("Text", level: level + 1, name: json['name']);
  Widget res = Text((json['characters'] as String).split('\\n').join('\n'),
      textAlign: textAlign, style: getTextStyle(json));

  if (json['textAlignHorizontal'] == 'CENTER' && json['textAlignVertical'] == 'CENTER') {
    // center
  } else if (json['textAutoResize'] == 'WIDTH_AND_HEIGHT') {
    debugPrintWidget("SizedBox", level: level + 1, name: json['name']);
    res = SizedBox(child: res, height: json['height'], width: json['width']);
  } else if (json['textAutoResize'] == 'HEIGHT') {
    res = SizedBox(child: res, width: json['width']);
  }

  if (json['layoutGrow'] == 1) {
    debugPrintWidget("Expanded", level: level + 1, name: json['name']);
    res = Expanded(child: res);
  }

  //TODO vertical align

  return res;
}
