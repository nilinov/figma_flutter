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

Widget getChildrenByLayoutMode(Map<String, dynamic> json, int level) {
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
      1) {
    debugPrintWidget("Align", level: level);

    return Align(
      child: getWidgetByMap(
          (json['children'] as List)
              .firstWhere((element) => element['visible'] == true),
          level),
      alignment: getAlign(json),
    );
  }

  if (json['layoutMode'] == 'VERTICAL') {
    debugPrintWidget("Column", level: level);
    return Column(
      crossAxisAlignment: getCrossAxisAlignment(json),
      mainAxisAlignment: getMainAxisAlignment(json),
      children: getLayoutChildren(json, space: json['itemSpacing'], axis: Axis.vertical, level: level),
    );
  } else if (json['layoutMode'] == 'HORIZONTAL') {
    debugPrintWidget("Row", level: level);
    return Row(
      crossAxisAlignment: getCrossAxisAlignment(json),
      mainAxisAlignment: getMainAxisAlignment(json),
      children: getLayoutChildren(json,
          space: json['itemSpacing'], axis: Axis.horizontal, level: level),
    );
  } else {
    final baseX = (json['type'] == 'GROUP') ? json['x'] : 0;
    final baseY = (json['type'] == 'GROUP') ? json['y'] : 0;

    final children = (json['children'] as List)
        .map((e) {
          final widget = getWidgetByMap(e, level + 1);

          if (widget == null) return null;

          if (viewDebugProps) if (viewDebugProps) {
            print('getChildrenByLayoutMode: Stack: widget');
            print(widget);
          }

          debugPrintWidget("Positioned", level: level + 1);
          return Positioned(
            child: widget,
            left: e['x'] - baseX,
            top: e['y'] - baseY,
            width: e['width'],
            height: e['height'],
          );
        })
        .where((element) => element != null)
        .toList();

    if (viewDebugProps) {
      print({children});
    }

    if (children.length == 0) return null;

    debugPrintWidget("Stack", level: level);
    return Stack(children: children);
  }
}
