import 'package:flutter_visible/imports.dart';

List<BoxShadow> getBoxShadow(Map<String, dynamic> json) {
  if (viewDebugProps) print('getBoxShadow');
  if (json['topLeftRadius'] == null) return null;

  return (json['effects'] as List)
      .where((element) => element['type'] == 'DROP_SHADOW' && element['visible'] == true)
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
