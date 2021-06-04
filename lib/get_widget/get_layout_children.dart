import 'package:flutter_visible/imports.dart';

List<Widget> getLayoutChildren(Map<String, dynamic> json,
    {double? space, Axis axis = Axis.horizontal, required int level, List<Variable?>? variables}) {
  final res = <Widget>[];

  for (var i = 0; i < (json['children'] as List).length; i++) {
    if (i != 0 && space != null && space != 0) {
      if (axis == Axis.horizontal) {
        res.add(SizedBox(width: space));
      } else {
        res.add(SizedBox(height: space));
      }
    }

    Widget? widget = getWidgetByMap(json['children'][i], level + 1, variables: variables);

    if (widget is Text) {
      if (axis == Axis.horizontal) {
        widget = Expanded(child: widget);
      } else {
        widget = SizedBox(child: widget, width: double.infinity);
      }
    }

    if (widget != null) res.add(widget);
  }

  return res;
}