import 'package:flutter/cupertino.dart';
import 'package:flutter_visible/get_data.dart';

List<Widget> getLayoutChildren(Map<String, dynamic> json, {double space, Axis axis = Axis.horizontal, @required int level}) {
  final res = <Widget>[];

  for (var i = 0; i < (json['children'] as List).length; i++) {
    if (i != 0 && space != null && space != 0) {
      if (axis == Axis.horizontal) {
        res.add(SizedBox(width: space));
      } else {
        res.add(SizedBox(height: space));
      }
    }

    Widget widget = getWidgetByMap(json['children'][i], level + 1);

    if (widget is Text) {
      widget = Expanded(child: widget);
    }

    res.add(widget);
  }

  return res.where((element) => element != null).toList();
}
