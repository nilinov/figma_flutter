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

  final double topLeftRadius = json['topLeftRadius'] ?? 0;
  final double topRightRadius = json['topRightRadius'] ?? 0;
  final double bottomLeftRadius = json['bottomLeftRadius'] ?? 0;
  final double bottomRightRadius = json['bottomRightRadius'] ?? 0;

  final double? left = topLeftRadius == bottomLeftRadius ? topLeftRadius : null;
  final double? right = topRightRadius == bottomRightRadius ? topRightRadius : null;

  if (left != null && right == left) return "BorderRadius.all(Radius.circular($left))";

  return '''BorderRadius.only(
    topLeft: Radius.circular($topLeftRadius),
    topRight: Radius.circular($topRightRadius),
    bottomLeft: Radius.circular($bottomLeftRadius),
    bottomRight: Radius.circular($bottomRightRadius),
  )''';
}
