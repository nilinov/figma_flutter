import 'package:flutter_visible/ext.dart';
import 'package:flutter_visible/imports.dart';

Alignment getAlign(Map<String, dynamic> json) {
  Alignment alignment = Alignment.center;

  if (json['counterAxisAlignItems'] == 'MIN') {
    switch (json['primaryAxisAlignItems']) {
      case 'MIN':
        alignment = Alignment.topLeft;
        break;
      case 'MAX':
        alignment = Alignment.topRight;
        break;
      case 'CENTER':
        alignment = Alignment.topCenter;
        break;
    }
  }

  if (json['counterAxisAlignItems'] == 'CENTER') {
    switch (json['primaryAxisAlignItems']) {
      case 'MIN':
        alignment = Alignment.centerLeft;
        break;
      case 'MAX':
        alignment = Alignment.centerRight;
        break;
      case 'CENTER':
        alignment = Alignment.center;
        break;
    }
  }

  if (json['counterAxisAlignItems'] == 'MAX') {
    switch (json['primaryAxisAlignItems']) {
      case 'MIN':
        alignment = Alignment.bottomLeft;
        break;
      case 'MAX':
        alignment = Alignment.bottomRight;
        break;
      case 'CENTER':
        alignment = Alignment.bottomCenter;
        break;
    }
  }
  return alignment;
}

