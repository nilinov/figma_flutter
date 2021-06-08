import 'package:flutter_visible/imports.dart';

EdgeInsets getPadding(Map<String, dynamic> json) {
  if (viewDebugProps) print('getPadding');
  return EdgeInsets.only(
    top: json['paddingTop'] ?? 0,
    left: json['paddingLeft'] ?? 0,
    right: json['paddingRight'] ?? 0,
    bottom: json['paddingBottom'] ?? 0,
  );
}

String getPaddingString(Map<String, dynamic> json) {
  if (viewDebugProps) print('getPadding');

  final value = getPadding(json);

  if (value.top == 0 && value.bottom == 0 && value.left == 0 && value.right == 0) {
    return '';
  }

  return '''EdgeInsets.only(
    top: ${json['paddingTop'] ?? 0},
    left: ${json['paddingLeft'] ?? 0},
    right: ${json['paddingRight'] ?? 0},
    bottom: ${json['paddingBottom'] ?? 0},
  )''';
}
