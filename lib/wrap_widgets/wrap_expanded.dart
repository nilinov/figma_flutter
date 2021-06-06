import 'package:flutter_visible/imports.dart';

GWidget wrapExpanded(GWidget widget) {
  return GWidget(Expanded(child: widget.widget), '''Expanded(child: ${widget.code})''');
}
