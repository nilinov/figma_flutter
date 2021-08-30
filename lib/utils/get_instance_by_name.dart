import 'package:flutter_visible/imports.dart';

GWidget getInstanceByName(Map<String, dynamic> json, int level) {
  var widget;

  final name = (json['name'] as String).toUpperCase();


  if (name.contains('INPUT')) {
    widget = getInput(json, level);
    return wrapContainer(widget, json, 'wrap-input');
  }
  if (name.contains('BUTTON')) {
    return getGButton(json, level);
  }
  if (name.contains('CHECKBOX')) {
    return getCheckbox(json, level);
  }
  if (name.contains('SWITCH')) {
    return getSwitch(json, level);
  }

  return getComponent(json, level);
}
