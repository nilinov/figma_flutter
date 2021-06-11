import 'package:flutter_visible/imports.dart';

isAutoLayout(Json json) {
  return json['layoutMode'] != null && json['layoutMode'] != 'NONE';
}

isVertical(Map<String, dynamic> json) {
  return json['layoutMode'] == 'VERTICAL';
}

isHorizontal(Map<String, dynamic> json) {
  return json['layoutMode'] == 'HORIZONTAL';
}

isStretch(Map<String, dynamic> json) {
  return json['layoutAlign'] == 'STRETCH';
}

isGrow(Map<String, dynamic> json) {
  return json['layoutGrow'] == 1;
}

