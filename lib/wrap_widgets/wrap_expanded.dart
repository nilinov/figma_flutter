import 'package:flutter/rendering.dart';
import 'package:flutter_visible/imports.dart';

GWidget wrapExpanded(GWidget widget, {required int level, required Json json}) {
  debugPrintWidget("Expanded", level: level, name: json['name'], json: json);

  return GWidget(
    Expanded(child: widget.widget),
    code: '''Expanded(child: ${widget.code})''',
    components: [widget],
    type: 'Expanded',
    widgetType: 'Expanded',
  );
}
