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
    {List<Variable?>? variables}) {
  if (viewDebugProps) print('getChildrenByLayoutMode');

  if (json == null ||
      json['children'] == null ||
      (json['children'] as List)
              .where((element) => element['visible'] == true)
              .length ==
          0) return gWidgetSizedBox('empty-list');

  if ((json['children'] as List)
              .where((element) => element['visible'] == true)
              .length ==
          1 &&
      json['children'][0]['type'] != 'TEXT' &&
      !isFillWidthVertical(json)
  ) {
    debugPrintWidget("Align", level: level, name: json['name']);

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

  if (json['layoutMode'] == 'VERTICAL') {
    debugPrintWidget("Column", level: level, name: json['name']);

    final children = getLayoutChildren(
      json,
      space: json['itemSpacing'],
      axis: Axis.vertical,
      level: level,
      variables: variables,
    );

    return GWidget(
      Column(
        crossAxisAlignment: getCrossAxisAlignment(json),
        mainAxisAlignment: getMainAxisAlignment(json),
        children: children.widget.map((e) => e.widget).toList(),
      ),
      code: '''
    Column(
      crossAxisAlignment: ${getCrossAxisAlignment(json)},
      mainAxisAlignment: ${getMainAxisAlignment(json)},
      children: ${children.widget.map((e) => e.code).toList()},
    )
    ''',
      components: children.components,
      type: 'Column',
    );
  } else if (json['layoutMode'] == 'HORIZONTAL') {
    debugPrintWidget("Row", level: level, name: json['name']);

    final children = getLayoutChildren(
      json,
      space: json['itemSpacing'],
      axis: Axis.horizontal,
      level: level,
      variables: variables,
    );

    return GWidget(
      Row(
        crossAxisAlignment: getCrossAxisAlignment(json),
        mainAxisAlignment: getMainAxisAlignment(json),
        children: children.widget.map((e) => e.widget).toList(),
      ),
      code: '''Row(
      crossAxisAlignment: ${getCrossAxisAlignment(json)},
      mainAxisAlignment: ${getMainAxisAlignment(json)},
      children: ${children.widget.map((e) => e.code).toList()},
    )''',
      type: 'Row',
    );
  } else {
    final baseX = (json['type'] == 'GROUP') ? json['x'] : 0;
    final baseY = (json['type'] == 'GROUP') ? json['y'] : 0;
    final baseW = json['width'];
    final baseH = json['height'];

    final List _childrenList =
        (json['children']).where((element) => element != null).toList();

    final List<GWidget> children = _childrenList.map((e) {
      final widget = getWidgetByMap(e, level + 1, variables: variables);

      if (viewDebugProps) if (viewDebugProps) {
        print('getChildrenByLayoutMode: Stack: widget');
        print(widget);
      }

      debugPrintWidget("Positioned", level: level + 1, name: json['name']);

      final left = e['x'] - baseX;
      final top = e['y'] - baseY;

      final right = baseW - left - e['width'];
      final bottom = baseH - top - e['height'];

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
          child: ${widget?.code ?? 'SizedBox()'},
          left: $left,
          top: $top,
          right: $right,
          bottom: $bottom,
        )
        ''',
        type: 'Positioned',
      );
    }).toList();

    if (viewDebugProps) {
      print({children});
    }

    if (children.length == 0) return gWidgetSizedBox('empty-stack');

    debugPrintWidget("Stack", level: level, name: json['name']);

    if (json['primaryAxisSizingMode'] == null &&
        json['counterAxisSizingMode'] == null) {
      final child = GWidget(
          Stack(children: children.map((e) => e.widget).toList()),
          code: '''Stack(children: ${children.map((e) => e.code).toList()})''',
          type: 'stack');

      return GWidget(
          SizedBox(
            child: child.widget,
            height: json['height'],
            width: json['width'],
          ),
          code: '''SizedBox(
        child: ${child.code},
        height: ${json['height']},
        width: ${json['width']},
      )''',
          type: 'wrap-stack');
    }

    return GWidget(
      Stack(children: children.map((e) => e.widget).toList()),
      code: '''Stack(children: ${children.map((e) => e.code).toList()})''',
      type: 'stack',
    );
  }
}
