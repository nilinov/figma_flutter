import 'package:flutter_visible/imports.dart';
import 'package:flutter_visible/utils/get_instance_by_name.dart';

GWidget? getWidgetByMap(Json json, int level,
    {List<Variable?>? variables, String? name, Json? parent}) {
  if (json['visible'] == false ||
      json['isMask'] == true ||
      json['visible'] == false) {
    return null;
  }

  if (json['svg'] != null) {
    debugPrintWidget("SvgPicture", level: level, name: json['name']);
    return getSvg(json);
  } else if (json['png'] != null) {
    debugPrintWidget("Image", level: level, name: json['name']);

    final pngImage = Image.memory(
      base64Decode(json['png']),
      key: getValueKeyImage(json['png'], type: 'PNG', name: json['name']),
      height: toDouble(json['height']),
      width: toDouble(json['width']),
    );
    final name = getNameByJson(json);

    return GWidget(pngImage,
        code: '''Image.asset(AppImages.${name})''',
        type: 'png-image',
        name: name,
        components: [
          GWidget(pngImage,
              type: 'png-source',
              fullCode: base64Decode(json['png']),
              name: name,
              components: [],
              fileName: "${name}.png")
        ]);
  }

  String _name = json['name'] ?? name ?? '';

  switch (json['type']) {
    case 'COMPONENT':
      var variables = getAllVariables(json, inCodeVariable: false);
      var variablesSource = getAllVariables(json, inCodeVariable: true);

      var widget =
      getChildrenByLayoutMode(json, level + 1, variables: variables);
      var widgetSource =
      getChildrenByLayoutMode(json, level + 1, variables: variablesSource);
      debugPrintWidget("Container", level: level, name: json['name']);

      String nameComponent = name ?? json['name'] ?? '';
      String nameSource = json['name'] ?? name ?? '';

      final item = wrapContainer(widget, json, nameComponent,
          color: Colors.white, type: 'wrap-component');
      final itemSource = wrapContainer(widgetSource, json, nameSource,
          color: Colors.white, type: 'wrap-component');

      return GWidget(
        item.widget,
        type: item.type,
        code: '''
          $nameSource(${variablesSource.map((e) => e.defaultValue != null ? "${e.name}: \"${e.defaultValue}\"" : "${e.name}").join(', ')})
        ''',
        components: [
          GWidget(
            itemSource.widget,
            type: "${itemSource.type}-source",
            code: itemSource.code,
            components: [itemSource],
            name: nameSource,
            variables: variablesSource,
          ),
        ],
        name: "${nameComponent}",
      );
    case 'RECTANGLE':
      var widget = (getChildrenByLayoutMode(json, level + 1));
      if (widget == null) return null;

      debugPrintWidget("Container", level: level, name: json['name']);

      return wrapContainer(widget, json, _name, type: 'rectangle');

    case 'VECTOR':
      debugPrintWidget("SvgPicture", level: level, name: json['name']);
      return GWidget(
        SvgPicture.string(
          json['svg'],
          key: getValueKeyImage(json['svg'], type: 'SVG', name: json['name']),
          height: json['height'],
          width: json['width'],
        ),
        code: '''SvgPicture.string(
        ${json['svg']},
            width: ${toDouble(json['width'])},
            height: ${toDouble(json['height'])},
      )''',
        type: 'svg-image',
        components: [],
      );
    case 'TEXT':
      return getText(json, level + 1, variables: variables);
    case 'FRAME':
      GWidget widget = getChildrenByLayoutMode(json, level + 1);

      double? height;
      double? width;
      bool isExpanded = false;

      if (/*level == 0 || */json['layoutMode'] == 'NONE') {
        height = toDouble(json['height']);
        width = toDouble(json['width']);
      } else if (isHorizontal(json)) {
        if (isPrimaryAxisSizingModeFixed(json) && layoutGrow(json) == 0) {
          // fixed h
          height = toDouble(json['height']);
        } else if (isPrimaryAxisSizingModeFixed(json) &&
            layoutGrow(json) == 1) {
          // fill h
          height = double.infinity;
        } else if (isPrimaryAxisSizingModeAuto(json)) {
          // hug h
        }

        if (isStretch(json) && isCounterAxisSizingModeFixed(json)) {
          //fill w
          if (parent != null && parent['layoutMode'] != 'NONE') {
            //Expanded
            width = null;
            isExpanded = true;
          } else {
            width = double.infinity;
          }
        }
      }

      if (isPrimaryAxisSizingModeFixed(json)) {
        if (parent != null && isHorizontal(parent)) {
          //Expanded
          width = null;
          isExpanded = true;
        } else if (parent != null && isVertical(parent)) {
          //fill width
          width = double.infinity;
        } else {
          // fixed w
          width = toDouble(json['width']);
        }
      }

      if (isCounterAxisSizingModeFixed(json)) {
        if (parent != null && isVertical(parent)) {
          //Expanded
          // width = null;
          // isExpanded = true;
        } else if (parent != null && isHorizontal(parent)) {
          //fill h
          height = double.infinity;
        } else {
          // fixed h
          // height = toDouble(json['height']);
        }
      }

      if (isExpanded) {
        return wrapExpanded(widget, level: level + 1, json: json);
        // return widget;
      }

      debugPrintWidget("Container", level: level, name: json['name']);
      GWidget container = wrapContainer(widget, json, _name,
          type: 'frame', height: height, width: width);

      return container;
    case 'INSTANCE':
      return getInstanceByName(json, level);
    case 'GROUP':
      final item = (getChildrenByLayoutMode(json, level + 1));

      debugPrintWidget("Container", level: level, name: json['name']);

      final widget = wrapContainer(item, json, _name, type: 'GROUP');

      if ((isPrimaryAxisSizingModeFixed(json) &&
          isCounterAxisSizingModeFixed(json)) ||
          (json['primaryAxisSizingMode'] == null &&
              json['counterAxisSizingMode'] == null)) {
        return GWidget(
            SizedBox(
                child: widget.widget,
                height: toDouble(json['height']),
                width: toDouble(json['width'])),
            code:
            '''SizedBox(child: ${widget.code}, height: ${toDouble(json['height'])}, width: ${toDouble(json['width'])})''',
            components: [
              GWidget(widget.widget,
                  code: widget.code,
                  type: 'wrap-stack-sizedbox',
                  components: [widget])
            ],
            name: _name,
            type: 'wrap-stack-sizedbox');
      }

      return GWidget(Expanded(child: widget.widget),
          code: ''' Expanded(child: ${widget.code})''',
          components: [
            GWidget(widget.widget,
                code: widget.code, type: 'expanded', components: [widget])
          ],
          name: _name,
          type: 'expanded');
    case 'LINE':
      debugPrintWidget("Container", level: level, name: json['name']);

      if (json['rotation'] == 0 || json['rotation'] == 180) {
        return GWidget(
          Divider(color: getColorFromFills(json)),
          code: '''Divider(color: ${getColorFromFillsString(json)})''',
          name: _name,
          type: 'line',
          components: [],
        );
      }

      if (json['rotation'] == 90 || json['rotation'] == 270) {
        return GWidget(VerticalDivider(color: getColorFromFills(json)),
            code:
            '''VerticalDivider(color: ${getColorFromFillsString(json)})''',
            name: _name,
            components: [],
            type: 'line');
      }

      return null;

    default:
      return null;
  }
}
