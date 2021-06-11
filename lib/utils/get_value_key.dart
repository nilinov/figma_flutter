import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_visible/generated_widget.dart';

ValueKey getValueKeyImage(String data, {String? type, required String? name}) {
  final String value = data.split('\"').join('"');

  // return ValueKey("$type:$value:$name");

  final Map<String, String> res = {
    'type': type ?? 'PNG',
    'value': value,
    'name': '$name',
  };

  return ValueKey(res);
}

String getValueKeyImageString(String data, {String? type, required String? name}) {
  final String value = data.split('\"').join('"');

  // return ValueKey("$type:$value:$name");

  final Map<String, String> res = {
    'type': type ?? 'PNG',
    'value': value,
    'name': '$name',
  };

  return '''ValueKey('$name')''';
}

ValueKey getValueKeyComponent(Widget? value, {required String? name, required String desc}) {

  if (value == null) {
    return ValueKey('WIDGET:$name');
  }

  final Map<String, dynamic> res = {
    'name': '$name',
    'desc': '$desc',
    'type': 'WIDGET',
    'value': value,
  };

  return ValueKey(res);
}

String getValueKeyComponentString(Widget? value, {required String? name}) {

  if (value == null) {
    return "ValueKey('WIDGET:$name')";
  }

  final Map<String, dynamic> res = {
    'type': 'WIDGET',
    'value': value,
    'name': '$name',
  };

  return "ValueKey('$res')";
}

