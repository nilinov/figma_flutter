import 'package:flutter_visible/imports.dart';

EdgeInsets getPadding(Map<String, dynamic> json) {
  if (viewDebugProps) print('getPadding');
  return EdgeInsets.only(
    top: toDouble(json['paddingTop']) ?? 0,
    left: toDouble(json['paddingLeft']) ?? 0,
    right: toDouble(json['paddingRight']) ?? 0,
    bottom: toDouble(json['paddingBottom']) ?? 0,
  );
}

String getPaddingString(Map<String, dynamic> json) {
  if (viewDebugProps) print('getPadding');

  final value = getPadding(json);

  if (value.top == 0 && value.bottom == 0 && value.left == 0 && value.right == 0) {
    return '';
  }

  if (value.top == value.bottom && value.top == value.left && value.top == value.right) {
    return 'EdgeInsets.all(${toDouble(json['paddingTop'])})';
  }

  return '''EdgeInsets.only(
    top: ${toDouble(json['paddingTop'] ?? 0)},
    left: ${toDouble(json['paddingLeft'] ?? 0)},
    right: ${toDouble(json['paddingRight'] ?? 0)},
    bottom: ${toDouble(json['paddingBottom'] ?? 0)},
  )''';
}