GWidget getChildrenByLayoutMode(Map<String, dynamic>? json, int level,
    {List<Variable?>? variables, String? name}) {
  if (viewDebugProps) print('getChildrenByLayoutMode');

  if (json == null ||
      json['children'] == null ||
      (json['children'] as List)
          .where((element) => element['visible'] == true)
          .isEmpty) return gWidgetSizedBox('empty-list');

/*  if ((json['children'] as List)
              .where((element) => element['visible'] == true)
              .length ==
          1 &&
      json['children'][0]['type'] != 'TEXT' &&
      !isFillWidthVertical(json)) {
    debugPrintWidget("Align", level: level, name: json['name'], json: json);

    final child = getWidgetByMap(
      (json['children'] as List)
          .firstWhere((element) => element['visible'] == true),
      level,
      variables: variables,
    );

    var layoutMode = json['layoutMode'];
    var primaryAxisSizingMode = json['primaryAxisSizingMode'];
    var layoutAlign = json['layoutAlign'];

    if (child == null) return gWidgetSizedBox('empty-child');

    if (isAutoLayout(json)) {
      return GWidget(
        Align(
          child: child.widget,
          alignment: getAlign(json),
        ),
        code: '''Align(
      child: ${child.code},
      alignment: ${getAlign(json)},
    )''',
        components: [child],
        type: 'Align',
      );
    }

    return child;
  }*/

  if (isVertical(json)) {
    debugPrintWidget("Column", level: level, name: json['name'], json: json);

    final children = getLayoutChildren(
      json,
      space: toDouble(json['itemSpacing']),
      axis: Axis.vertical,
      level: level,
      variables: variables,
      name: name,
    );

    GWidget item = GWidget(
        Column(
          mainAxisSize: getMainAxisSize(json),
          crossAxisAlignment: getCrossAxisAlignment(json),
          mainAxisAlignment: getMainAxisAlignment(json),
          children: children.widget.map((e) => e.widget).toList(),
        ),
        code: '''
    Column(
      mainAxisSize: ${getMainAxisSize(json)},
      crossAxisAlignment: ${getCrossAxisAlignment(json)},
      mainAxisAlignment: ${getMainAxisAlignment(json)},
      children: ${children.widget.map((e) => e.code).toList()},
    )
    ''',
        components: children.components,
        children: children.components,
        type: 'Column',
        widgetType: 'Column',
        name: name,
        props: {
          'mainAxisSize': getMainAxisSize(json).toString(),
          'crossAxisAlignment': getCrossAxisAlignment(json).toString(),
          'mainAxisAlignment': getMainAxisAlignment(json).toString(),
        });

    final color = getColor(json);

    if (color != Colors.transparent) {
      item = wrapContainer(item, json, getNameByJson(json));
    }

    if (!isStretch(json)) {
      return wrapSizedBox(item, width: toDouble(json['width']));
    }

    return item;
  } else if (isHorizontal(json)) {
    debugPrintWidget("Row", level: level, name: json['name'], json: json);

    final children = getLayoutChildren(
      json,
      space: toDouble(json['itemSpacing']),
      axis: Axis.horizontal,
      level: level,
      variables: variables,
      name: name,
    );

    GWidget item = GWidget(
        Row(
          crossAxisAlignment: getCrossAxisAlignment(json),
          mainAxisAlignment: getMainAxisAlignment(json),
          mainAxisSize: getMainAxisSize(json),
          children: children.widget.map((e) => e.widget).toList(),
        ),
        code: '''Row(
      mainAxisSize: ${getMainAxisSize(json)},
      crossAxisAlignment: ${getCrossAxisAlignment(json)},
      mainAxisAlignment: ${getMainAxisAlignment(json)},
      children: ${children.widget.map((e) => e.code).toList()},
    )''',
        type: 'Row',
        widgetType: 'Row',
        components: children.components,
        children: children.components,
        name: name,
        props: {
          'mainAxisSize': getMainAxisSize(json).toString(),
          'crossAxisAlignment': getCrossAxisAlignment(json).toString(),
          'mainAxisAlignment': getMainAxisAlignment(json).toString(),
        });

    final color = getColor(json);

    if (color != Colors.transparent) {
      item = wrapContainer(item, json, getNameByJson(json));
    }

    if (json['overflowDirection'] != 'NONE') {
      return wrapListView(children, json: json, level: level + 1);
    }

    return item;
  } else {
    final double baseX =
        (json['type'] == 'GROUP') ? toDouble(json['x']) ?? 0 : 0;
    final double baseY =
        (json['type'] == 'GROUP') ? toDouble(json['y']) ?? 0 : 0;
    final double baseW = toDouble(json['width']) ?? 0;
    final double baseH = toDouble(json['height']) ?? 0;

    final List _childrenList =
        (json['children']).where((element) => element != null).toList();

    final List<GWidget> children = _childrenList.map((e) {
      final widget = getWidgetByMap(e, level + 1, variables: variables);

      if (viewDebugProps) if (viewDebugProps) {
        print('getChildrenByLayoutMode: Stack: widget');
        print(widget);
      }

      debugPrintWidget("Positioned",
          level: level + 1, name: json['name'], json: json);

      final double left = (toDouble(e['x']) ?? 0) - baseX;
      final double top = (toDouble(e['y']) ?? 0) - baseY;

      final double right = baseW - left - (toDouble(e['width']) ?? 0);
      final double bottom = baseH - top - (toDouble(e['height']) ?? 0);

      return GWidget<Widget>(
        Positioned(
          child: widget?.widget ?? SizedBox(),
          left: left,
          top: top,
          right: right,
          bottom: bottom,
          // width: e['width'],
          // height: e['height'],
        ),
        code: '''
        Positioned(
          child: ${widget?.code ?? 'const SizedBox()'},
          left: $left,
          top: $top,
          right: $right,
          bottom: $bottom,
        )
        ''',
        type: 'Positioned',
        widgetType: 'Positioned',
        components: [widget!],
        children: [widget],
      );
    }).toList();

    if (viewDebugProps) {
      print({children});
    }

    if (children.length == 0) return gWidgetSizedBox('empty-stack');

    debugPrintWidget("Stack", level: level, name: json['name'], json: json);

    GWidget widget = GWidget(
      Stack(children: children.map((e) => e.widget).toList()),
      code: '''Stack(children: ${children.map((e) => e.code).toList()})''',
      type: 'Stack',
      widgetType: 'Stack',
      components: children,
      children: children,
      name: name,
    );

    double? w;
    double? h;

    if (!isStretch(json)) {
      w = toDouble(json['width']);
    }

    if (!isGrow(json)) {
      h = toDouble(json['height']);
    }

    final color = getColor(json);

    if (color != Colors.transparent) {
      widget = wrapContainer(widget, json, getNameByJson(json));
    }

    return wrapSizedBox(widget, height: h, width: w);
  }
}
