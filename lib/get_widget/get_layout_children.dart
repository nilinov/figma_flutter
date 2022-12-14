import 'package:flutter_visible/imports.dart';

GWidgetList<GWidget> getLayoutChildren(
  Map<String, dynamic> json, {
  double? space,
  String? name,
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
            code: '''const SizedBox(width: $space)''',
            type: 'space-width',
            widgetType: 'SizedBox',
            components: [],
            children: [],
          ),
        );
      } else {
        res.add(
          GWidget(
            SizedBox(height: space),
            code: '''const SizedBox(height: $space)''',
            type: 'space-height',
            widgetType: 'SizedBox',
            components: [],
            children: [],
          ),
        );
      }
    }

    final itemJson = json['children'][i];

    GWidget? widget =
        getWidgetByMap(itemJson, level + 1, variables: variables, parent: json);

    if (widget?.widget is Text) {
      if (axis == Axis.horizontal && widget != null) {
        widget = wrapExpanded(widget, json: json, level: level);
      } else if (widget != null) {
        widget = wrapSizedBox(widget, width: double.infinity);
      }
    }

    if (widget != null) {
      if (isExpanded(json, itemJson) && !(widget.widget is Expanded)) {
        print(itemJson['name']);
        widget = wrapExpanded(widget, json: itemJson, level: level);
      }

      res.add(widget);
    }
  }

  return GWidgetList(
    res,
    res.map((e) => e.code ?? '').toList(),
    components: res,
    type: 'wrap-layout',
    name: name,
  );
}
