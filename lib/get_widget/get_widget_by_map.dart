import 'package:flutter_visible/ext.dart';
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
      \'''${json['svg']}\''',
      key: ${getValueKeyImageString(json['svg'], type: 'SVG', name: json['name'])},
      height: ${json['height']},
      width: ${json['width']},
    )''',
        type: 'svg-image');
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
      \'''${base64Decode(json['png'])}\''',
      key: ${getValueKeyImageString(json['png'], type: 'PNG', name: json['name'])},
      height: ${json['height']},
      width: ${json['width']},
    )''',
        type: 'png-image');
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
              border: getBorder(json).border,
              borderRadius: getBorderRadius(json),
              boxShadow: getBoxShadow(json),
            ),
            padding: getPadding(json),
            child: widget.widget,
          ),
          '''Container(
        key: ${getValueKeyComponentString(widget.widget, name: json['name'])},
        decoration: BoxDecoration(
          color: Colors.white,
          ${wrapProp('border', getBorder(json))}
          ${wrapProp('borderRadius', getBorderRadiusString(json))}
          ${wrapProp('boxShadow', getBoxShadowString(json))}
        ),
        ${wrapProp('padding', getPadding(json))}
        child: ${widget.code},
      )''',
          components: [widget],
          type: 'component');
    case 'RECTANGLE':
      var widget = (getChildrenByLayoutMode(json, level + 1));
      if (widget == null) return null;

      debugPrintWidget("Container", level: level, name: json['name']);
      return GWidget(
          Container(
            key: getValueKeyComponent(widget.widget, name: json['name']),
            width: json['width'],
            height: json['height'],
            decoration: BoxDecoration(
              color: getColorFromFills(json),
              border: getBorder(json).border,
              borderRadius: getBorderRadius(json),
              boxShadow: getBoxShadow(json),
            ),
            child: widget.widget,
          ),
          '''Container(
            key: ${getValueKeyComponentString(widget.widget, name: json['name'])},
            width: ${json['width']},
            height: ${json['height']},
            decoration: BoxDecoration(
              ${wrapProp('color', getColorFromFillsString(json))}
              ${wrapProp('border', getBorder(json))}
              ${wrapProp('borderRadius', getBorderRadiusString(json))}
              ${wrapProp('boxShadow', getBoxShadowString(json))}
            ),
            child: ${widget.code},
          )''',
          components: [widget],
          type: 'rectangle');
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
        key: ${getValueKeyImageString(json['svg'], type: 'SVG', name: json['name'])},
            width: ${json['width']},
            height: ${json['height']},
      )''',
          type: 'svg-image');
    case 'TEXT':
      return getText(json, level + 1, variables: variables);
    case 'FRAME':
      final widget = getChildrenByLayoutMode(json, level + 1);

      if (widget == null) return null;

      bool expanded = false;

      debugPrintWidget("Container", level: level, name: json['name']);

      double? height;
      double? width;
      var name = json['name'];

      if (level == 0 || json['layoutMode'] == 'NONE') {
        height = json['height'];
        width = json['width'];
      } else if (isHorizontal(json)) {
        if (isPrimaryAxisSizingModeFixed(json) &&
            layoutGrow(json) == 0) {
          // fixed h
          height = json['height'];
        } else if (isPrimaryAxisSizingModeFixed(json) && layoutGrow(json) == 1) {
          // fill h
          height = double.infinity;
        } else if (isPrimaryAxisSizingModeAuto(json)) {
          // hug h
        }

        if (isStretch(json) && isCounterAxisSizingModeFixed(json)) {
          //fill w
          width = double.infinity;
        }
      }

      if (isPrimaryAxisSizingModeFixed(json)) {
        // fixed w
        width = json['width'];
      }

      if (isCounterAxisSizingModeFixed(json)) {
        height = json['height'];
      }

      GWidget container = GWidget(
          Container(
            key: getValueKeyComponent(widget.widget,
                name: "FRAME:${json['name']} ($level) ${json['id']}"),
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: getColorFromFills(json),
              border: getBorder(json).border,
              borderRadius: getBorderRadius(json),
              boxShadow: getBoxShadow(json),
            ),
            padding: getPadding(json),
            child: widget.widget,
          ),
          '''
      Container(
        key: ${getValueKeyComponentString(widget.widget, name: "FRAME:${json['name']} ($level) ${json['id']}")},
        width: $width,
        height: $height,
        decoration: BoxDecoration(
          ${wrapProp('color', getColorFromFillsString(json))}
          ${wrapProp('border', getBorder(json))}
          ${wrapProp('borderRadius', getBorderRadiusString(json))}
          ${wrapProp('boxShadow', getBoxShadowString(json))}
        ),
        ${wrapProp('padding', getPadding(json))}
        child: ${widget.code},
      )
      ''',
          components: [widget],
          type: 'frame');

      return container;
    case 'INSTANCE':
      return getInstanceByName(json, level);
    case 'GROUP':
      final item = (getChildrenByLayoutMode(json, level + 1));

      debugPrintWidget("Container", level: level, name: json['name']);

      final widget = Container(
        key: getValueKeyComponent(item.widget, name: "GROUP:${json['name']}"),
        decoration: BoxDecoration(
          color: getColorFromFills(json),
          border: getBorder(json).border,
          borderRadius: getBorderRadius(json),
          boxShadow: getBoxShadow(json),
        ),
        padding: getPadding(json),
        child: item.widget,
      );

      final widgetCode = '''
      Container(
        key: ${getValueKeyComponentString(item.widget, name: "GROUP:${json['name']}")},
        decoration: BoxDecoration(
          ${wrapProp('color', getColorFromFillsString(json))}
          ${wrapProp('border', getBorder(json))}
          ${wrapProp('borderRadius', getBorderRadiusString(json))}
          ${wrapProp('boxShadow', getBoxShadowString(json))}
        ),
        ${wrapProp('padding', getPadding(json))}
        child: item.widget,
      )''';

      if ((isPrimaryAxisSizingModeFixed(json) &&
              isCounterAxisSizingModeFixed(json)) ||
          (json['primaryAxisSizingMode'] == null &&
              json['counterAxisSizingMode'] == null)) {
        return GWidget(
            SizedBox(
                child: widget, height: json['height'], width: json['width']),
            '''SizedBox(child: $widgetCode, height: ${json['height']}, width: ${json['width']})''',
            components: [
              GWidget(widget, widgetCode, type: 'wrap-stack-sizedbox')
            ],
            type: 'wrap-stack-sizedbox');
      }

      return GWidget(
          Expanded(child: widget), ''' Expanded(child: $widgetCode)''',
          components: [GWidget(widget, widgetCode, type: 'expanded')],
          type: 'expanded');
    case 'LINE':
      debugPrintWidget("Container", level: level, name: json['name']);

      if (json['rotation'] == 0 || json['rotation'] == 180) {
        return GWidget(Divider(color: getColorFromFills(json)),
            '''Divider(color: ${getColorFromFills(json)})''',
            type: 'line');
      }

      if (json['rotation'] == 90 || json['rotation'] == 270) {
        return GWidget(VerticalDivider(color: getColorFromFills(json)),
            '''VerticalDivider(color: ${getColorFromFills(json)})''',
            type: 'line');
      }

      return null;

    default:
      return null;
  }
}
