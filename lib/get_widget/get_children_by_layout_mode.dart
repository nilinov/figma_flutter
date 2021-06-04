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

Widget? getChildrenByLayoutMode(Map<String, dynamic>? json, int level,
    {List<Variable?>? variables}) {
  if (viewDebugProps) print('getChildrenByLayoutMode');

  if (json == null ||
      json['children'] == null ||
      (json['children'] as List)
              .where((element) => element['visible'] == true)
              .length ==
          0) return SizedBox();

  if ((json['children'] as List)
          .where((element) => element['visible'] == true)
          .length ==
      1 && json['children'][0]['type'] != 'TEXT') {

    debugPrintWidget("Align", level: level, name: json['name']);

    return Align(
      child: getWidgetByMap(
        (json['children'] as List)
            .firstWhere((element) => element['visible'] == true),
        level,
        variables: variables,
      ),
      alignment: getAlign(json),
    );
  }

  if (json['layoutMode'] == 'VERTICAL') {
    debugPrintWidget("Column", level: level, name: json['name']);
    return Column(
      crossAxisAlignment: getCrossAxisAlignment(json),
      mainAxisAlignment: getMainAxisAlignment(json),
      children: getLayoutChildren(
        json,
        space: json['itemSpacing'],
        axis: Axis.vertical,
        level: level,
        variables: variables,
      ) as List<Widget>,
    );
  } else if (json['layoutMode'] == 'HORIZONTAL') {
    debugPrintWidget("Row", level: level, name: json['name']);
    return Row(
      crossAxisAlignment: getCrossAxisAlignment(json),
      mainAxisAlignment: getMainAxisAlignment(json),
      children: getLayoutChildren(
        json,
        space: json['itemSpacing'],
        axis: Axis.horizontal,
        level: level,
        variables: variables,
      ) as List<Widget>,
    );
  } else {
    final baseX = (json['type'] == 'GROUP') ? json['x'] : 0;
    final baseY = (json['type'] == 'GROUP') ? json['y'] : 0;
    final baseW = json['width'];
    final baseH = json['height'];

    final children = (json['children'] as List)
        .map((e) {
          final widget = getWidgetByMap(e, level + 1, variables: variables);

          if (widget == null) return null;

          if (viewDebugProps) if (viewDebugProps) {
            print('getChildrenByLayoutMode: Stack: widget');
            print(widget);
          }

          debugPrintWidget("Positioned", level: level + 1, name: json['name']);

          final left = e['x'] - baseX;
          final top = e['y'] - baseY;

          final right = baseW - left - e['width'];
          final bottom = baseH - top - e['height'];

          return Positioned(
            child: widget,
            left: left,
            top: top,
            right: right,
            bottom: bottom,
            // width: e['width'],
            // height: e['height'],
          );
        })
        .where((element) => element != null)
        .toList();

    if (viewDebugProps) {
      print({children});
    }

    if (children.length == 0) return null;

    debugPrintWidget("Stack", level: level, name: json['name']);

    if (json['primaryAxisSizingMode'] == null && json['counterAxisSizingMode'] == null) {
      return SizedBox(
        child: Stack(children: children as List<Widget>),
        height: json['height'],
        width: json['width'],
      );
    }

    return Stack(children: children as List<Widget>);
  }
}