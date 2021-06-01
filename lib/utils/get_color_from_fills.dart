import 'package:flutter_visible/imports.dart';

Color getColorFromFills(Map<String, dynamic> json) {
  if (json == null) return Colors.transparent;

  if (viewDebugProps) print('getColorFromFills');
  final color1 = [...(json['strokes'] ?? []), ...(json['fills'] ?? [])]
      .firstWhere((element) => element['type'] == 'SOLID', orElse: () => null);

  if (color1 != null) {
    return getColor(color1['color'] ?? color1, opacity: color1['opacity'] ?? color1['color']['opacity']);
  }

  return Colors.transparent;
}
