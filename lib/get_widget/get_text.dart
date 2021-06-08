import 'package:flutter_visible/imports.dart';

GWidget getText(Map<String, dynamic> json, int level,
    {List<Variable?>? variables}) {
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

  String code = '';

  debugPrintWidget("Text", level: level + 1, name: json['name']);

  String text = '"' + (json['characters'] ?? '') + '"';

  if (variables != null) {
    final _name = json['name'].split('$String:')[1];

    final variable = variables.firstWhere((element) => element!.name == _name);

    if (variable != null) {
      if (variable.inCodeVariable == false) {
        text = variable.value ?? variable.defaultValue;
        text = '"${text.split('\\n').join('\n')}"';
      } else {
        if (variable.template != null) {
          text = variable.template?.replaceAll('\$variable', variable.name ?? '') ?? 'variable';
        } else {
          text = variable.name ?? 'variable';
        }
      }
    }
  }

  final style  = getTextStyle(json);
  Widget res = Text(text,textAlign: textAlign, style: style.textStyle);

  code =
      '''Text($text, textAlign: $textAlign, style: ${getTextStyle(json)})''';

  if ((json['styledText'] as List).length > 1) {
    final children = GWidgetList(
        (json['styledText'] as List).map((e) {
          return TextSpan(
              text: (e['text'] as String).replaceAll('\\n', '\n'),
              style: getTextStyle(e).textStyle);
        }).toList(),
      (json['styledText'] as List).map((e) {
        return '''TextSpan(
            text: "${(e['text'] as String).replaceAll('\\n', '\n')}", 
            style: ${getTextStyle(e).code})''';
      }).toList(),
      components: [],
      type: 'list-of-textspan'
    );
    res = RichText(
      textAlign: textAlign,
      text: TextSpan(children: children.widget),
    );

    code = ''' 
    RichText(
      textAlign: $textAlign,
      text: TextSpan(children: ${children.code}),
    )
    ''';
  }

  if (json['textAlignHorizontal'] == 'CENTER' &&
      json['textAlignVertical'] == 'CENTER') {
    // center
  } else if (json['textAutoResize'] == 'WIDTH_AND_HEIGHT') {
    debugPrintWidget("SizedBox", level: level + 1, name: json['name']);
    res = SizedBox(child: res, height: json['height'], width: json['width']);
  } else if (json['textAutoResize'] == 'HEIGHT' &&
      json['layoutGrow'] != 1 &&
      json['layoutAlign'] != "STRETCH") {
    res = SizedBox(child: res, width: json['width']);
  }

  // if (json['layoutGrow'] == 1) {
  //   debugPrintWidget("Expanded", level: level + 1, name: json['name']);
  //   res = Expanded(child: res);
  // }

  //TODO vertical align

  return GWidget(res, code: code, type: 'wrap-text');
}
