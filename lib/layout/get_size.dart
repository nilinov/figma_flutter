import 'package:flutter_visible/imports.dart';

class SizeWidget {
  final double? w;
  final double? h;

  SizeWidget(this.w, this.h);

  factory SizeWidget.empty() => SizeWidget(null, null);
}

SizeWidget getSize(Json parent, Json json) {
  double? w;
  double? h;

  if (isExpandedWidth(parent, json) || isExpandedHeight(parent, json)) {
    w = !isExpandedWidth(parent, json) ? toDouble(json['width']) : null;
    h = !isExpandedHeight(parent, json) ? toDouble(json['height']) : null;
  }

  return SizeWidget(w, h);
}
