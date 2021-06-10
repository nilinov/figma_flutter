import 'package:flutter_visible/imports.dart';

GWidgetList<GWidget> getLayoutChildren(
  Map<String, dynamic> json, {
  double? space,
  Axis axis = Axis.horizontal,
  required int level,
  List<Variable?>? variables,
}) {
  final res = <GWidget>[];

  for (var i = 0; i < (json['children'] as List).length; i++) {
    // add space between items
    if (i != 0 && space != null && space != 0) {
      if (axis == Axis.horizontal) {
        res.add(
          GWidget(
            SizedBox(width: space),
            code: '''SizedBox(width: $space)''',
            type: 'space-width',
            components: [],
          ),
        );
      } else {
        res.add(
          GWidget(
            SizedBox(height: space),
            code: '''SizedBox(height: $space)''',
            type: 'space-height',
            components: [],
          ),
        );
      }
    }

    final itemJson = json['children'][i];

    GWidget? widget = getWidgetByMap(itemJson, level + 1, variables: variables);

    if (widget?.widget is Text) {
      if (axis == Axis.horizontal && widget != null) {
        widget = wrapExpanded(widget);
      } else if (widget != null) {
        widget = wrapSizedBox(widget, width: double.infinity);
      }
    }

    if (widget != null) {
      res.add(widget);
    }
  }

  return GWidgetList(res, res.map((e) => e.code ?? '').toList(),
      components: res, type: 'wrap-layout');
}
