import 'package:flutter_visible/imports.dart';

getInstanceByName(Map<String, dynamic> json, int level) {
  var widget;

  switch ((json['name'] as String).toUpperCase()) {
    case 'INPUT':
      widget = getInput(json, level);
      break;
    case 'BUTTON':
      return GetButton(json: json, level: level);
      break;
    default:
      widget = getChildrenByLayoutMode(json, level);
  }

  return wrapInstance(json, widget, level);
}
