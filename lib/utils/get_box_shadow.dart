import 'package:flutter_visible/imports.dart';

List<BoxShadow>? getBoxShadow(Map<String, dynamic> json) {
  if (viewDebugProps) print('getBoxShadow');
  if (json['topLeftRadius'] == null) return null;

  return (json['effects'] as List)
      .where((element) =>
          element['type'] == 'DROP_SHADOW' && element['visible'] == true)
      .map(
        (e) => BoxShadow(
          color: getColor(e['color']),
          blurRadius: toDouble(e['radius']) ?? 0,
          spreadRadius: toDouble(e['spread']) ?? 0,
          offset: Offset(
              toDouble(e['offset']['x']) ?? 0, toDouble(e['offset']['y']) ?? 0),
        ),
      )
      .toList();
}

String? getBoxShadowString(Map<String, dynamic> json) {
  if (viewDebugProps) print('getBoxShadowString');
  if (json['topLeftRadius'] == null) return null;

  if (json['effectStyleId'] != null && json['effectStyleId'] != '') {
    final style = StylesApp.firstWhere(
        (element) => element.id == json['effectStyleId'],
        orElse: () => Style(json: {}));
    if (style.type == StyleType.EFFECT) {
      return "AppStyledEffects.${style.name}";
    }
  }

  final code = (json['effects'] as List)
      .where((element) =>
          element['type'] == 'DROP_SHADOW' && element['visible'] == true)
      .map((e) => getBoxShadowOne(e))
      .toList();

  if (code.length == 0) return null;

  return "[${code.join('\n')}]";
}

String getBoxShadowOne(Json json) {
  return '''BoxShadow(
          color: ${getColor(json['color'])},
          blurRadius: ${json['radius']},
          spreadRadius: ${json['spread']},
          offset: ${Offset(toDouble(json['offset']['x']) ?? 0, toDouble(json['offset']['y']) ?? 0)},
        )''';
}

String getBoxShadowOneScss(Json json) {
  return '''
      box-shadow: ${toDouble(json['offset']['x']) ?? 0} ${toDouble(json['offset']['y']) ?? 0} ${json['radius']} ${json['spread']} ${getColor(json['color'])}
  ''';
}
