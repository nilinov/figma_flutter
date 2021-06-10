import 'package:flutter_visible/imports.dart';

Color getColorFromFills(Map<String, dynamic> json) {

  if (viewDebugProps) print('getColorFromFills');
  final color1 = [...(json['strokes'] ?? []), ...(json['fills'] ?? [])]
      .firstWhere((element) => element['type'] == 'SOLID', orElse: () => null);

  if (color1 != null) {
    return getColor(color1['color'] ?? color1, opacity: color1['opacity'] ?? color1['color']['opacity']);
  }

  return Colors.transparent;
}

String getColorFromFillsString(Map<String, dynamic> json) {

  if (viewDebugProps) print('getColorFromFills');

  if (json['fillStyleId'] != null && json['fillStyleId'] != '') {
    final style = StylesApp.firstWhere((element) => element.id == json['fillStyleId'], orElse: () => Style(json: {}));
    if (style.type == StyleType.PAINT) {
      return "AppStyledPaint.${style.name}";
    }
  }

  final color1 = [...(json['strokes'] ?? []), ...(json['fills'] ?? [])]
      .firstWhere((element) => element['type'] == 'SOLID', orElse: () => null);

  if (color1 != null) {
    return getColor(color1['color'] ?? color1, opacity: color1['opacity'] ?? color1['color']['opacity']).toString();
  }

  return '''Colors.transparent''';
}
