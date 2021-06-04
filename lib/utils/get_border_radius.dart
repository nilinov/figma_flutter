import 'package:flutter_visible/imports.dart';

BorderRadius? getBorderRadius(Map<String, dynamic> json) {
  if (viewDebugProps) print('getBorderRadius');
  if (json['topLeftRadius'] == null) return null;

  return BorderRadius.only(
    topLeft: Radius.circular(json['topLeftRadius'] ?? 0),
    topRight: Radius.circular(json['topRightRadius'] ?? 0),
    bottomLeft: Radius.circular(json['bottomLeftRadius'] ?? 0),
    bottomRight: Radius.circular(json['bottomRightRadius'] ?? 0),
  );
}

String? getBorderRadiusString(Map<String, dynamic> json) {
  if (viewDebugProps) print('getBorderRadius');
  if (json['topLeftRadius'] == null) return null;

  return '''BorderRadius.only(
    topLeft: Radius.circular(${json['topLeftRadius'] ?? 0}),
    topRight: Radius.circular(${json['topRightRadius'] ?? 0}),
    bottomLeft: Radius.circular(${json['bottomLeftRadius'] ?? 0}),
    bottomRight: Radius.circular(${json['bottomRightRadius'] ?? 0}),
  )''';
}
