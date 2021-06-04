import 'package:flutter_visible/imports.dart';

GWidget getInstanceByName(Map<String, dynamic> json, int level) {
  var widget;

  final name = (json['name'] as String).toUpperCase();

  switch (name) {
    case 'INPUT':
      widget = getInput(json, level);
      break;
    case 'BUTTON':
      final item = GetButton(json: json, level: level);
      return GWidget(item, GetButtonToCode(extractComponents: true));
    default:
      if (name.contains('CHECKBOX')) {
        return GWidget(GetCheckbox(json: json, level: level), 'SizedBox()');
      }
      if (name.contains('SWITCH')) {
        return GWidget(GetSwitch(json: json, level: level), '');
      }
      widget = getChildrenByLayoutMode(json, level);
  }

  return wrapInstance(json, widget, level);
}
