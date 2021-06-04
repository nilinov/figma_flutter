import 'package:flutter_visible/imports.dart';
import 'package:flutter_visible/utils/get_instance_by_name.dart';

Widget? getWidgetByMap(Map<String, dynamic> json, int level, { List<Variable?>? variables }) {
  if (json['visible'] == false || json['isMask'] == true || json['visible'] == false) {
    return null;
  }

  if (json['svg'] != null) {
    debugPrintWidget("SvgPicture", level: level, name: json['name']);
    return SvgPicture.string(
      json['svg'],
      key: getValueKeyImage(json['svg'], type: 'SVG', name: json['name']),
      height: json['height'],
      width: json['width'],
    );
  } else if (json['png'] != null) {
    debugPrintWidget("Image", level: level, name: json['name']);

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
      debugPrintWidget("Container", level: level, name: json['name']);

      return Container(
        key: getValueKeyComponent(widget, name: json['name']),
        decoration: BoxDecoration(
          // color: getColorFromFills(json),
          color: Colors.white,
          border: getBorder(json),
          borderRadius: getBorderRadius(json),
          boxShadow: getBoxShadow(json),
        ),
        padding: getPadding(json),
        child: widget,
      );
    case 'RECTANGLE':
      var widget = (getChildrenByLayoutMode(json, level + 1));
      if (widget == null) return null;

      debugPrintWidget("Container", level: level, name: json['name']);
      return Container(
        key: ValueKey("RECTANGLE:${json['name']}"),
        width: json['width'],
        height: json['height'],
        decoration: BoxDecoration(
          color: getColorFromFills(json),
          border: getBorder(json),
          borderRadius: getBorderRadius(json),
          boxShadow: getBoxShadow(json),
        ),
        child: widget,
      );
    case 'VECTOR':
      debugPrintWidget("SvgPicture", level: level, name: json['name']);
      return SvgPicture.string(
        json['svg'],
        key: getValueKeyImage(json['svg'], type: 'SVG', name: json['name']),
        height: json['height'],
        width: json['width'],
      );
    case 'TEXT':
      return getText(json, level + 1, variables: variables);
    case 'FRAME':
      final widget = getChildrenByLayoutMode(json, level + 1);

      if (widget == null) return null;

      debugPrintWidget("Container", level: level, name: json['name']);

      double? height;
      double? width;

      if (level == 0 || json['layoutMode'] == 'NONE') {
        height = json['height'];
        width = json['width'];
      } else if (json['layoutMode'] == 'HORIZONTAL') {
        if (json['primaryAxisSizingMode'] == 'FIXED' && json['layoutGrow'] == 0) {
          // fixed h
          height = json['height'];
        } else if (json['primaryAxisSizingMode'] == 'FIXED' && json['layoutGrow'] == 1) {
          // fill h
          height = double.infinity;
        } else if (json['primaryAxisSizingMode'] == 'AUTO') {
          // hug h
        }

        if (json['layoutAlign'] == 'INHERIT' && json['counterAxisSizingMode'] == 'FIXED') {
          //fixed w
          width = json['width'];
        } else if (json['layoutAlign'] == 'STRETCH' && json['counterAxisSizingMode'] == 'FIXED') {
          //fill w
          width = double.infinity;
        } else if (json['layoutAlign'] == 'INHERIT' && json['counterAxisSizingMode'] == 'AUTO') {
          //hug w
        }
      }

      if (json['primaryAxisSizingMode'] == 'FIXED') {
        width = json['width'];
      }

      if (json['counterAxisSizingMode'] == 'FIXED') {
        height = json['height'];
      }

      print('---------------------');
      print("${json['name']} ${json['primaryAxisSizingMode']} ${json['primaryAxisSizingMode']} $width $height");

      return Container(
        key: ValueKey("FRAME:${json['name']} ($level) ${json['id']}"),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: getColorFromFills(json),
          border: getBorder(json),
          borderRadius: getBorderRadius(json),
          boxShadow: getBoxShadow(json),
        ),
        padding: getPadding(json),
        child: widget,
      );
    case 'INSTANCE':
      return getInstanceByName(json, level);
    case 'GROUP':
      Widget? item = (getChildrenByLayoutMode(json, level + 1));

      if (item == null) return null;

      debugPrintWidget("Container", level: level, name: json['name']);

      final widget = Container(
        key: ValueKey("GROUP:${json['name']}"),
        decoration: BoxDecoration(
          color: getColorFromFills(json),
          border: getBorder(json),
          borderRadius: getBorderRadius(json),
          boxShadow: getBoxShadow(json),
        ),
        padding: getPadding(json),
        child: item,
      );

      if ((json['primaryAxisSizingMode'] == 'FIXED' && json['counterAxisSizingMode'] == 'FIXED') || (json['primaryAxisSizingMode'] == null && json['counterAxisSizingMode'] == null)) {
        return SizedBox(child: widget, height: json['height'], width: json['width']);
      }


      return Expanded(
        child: widget,
      );
    case 'LINE':
      debugPrintWidget("Container", level: level, name: json['name']);

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
