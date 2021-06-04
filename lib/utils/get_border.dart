import 'package:flutter_visible/imports.dart';

class GBorder {
  final Border border;
  final String code;

  GBorder(this.border, this.code);

  @override
  String toString() => code;
}

GBorder getBorder(Map<String, dynamic> json) {
  if (viewDebugProps) print('getBorder');
  final stroke = ((json['strokes'] ?? []) as List)
      .firstWhere((element) => element['type'] == 'SOLID', orElse: () => null);

  if (stroke != null) {
    return GBorder(Border.all(
      color: getColor(stroke['color']),
      width: json['strokeWeight'] ?? 0,
    ), '''Border.all(
      color: ${getColor(stroke['color'])},
      width: ${json['strokeWeight'] ?? 0},
    )''');
  }

  return GBorder(Border.all(width: 0, color: Colors.transparent), '''Border.all(width: 0, color: Colors.transparent)''');
}
