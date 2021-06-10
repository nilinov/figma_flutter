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
          blurRadius: e['radius'],
          spreadRadius: e['spread'],
          offset: Offset(e['offset']['x'], e['offset']['y']),
        ),
      )
      .toList();
}

String? getBoxShadowString(Map<String, dynamic> json) {
  if (viewDebugProps) print('getBoxShadowString');
  if (json['topLeftRadius'] == null) return null;

  final code = (json['effects'] as List)
      .where((element) =>
          element['type'] == 'DROP_SHADOW' && element['visible'] == true)
      .map(
        (e) => getBoxShadowOne(e),
      )
      .join('\n');

  return "[$code]";
}

String getBoxShadowOne(Json json) {
  return '''BoxShadow(
          color: ${getColor(json['color'])},
          blurRadius: ${json['radius']},
          spreadRadius: ${json['spread']},
          offset: ${Offset(json['offset']['x'], json['offset']['y'])},
        )''';
}
