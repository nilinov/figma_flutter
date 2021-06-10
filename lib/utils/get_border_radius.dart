import 'package:flutter_visible/imports.dart';

BorderRadius? getBorderRadius(Map<String, dynamic> json) {
  if (viewDebugProps) print('getBorderRadius');
  if (json['topLeftRadius'] == null) return null;

  return BorderRadius.only(
    topLeft: Radius.circular(toDouble(json['topLeftRadius']) ?? 0),
    topRight: Radius.circular(toDouble(json['topRightRadius']) ?? 0),
    bottomLeft: Radius.circular(toDouble(json['bottomLeftRadius']) ?? 0),
    bottomRight: Radius.circular(toDouble(json['bottomRightRadius']) ?? 0),
  );
}

String? getBorderRadiusString(Map<String, dynamic> json) {
  if (viewDebugProps) print('getBorderRadius');
  if (json['topLeftRadius'] == null) return null;

  final double topLeftRadius = toDouble(json['topLeftRadius']) ?? 0;
  final double topRightRadius = toDouble(json['topRightRadius']) ?? 0;
  final double bottomLeftRadius = toDouble(json['bottomLeftRadius']) ?? 0;
  final double bottomRightRadius = toDouble(json['bottomRightRadius']) ?? 0;

  final double? left = topLeftRadius == bottomLeftRadius ? topLeftRadius : null;
  final double? right = topRightRadius == bottomRightRadius ? topRightRadius : null;

  if (left != null && right == left) return "BorderRadius.all(Radius.circular(${toDouble(left)}))";

  return '''BorderRadius.only(
    topLeft: Radius.circular(${toDouble(topLeftRadius)}),
    topRight: Radius.circular(${toDouble(topRightRadius)}),
    bottomLeft: Radius.circular(${toDouble(bottomLeftRadius)}),
    bottomRight: Radius.circular(${toDouble(bottomRightRadius)}),
  )''';
}
