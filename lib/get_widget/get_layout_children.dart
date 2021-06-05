import 'package:flutter_visible/imports.dart';

GWidgetList<GWidget> getLayoutChildren(Map<String, dynamic> json,
    {double? space,
    Axis axis = Axis.horizontal,
    required int level,
    List<Variable?>? variables}) {
  final res = <GWidget>[];

  for (var i = 0; i < (json['children'] as List).length; i++) {
    if (i != 0 && space != null && space != 0) {
      if (axis == Axis.horizontal) {
        res.add(GWidget(SizedBox(width: space), '''SizedBox(width: $space)''',
            type: 'space-width'));
      } else {
        res.add(GWidget(SizedBox(height: space), '''SizedBox(height: $space)''',
            type: 'space-height'));
      }
    }

    GWidget? widget =
        getWidgetByMap(json['children'][i], level + 1, variables: variables);

    if (widget?.widget is Text) {
      if (axis == Axis.horizontal && widget != null) {
        widget = GWidget(
          Expanded(child: widget.widget),
          '''Expanded(child: ${widget.code})''',
          type: 'expanded',
          components: [widget]
        );
      } else if (widget != null) {
        widget = GWidget(
          SizedBox(child: widget.widget, width: double.infinity),
          '''SizedBox(child: ${widget.code}, width: double.infinity)''',
          components: [widget],
          type: 'sizedbox-fill-width',
        );
      }
    }

    if (widget != null) res.add(widget);
  }

  return GWidgetList(res, res.map((e) => e.code).toList(),
      components: res, type: 'wrap-layout');
}
