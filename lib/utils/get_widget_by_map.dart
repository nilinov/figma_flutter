import 'package:flutter_visible/imports.dart';

Widget getWidgetByMap(Map<String, dynamic> json, int level) {
  if (json['visible'] == false) {
    return null;
  }

  if (json['svg'] != null) {
    debugPrintWidget("SvgPicture", level: level);
    return SvgPicture.string(
      json['svg'],
      key: getValueKeyImage(json['svg'], type: 'SVG', name: json['name']),
      height: json['height'],
      width: json['width'],
    );
  } else if (json['png'] != null) {
    debugPrintWidget("Image", level: level);
    return Image.memory(
      base64Decode(json['png']),
      key: getValueKeyImage(json['png'], type: 'PNG', name: json['name']),
      height: json['height'],
      width: json['width'],
    );
  }

  switch (json['type']) {
    case 'COMPONENT':
      var widget = (getChildrenByLayoutMode(json, level + 1));
      if (widget == null) return null;
      debugPrintWidget("Container", level: level);

      return Container(
        key: getValueKeyComponent(widget, name: json['name']),
        decoration: BoxDecoration(
          // color: getColorFromFills(json),
          color: Colors.white,
          border: getBorder(json),
          borderRadius: getBorderRadius(json),
        ),
        child: widget,
      );
    case 'RECTANGLE':
      var widget = (getChildrenByLayoutMode(json, level + 1));
      if (widget == null) return null;

      debugPrintWidget("Container", level: level);
      return Container(
        key: ValueKey("RECTANGLE:${json['name']}"),
        width: json['width'],
        height: json['height'],
        decoration: BoxDecoration(
          color: getColorFromFills(json),
          border: getBorder(json),
          borderRadius: getBorderRadius(json),
        ),
        child: widget,
      );
    case 'VECTOR':
      debugPrintWidget("SvgPicture", level: level);
      return SvgPicture.string(
        json['svg'],
        key: getValueKeyImage(json['svg'], type: 'SVG', name: json['name']),
        height: json['height'],
        width: json['width'],
      );
    case 'TEXT':
      return getText(json, level + 1);
    case 'FRAME':
      final widget = getChildrenByLayoutMode(json, level + 1);

      if (widget == null) return null;

      debugPrintWidget("Container", level: level);
      return Container(
        // key: ValueKey("FRAME:${json['name']}"),
        width: json['width'],
        height: json['height'],
        decoration: BoxDecoration(
          color: getColorFromFills(json),
          border: getBorder(json),
          borderRadius: getBorderRadius(json),
        ),
        padding: getPadding(json),
        child: widget,
      );
    case 'INSTANCE':
      var widget = (getChildrenByLayoutMode(json, level + 1));
      if (widget == null) return null;

      debugPrintWidget("Container", level: level);

      Widget widgetINSTANCE = Container(
        key: getValueKeyComponent(null, name: json['name']),
        decoration: BoxDecoration(
          color: getColorFromFills(json),
          border: getBorder(json),
          borderRadius: getBorderRadius(json),
        ),
        padding: getPadding(json),
        child: widget,
      );

      return Container(
        key: getValueKeyComponent(widgetINSTANCE, name: json['name']),
        decoration: BoxDecoration(
          color: getColorFromFills(json),
          border: getBorder(json),
          borderRadius: getBorderRadius(json),
        ),
        padding: getPadding(json),
        child: widget,
      );
    case 'GROUP':
      Widget item = (getChildrenByLayoutMode(json, level + 1));
      print(item);

      if (item == null) return null;

      debugPrintWidget("Container", level: level);
      return Container(
        key: ValueKey("GROUP:${json['name']}"),
        decoration: BoxDecoration(
          color: getColorFromFills(json),
          border: getBorder(json),
          borderRadius: getBorderRadius(json),
        ),
        padding: getPadding(json),
        child: item,
      );
    case 'LINE':
      debugPrintWidget("Container", level: level);

      if (json['rotation'] == 0 || json['rotation'] == 180) {
        return Divider(color: getColorFromFills(json));
      }

      if (json['rotation'] == 90 || json['rotation'] == 270) {
        return VerticalDivider(color: getColorFromFills(json));
      }

      return null;

    default:
      return null;
  }
}
