import 'package:flutter_visible/utils/get_text_style_scss.dart';

import 'imports.dart';

enum StyleType {
  PAINT,
  TEXT,
  EFFECT,
  INVALID,
}

class StylePaint {
  final List<Color> values;

  StylePaint(this.values);

  String get toCode {
    if (values.length > 0) return '''${values.first}''';
    return 'Color(0x000000)';
  }

  String get toHex {
    if (values.length > 0) return '#${values.first.value.toRadixString(16)}';
    return 'black';
  }
}

class Style {
  final Json json;

  Style({required this.json});

  String get name => getNameByJson(json);

  String get key => json['key'];

  String get id => json['id'];

  String get description => json['description'];

  StyleType get type {
    switch (json['type']) {
      case 'TEXT':
        return StyleType.TEXT;
      case 'PAINT':
        return StyleType.PAINT;
      case 'EFFECT':
        return StyleType.EFFECT;
    }

    return StyleType.INVALID;
  }

  String get toCode {
    if (type == StyleType.PAINT) {
      final colors = (json['paints'] as List)
          .where((e) => e['type'] == 'SOLID' && e['visible'] == true)
          .map((e) => getColor(e['color']))
          .toList();
      return '''
        static var ${name.constantCase} = ${StylePaint(colors).toCode};
      ''';
    }
    if (type == StyleType.TEXT) {
      return '''
        static const ${name.constantCase} = ${getTextStyle(json)};
        static ${(name + 'Color').constantCase}(Color color) => ${getTextStyle(json)}.copyWith(color: color);
      ''';
    }
    if (type == StyleType.EFFECT) {
      final effects = (json['effects'] as List)
          .where((e) => e['type'] == 'DROP_SHADOW' && e['visible'] == true)
          .map((e) => getBoxShadowOne(e))
          .toList();

      return '''
        static const ${name.constantCase} = [${effects.join(', ')}];
      ''';
    }
    return '''
    ''';
  }

  String get toScss {
    if (type == StyleType.PAINT) {
      final colors = (json['paints'] as List)
          .where((e) => e['type'] == 'SOLID' && e['visible'] == true)
          .map((e) => getColor(e['color']))
          .toList();
      return '''
        \$$name: ${StylePaint(colors).toHex};
      ''';
    }
    if (type == StyleType.TEXT) {
      return '''
        .$name { ${getTextStyleScss(json)} \n}\n
      ''';
    }
    if (type == StyleType.EFFECT) {
      final effects = (json['effects'] as List)
          .where((e) => e['type'] == 'DROP_SHADOW' && e['visible'] == true)
          .map((e) => getBoxShadowOneScss(e))
          .toList();

      return '''
        \$$name: ${effects.join(', ')};
      ''';
    }
    return '''
    ''';
  }
}

List<Style> getStyles(List<Json> json) {
  final list = json.map((e) => Style(json: e)).toList()
    ..sort((e1, e2) => e1.type.toString().compareTo(e2.type.toString()));

  return list;
}

List<GWidget> getStyleCode(List<Style> list) {
  final fullCodeTexts = '''
    abstract class AppStyledText {
      ${list.where((element) => element.type == StyleType.TEXT).map((e) => e.toCode).join('\n')}
    }
  ''';
  final texts = GWidget(
    SizedBox(),
    type: 'styled-text',
    widgetType: 'SizedBox',
    prefixCodeLine: 'import "../_imports.dart";',
    name: 'StyledText',
    fileName: 'styled_text.dart',
    fullCode: fullCodeTexts,
    components: [],
    children: [],
  );

  final fullCodePaints = '''
    abstract class AppStyledPaint {
      ${list.where((element) => element.type == StyleType.PAINT).map((e) => e.toCode).join('\n')}
    }
  ''';
  final paints = GWidget(
    SizedBox(),
    type: 'styled-paints',
    widgetType: 'SizedBox',
    prefixCodeLine: 'import "../_imports.dart";',
    name: 'StyledPaints',
    fileName: 'styled_paints.dart',
    fullCode: fullCodePaints,
    components: [],
    children: [],
  );

  final fullCodeEffect = '''
    abstract class AppStyledEffects {
      ${list.where((element) => element.type == StyleType.EFFECT).map((e) => e.toCode).join('\n')}
    }
  ''';
  final effects = GWidget(
    SizedBox(),
    type: 'styled-paints',
    widgetType: 'SizedBox',
    prefixCodeLine: 'import "../_imports.dart";',
    name: 'StyledEffects',
    fileName: 'styled_effects.dart',
    fullCode: fullCodeEffect,
    components: [],
    children: [],
  );

  return [texts, paints, effects];
}

List<GWidget> getStyleScss(List<Style> list) {
  final fullCodeTexts = '''
      ${list.where((element) => element.type == StyleType.TEXT).map((e) => e.toScss).join('\n')}
    
  ''';
  final texts = GWidget(
    SizedBox(),
    type: 'styled-text',
    name: 'StyledText',
    fileName: 'styled_text.scss',
    fullCode: fullCodeTexts,
    components: [],
    children: [],
    widgetType: 'styled-text',
  );

  final fullCodePaints = '''
      ${list.where((element) => element.type == StyleType.PAINT).map((e) => e.toScss).join('\n')}
  ''';
  final paints = GWidget(
    SizedBox(),
    type: 'styled-paints',
    name: 'StyledPaints',
    fileName: 'styled_paints.scss',
    fullCode: fullCodePaints,
    components: [],
    widgetType: 'styled-paints',
    children: [],
  );

  final fullCodeEffect = '''
      ${list.where((element) => element.type == StyleType.EFFECT).map((e) => e.toScss).join('\n')}
    
  ''';
  final effects = GWidget(
    SizedBox(),
    type: 'styled-paints',
    name: 'StyledEffects',
    fileName: 'styled_effects.scss',
    fullCode: fullCodeEffect,
    components: [],
    children: [],
    widgetType: 'styled-paints',
  );

  return [texts, paints, effects];
}
