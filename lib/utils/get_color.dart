import 'package:flutter_visible/imports.dart';

Color getColor(Map<String, dynamic>? color, {num? opacity = 1}) {
  if (viewDebugProps) print('getColor');

  if (color == null) return Colors.transparent;

  return Color.fromRGBO(
    (color['r'] * 255).round(),
    (color['g'] * 255).round(),
    (color['b'] * 255).round(),
    color['a'] ?? toDouble(opacity),
  );
}
