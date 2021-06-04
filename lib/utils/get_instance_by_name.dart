import 'package:flutter_visible/imports.dart';

getInstanceByName(Map<String, dynamic> json, int level) {
  var widget;

  final name = (json['name'] as String).toUpperCase();

  switch (name) {
    case 'INPUT':
      widget = getInput(json, level);
      break;
    case 'BUTTON':
      return GetButton(json: json, level: level);
    default:
      if (name.contains('CHECKBOX')) {
        return GetCheckbox(json: json, level: level);
      }
      if (name.contains('SWITCH')) {
        return GetSwitch(json: json, level: level);
      }
      widget = getChildrenByLayoutMode(json, level);
  }

  return wrapInstance(json, widget, level);
}
