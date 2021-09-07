import 'package:flutter/rendering.dart';
import 'package:flutter_visible/imports.dart';

GWidget wrapListView(GWidgetList<GWidget> widget,
    {required int level, required Json json}) {
  debugPrintWidget("wrapListView",
      level: level, name: json['name'], json: json);

  Axis axis = Axis.vertical;

  if (json['layoutMode'] == 'HORIZONTAL') {
    axis = Axis.horizontal;
  }

  return GWidget(
    ListView(
      children: widget.widget.map((e) => e.widget).toList(),
      scrollDirection: axis,
    ),
    code:
    '''Container(child: ListView(children: ${widget.code}, scrollDirection: $axis))''',
    components: widget.components,
    type: 'ListView',
    widgetType: 'ListView',
  );
}
