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
      print(json);
      final colors = (json['paints'] as List)
          .where((e) => e['type'] == 'SOLID' && e['visible'] == true)
          .map((e) => getColor(e['color']))
          .toList();
      return '''
        static var $name = ${StylePaint(colors).toCode};
      ''';
    }
    if (type == StyleType.TEXT) {
      return '''
        static const $name = ${getTextStyle(json)};
      ''';
    }
    if (type == StyleType.EFFECT) {
      final effects = (json['effects'] as List)
          .where((e) => e['type'] == 'DROP_SHADOW' && e['visible'] == true)
          .map((e) => getBoxShadowOne(e))
          .toList();

      return '''
        static const $name = [${effects.join(', ')}];
      ''';
    }
    return '''
    ''';
  }
}

List<GWidget> getStyle(List<Json> json) {
  final list = json.map((e) => Style(json: e)).toList()
    ..sort((e1, e2) => e1.type.toString().compareTo(e2.type.toString()));

  final fullCodeTexts = '''
    abstract class AppStyledText {
      ${list.where((element) => element.type == StyleType.TEXT).map((e) => e.toCode).join('\n')}
    }
  ''';
  final texts = GWidget(SizedBox(),
      type: 'styled-text',
      prefixCodeLine: 'import "../_imports.dart";',
      name: 'StyledText',
      fileName: 'styled_text.dart',
      fullCode: fullCodeTexts);

  final fullCodePaints = '''
    abstract class AppStyledPaint {
      ${list.where((element) => element.type == StyleType.PAINT).map((e) => e.toCode).join('\n')}
    }
  ''';
  final paints = GWidget(SizedBox(),
      type: 'styled-paints',
      prefixCodeLine: 'import "../_imports.dart";',
      name: 'StyledPaints',
      fileName: 'styled_paints.dart',
      fullCode: fullCodePaints);

  final fullCodeEffect = '''
    abstract class AppStyledEffects {
      ${list.where((element) => element.type == StyleType.EFFECT).map((e) => e.toCode).join('\n')}
    }
  ''';
  final effects = GWidget(SizedBox(),
      type: 'styled-paints',
      prefixCodeLine: 'import "../_imports.dart";',
      name: 'StyledEffects',
      fileName: 'styled_effects.dart',
      fullCode: fullCodeEffect);

  return [texts, paints, effects];
}
