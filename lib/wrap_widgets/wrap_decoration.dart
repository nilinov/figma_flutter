import 'package:flutter_visible/imports.dart';

GWidget wrapDecoration(GWidget widget, Map<String, dynamic> json, { required int level}) {
  return wrapContainer(widget, json, 'wrapDecoration', level: level);
}
