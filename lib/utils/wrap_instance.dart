import 'package:flutter_visible/imports.dart';

wrapInstance( Map<String, dynamic> json, Widget widget, int level, { Color bgColor } ) {
  double height;

  if (json['counterAxisSizingMode'] == 'FIXED') {
    height = json['height'];
  }

  debugPrintWidget("Container", level: level, name: json['name']);

  Widget widgetINSTANCE = Container(
    key: getValueKeyComponent(null, name: json['name']),
    decoration: BoxDecoration(
      color: bgColor ?? getColorFromFills(json),
      border: getBorder(json),
      borderRadius: getBorderRadius(json),
    ),
    padding: getPadding(json),
    child: widget,
  );

  return Container(
    key: getValueKeyComponent(widgetINSTANCE, name: json['name']),
    decoration: BoxDecoration(
      color: bgColor ?? getColorFromFills(json),
      border: getBorder(json),
      borderRadius: getBorderRadius(json),
    ),
    padding: getPadding(json),
    child: widget,
    height: height,
  );

}
