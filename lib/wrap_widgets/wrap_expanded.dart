import 'package:flutter_visible/imports.dart';

GWidget wrapExpanded(GWidget widget) {
  return GWidget(
    Expanded(child: widget.widget),
      code: '''Expanded(child: ${widget.code})''',
    components: [widget],
    type: 'Expanded'
  );
}
