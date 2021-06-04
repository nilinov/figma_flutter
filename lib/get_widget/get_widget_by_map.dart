import 'package:flutter_visible/imports.dart';
import 'package:flutter_visible/utils/get_instance_by_name.dart';

GWidget? getWidgetByMap(Map<String, dynamic> json, int level,
    {List<Variable?>? variables}) {
  if (json['visible'] == false ||
      json['isMask'] == true ||
      json['visible'] == false) {
    return null;
  }

  if (json['svg'] != null) {
    debugPrintWidget("SvgPicture", level: level, name: json['name']);
    return GWidget(
        SvgPicture.string(
          json['svg'],
          key: getValueKeyImage(json['svg'], type: 'SVG', name: json['name']),
          height: json['height'],
          width: json['width'],
        ),
        '''SvgPicture.string(
      json['svg'],
      key: getValueKeyImage(json['svg'], type: 'SVG', name: json['name']),
      height: json['height'],
      width: json['width'],
    )''');
  } else if (json['png'] != null) {
    debugPrintWidget("Image", level: level, name: json['name']);

    return GWidget(
        Image.memory(
          base64Decode(json['png']),
          key: getValueKeyImage(json['png'], type: 'PNG', name: json['name']),
          height: json['height'],
          width: json['width'],
        ),
        '''Image.memory(
      base64Decode(json['png']),
      key: getValueKeyImage(json['png'], type: 'PNG', name: json['name']),
      height: json['height'],
      width: json['width'],
    )''');
  }

  switch (json['type']) {
    case 'COMPONENT':
      var widget = getChildrenByLayoutMode(json, level + 1);
      debugPrintWidget("Container", level: level, name: json['name']);

      return GWidget(
          Container(
            key: getValueKeyComponent(widget.widget, name: json['name']),
            decoration: BoxDecoration(
              // color: getColorFromFills(json),
              color: Colors.white,
              border: getBorder(json),
              borderRadius: getBorderRadius(json),
              boxShadow: getBoxShadow(json),
            ),
            padding: getPadding(json),
            child: widget.widget,
          ),
          '''Container(
        key: ${getValueKeyComponent(widget.widget, name: json['name'])},
        decoration: BoxDecoration(
          color: Colors.white,
          border: ${getBorderString(json)},
          borderRadius: ${getBorderRadiusString(json)},
          boxShadow: ${getBoxShadowString(json)},
        ),
        padding: getPadding(json),
        child: widget,
      )''');
    case 'RECTANGLE':
      var widget = (getChildrenByLayoutMode(json, level + 1));
      if (widget == null) return null;

      debugPrintWidget("Container", level: level, name: json['name']);
      return GWidget(
          Container(
            key: ValueKey("RECTANGLE:${json['name']}"),
            width: json['width'],
            height: json['height'],
            decoration: BoxDecoration(
              color: getColorFromFills(json),
              border: getBorder(json),
              borderRadius: getBorderRadius(json),
              boxShadow: getBoxShadow(json),
            ),
            child: widget.widget,
          ),
          '''Container(
            key: ${ValueKey("RECTANGLE:${json['name']}")},
            width: ${json['width']},
            height: ${json['height']},
            decoration: BoxDecoration(
              color: ${getColorFromFillsString(json)},
              border: ${getBorderString(json)},
              borderRadius: ${getBorderRadiusString(json)},
              boxShadow: ${getBoxShadowString(json)},
            ),
            child: widget,
          )''');
    case 'VECTOR':
      debugPrintWidget("SvgPicture", level: level, name: json['name']);
      return GWidget(
          SvgPicture.string(
            json['svg'],
            key: getValueKeyImage(json['svg'], type: 'SVG', name: json['name']),
            height: json['height'],
            width: json['width'],
          ),
          '''SvgPicture.string(
        ${json['svg']},
        key: ${getValueKeyImage(json['svg'], type: 'SVG', name: json['name'])},
            width: ${json['width']},
            height: ${json['height']},
      )''');
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
        if (json['primaryAxisSizingMode'] == 'FIXED' &&
            json['layoutGrow'] == 0) {
          // fixed h
          height = json['height'];
        } else if (json['primaryAxisSizingMode'] == 'FIXED' &&
            json['layoutGrow'] == 1) {
          // fill h
          height = double.infinity;
        } else if (json['primaryAxisSizingMode'] == 'AUTO') {
          // hug h
        }

        if (json['layoutAlign'] == 'INHERIT' &&
            json['counterAxisSizingMode'] == 'FIXED') {
          //fixed w
          width = json['width'];
        } else if (json['layoutAlign'] == 'STRETCH' &&
            json['counterAxisSizingMode'] == 'FIXED') {
          //fill w
          width = double.infinity;
        } else if (json['layoutAlign'] == 'INHERIT' &&
            json['counterAxisSizingMode'] == 'AUTO') {
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
      print(
          "${json['name']} ${json['primaryAxisSizingMode']} ${json['primaryAxisSizingMode']} $width $height");

      return GWidget(
          Container(
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
            child: widget.widget,
          ),
          '''
      Container(
        key: ${ValueKey("FRAME:${json['name']} ($level) ${json['id']}")},
        width: $width,
        height: $height,
        decoration: BoxDecoration(
          color: ${getColorFromFillsString(json)},
          border: ${getBorderString(json)},
          borderRadius: ${getBorderRadiusString(json)},
          boxShadow: ${getBoxShadowString(json)},
        ),
        padding: ${getPadding(json)},
        child: ${widget.code},
      )
      ''');
    case 'INSTANCE':
      return GWidget(getInstanceByName(json, level), getInstanceByName(json, level).toString());
    case 'GROUP':
      final item = (getChildrenByLayoutMode(json, level + 1));

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
        child: item.widget,
      );

      final widgetCode = '''
      Container(
        key: ${ValueKey("GROUP:${json['name']}")},
        decoration: BoxDecoration(
          color: getColorFromFills(json),
          border: getBorder(json),
          borderRadius: getBorderRadius(json),
          boxShadow: getBoxShadow(json),
        ),
        padding: getPadding(json),
        child: item.widget,
      )''';

      if ((json['primaryAxisSizingMode'] == 'FIXED' &&
              json['counterAxisSizingMode'] == 'FIXED') ||
          (json['primaryAxisSizingMode'] == null &&
              json['counterAxisSizingMode'] == null)) {
        return GWidget(
            SizedBox(
                child: widget, height: json['height'], width: json['width']),
            '''SizedBox(child: $widgetCode, height: ${json['height']}, width: ${json['width']})''');
      }

      return GWidget(
        Expanded(child: widget),
        ''' Expanded(child: $widgetCode)''',
      );
    case 'LINE':
      debugPrintWidget("Container", level: level, name: json['name']);

      if (json['rotation'] == 0 || json['rotation'] == 180) {
        return GWidget(Divider(color: getColorFromFills(json)), '''Divider(color: ${getColorFromFills(json)})''');
      }

      if (json['rotation'] == 90 || json['rotation'] == 270) {
        return GWidget(VerticalDivider(color: getColorFromFills(json)), '''VerticalDivider(color: ${getColorFromFills(json)})''');
      }

      return null;

    default:
      return null;
  }
}
