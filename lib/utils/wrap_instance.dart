import 'package:flutter_visible/imports.dart';

GWidget wrapInstance( Map<String, dynamic> json, GWidget? widget, int level, { Color? bgColor } ) {
  double? height;

  if (json['counterAxisSizingMode'] == 'FIXED') {
    height = json['height'];
  }

  debugPrintWidget("Container", level: level, name: json['name']);

  Widget widgetINSTANCE = Container(
    key: getValueKeyComponent(null, name: json['name']),
    decoration: BoxDecoration(
      color: bgColor ?? getColorFromFills(json),
      border: getBorder(json).border,
      borderRadius: getBorderRadius(json),
    ),
    padding: getPadding(json),
    child: widget?.widget,
  );

  return GWidget(Container(
    key: getValueKeyComponent(widgetINSTANCE, name: json['name']),
    decoration: BoxDecoration(
      color: bgColor ?? getColorFromFills(json),
      border: getBorder(json).border,
      borderRadius: getBorderRadius(json),
      boxShadow: getBoxShadow(json),
    ),
    padding: getPadding(json),
    child: widget?.widget,
    height: height,
  ),
  '''
  Container(
    key: ${getValueKeyComponentString(widgetINSTANCE, name: json['name'])},
    decoration: BoxDecoration(
      color: ${bgColor ?? getColorFromFills(json)},
      border: ${getBorder(json)},
      borderRadius: ${getBorderRadius(json)},
      boxShadow: ${getBoxShadow(json)},
    ),
    padding: ${getPadding(json)},
    child: $widget,
    height: $height,
  )
  '''
  );

}
