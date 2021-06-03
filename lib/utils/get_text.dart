import 'package:flutter_visible/imports.dart';

TextStyle getTextStyle(Map<String, dynamic> json) {
  TextStyle textStyle = TextStyle();
  if (json['fontSize'] != null)
    textStyle = textStyle.copyWith(fontSize: json['fontSize']);
  if (json['fills'] != null)
    textStyle = textStyle.copyWith(color: getColorFromFills(json));

  return textStyle;
}

Widget getText(Map<String, dynamic> json, int level,
    {List<Variable> variables}) {
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

  String text = json['characters'] ?? '';

  if (variables != null) {
    final _name = json['name'].split('$String:')[1];

    final variable = variables.firstWhere((element) => element.name == _name);

    if (variable != null) {
      text = variable.value ?? variable.defaultValue;
    }
  }

  print(variables);

  Widget res = Text((text).split('\\n').join('\n'),
      textAlign: textAlign, style: getTextStyle(json));

  if ((json['styledText'] as List).length > 1) {
    res = RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: (json['styledText'] as List).map((e) {
          FontStyle fontStyle = FontStyle.normal;
          FontWeight fontWeight = FontWeight.normal;
          String fontFamily = e['fontStyle']['family'];
          String _fontStyle = e['fontStyle']['style'];


          if ((_fontStyle).contains('Italic')) {
            fontStyle = FontStyle.italic;
            if (!_fontStyle.contains('Regular')) {
              fontFamily = "$fontFamily-${_fontStyle}Italic";
            }
          } else {
            fontFamily = "$fontFamily-$_fontStyle";
          }

          if ((_fontStyle).contains('Thin')) {
            fontWeight = FontWeight.w100;
          }

          if ((_fontStyle).contains('Light'))
            fontWeight = FontWeight.w300;

          if ((_fontStyle).contains('Medium'))
            fontWeight = FontWeight.w500;

          if ((_fontStyle).contains('Bold'))
            fontWeight = FontWeight.bold;

          if ((_fontStyle).contains('Black'))
            fontWeight = FontWeight.w900;

          return TextSpan(
              text: (e['text'] as String).replaceAll('\\n', '\n'),
              style: TextStyle(
                color: getColorFromFills(e),
                fontSize: e['fontSize'],
                fontStyle: fontStyle,
                fontWeight: fontWeight,
                fontFamily: fontFamily
              ));
        }).toList(),
      ),
    );
  }

  if (json['textAlignHorizontal'] == 'CENTER' &&
      json['textAlignVertical'] == 'CENTER') {
    // center
  } else if (json['textAutoResize'] == 'WIDTH_AND_HEIGHT') {
    debugPrintWidget("SizedBox", level: level + 1, name: json['name']);
    res = SizedBox(child: res, height: json['height'], width: json['width']);
  } else if (json['textAutoResize'] == 'HEIGHT' && json['layoutGrow'] != 1) {
    res = SizedBox(child: res, width: json['width']);
  }

  if (json['layoutGrow'] == 1) {
    debugPrintWidget("Expanded", level: level + 1, name: json['name']);
    res = Expanded(child: res);
  }

  //TODO vertical align

  return res;
}
