import 'package:flutter_visible/imports.dart';

Border getBorder(Map<String, dynamic> json) {
  if (viewDebugProps) print('getBorder');
  final stroke = ((json['strokes'] ?? []) as List)
      .firstWhere((element) => element['type'] == 'SOLID', orElse: () => null);

  if (stroke != null) {
    return Border.all(
      color: getColor(stroke['color']),
      width: json['strokeWeight'] ?? 0,
    );
  }

  return Border.all(width: 0, color: Colors.transparent);
}

String getBorderString(Map<String, dynamic> json) {
  if (viewDebugProps) print('getBorderString');
  final stroke = ((json['strokes'] ?? []) as List)
      .firstWhere((element) => element['type'] == 'SOLID', orElse: () => null);

  if (stroke != null) {
    return '''Border.all(
      color: ${getColor(stroke['color'])},
      width: ${json['strokeWeight'] ?? 0},
    )''';
  }

  return '''Border.all(width: 0, color: Colors.transparent)''';
}

