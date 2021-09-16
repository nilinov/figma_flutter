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
    debugPrintWidget("SvgPicture",
        level: level, name: json['name'], json: json);
    return getSvg(json);
  } else if (json['png'] != null) {
    return getImage(json, level + 1);
  }

  String _name = json['name'] ?? name ?? '';

  if (_name.contains('status bar')) {
    return null;
  }

  switch (json['type']) {
    case 'COMPONENT':
      var variables = getAllVariables(json, inCodeVariable: false);
      var variablesSource = getAllVariables(json, inCodeVariable: true);

      var widget =
          getChildrenByLayoutMode(json, level + 1, variables: variables);
      var widgetSource =
          getChildrenByLayoutMode(json, level + 1, variables: variablesSource);
      debugPrintWidget("Container",
          level: level, name: json['name'], json: json);

      String nameComponent = ((name ?? json['name'] ?? '') as String).pascalCase;
      String nameSource = ((json['name'] ?? name ?? '') as String).pascalCase;

      if (parent != null && isExpanded(parent, json)) {
        return wrapExpanded(widget, level: level, json: json);
      }

      SizeWidget size =
          parent != null ? getSize(parent, json) : SizeWidget.empty();

      // if (level == 0) {
      //   w = toDouble(json['width']);
      //   h = toDouble(json['width']);
      // }
      //
      final item = wrapContainer(widget, json, nameComponent,
          color: Colors.white,
          type: 'wrap-component',
          width: size.w,
          height: size.h);
      final itemSource = wrapContainer(widgetSource, json, nameSource,
          color: Colors.white,
          type: 'wrap-component',
          width: size.w,
          height: size.h);

      return GWidget(
        item.widget,
        type: item.type,
        code: '''
          ${nameSource}(${variablesSource.map((e) => e.defaultValue != null ? "${e.name}: \"${e.defaultValue}\"" : "${e.name}").join(', ')})
        ''',
        widgetType: nameSource,
        components: [
          GWidget(
            itemSource.widget,
            type: "${itemSource.type}-source",
            widgetType: "${itemSource.type}-source",
            code: itemSource.code,
            components: [itemSource],
            children: [itemSource],
            name: nameSource,
            variables: variablesSource,
          ),
        ],
        children: [
          GWidget(
            itemSource.widget,
            type: "${itemSource.type}-source",
            widgetType: "${itemSource.type}-source",
            code: itemSource.code,
            components: [itemSource],
            children: [itemSource],
            name: nameSource,
            variables: variablesSource,
          ),
        ],
        name: "${nameComponent}",
      );
    case 'RECTANGLE':
      var widget = (getChildrenByLayoutMode(json, level + 1));
      if (widget == null) return null;

      debugPrintWidget("Container",
          level: level, name: json['name'], json: json);

      return wrapContainer(widget, json, _name, type: 'rectangle');

    case 'VECTOR':
      debugPrintWidget("SvgPicture",
          level: level, name: json['name'], json: json);
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
        widgetType: 'SvgPicture',
        components: [],
        children: [],
      );
    case 'TEXT':
      return getText(json, level + 1, variables: variables);
    case 'FRAME':
      GWidget widget = getChildrenByLayoutMode(json, level + 1);

      if (parent != null && isExpanded(parent, json)) {
        return widget;
      }

      double? w;
      double? h;

      if (parent != null &&
          (isExpandedWidth(parent, json) || isExpandedHeight(parent, json))) {
        w = !isExpandedWidth(parent, json) ? toDouble(json['width']) : null;
        h = !isExpandedHeight(parent, json) ? toDouble(json['height']) : null;
      }

      if (isAutoLayout(json) && isVertical(json)) {
        if (!isPrimaryAxisSizingModeAuto(json)) {
          h = toDouble(json['height']);
        }
      }

      GWidget container = wrapContainer(widget, json, _name,
          type: 'frame', width: w, height: h);

      return container;
    case 'INSTANCE':
      return getInstanceByName(json, level);
    case 'GROUP':
      final item = (getChildrenByLayoutMode(json, level + 1));

      debugPrintWidget("Container",
          level: level, name: json['name'], json: json);

      final widget = wrapContainer(item, json, _name, type: 'GROUP');

      if ((isPrimaryAxisSizingModeFixed(json) &&
              isCounterAxisSizingModeFixed(json)) ||
          (json['primaryAxisSizingMode'] == null &&
              json['counterAxisSizingMode'] == null)) {
        double? w;
        double? h;

        if (!isStretch(json)) {
          w = toDouble(json['width']);
        }

        if (!isGrow(json)) {
          h = toDouble(json['height']);
        }

        return GWidget(
          SizedBox(child: widget.widget, height: h, width: w),
          code:
              '''SizedBox(child: ${widget.code}, height: ${toDouble(json['height'])}, width: ${toDouble(json['width'])})''',
          components: [
            GWidget(widget.widget,
                code: widget.code,
                type: 'wrap-stack-sizedbox',
                widgetType: 'SizedBox-source',
                components: [widget],
                children: [widget],
            )
          ],
          children: [
            GWidget(widget.widget,
                code: widget.code,
                type: 'wrap-stack-sizedbox',
                widgetType: 'SizedBox-source',
                components: [widget],
                children: [widget],
            )
          ],
          name: _name,
          type: 'wrap-stack-sizedbox',
          widgetType: 'SizedBox',
        );
      }

      return GWidget(
        Expanded(child: widget.widget),
        code: ''' Expanded(child: ${widget.code})''',
        components: [
          GWidget(
            widget.widget,
            code: widget.code,
            type: 'expanded',
            widgetType: 'Expanded-source',
            components: [widget],
            children: [widget],
          )
        ],
        children: [
          GWidget(
            widget.widget,
            code: widget.code,
            type: 'expanded',
            widgetType: 'Expanded-source',
            components: [widget],
            children: [widget],
          )
        ],
        name: _name,
        type: 'expanded',
        widgetType: 'Expanded',
      );
    case 'LINE':
      debugPrintWidget("Container",
          level: level, name: json['name'], json: json);

      if (json['rotation'] == 0 || json['rotation'] == 180) {
        return GWidget(
          Divider(color: getColorFromFills(json)),
          code: '''Divider(color: ${getColorFromFillsString(json)})''',
          name: _name,
          type: 'line',
          widgetType: 'Divider',
          components: [],
          children: [],
        );
      }

      if (json['rotation'] == 90 || json['rotation'] == 270) {
        return GWidget(
          VerticalDivider(color: getColorFromFills(json)),
          code: '''VerticalDivider(color: ${getColorFromFillsString(json)})''',
          name: _name,
          components: [],
          children: [],
          type: 'line',
          widgetType: 'VerticalDivider',
        );
      }

      return null;
    case 'ELLIPSE':
      debugPrintWidget("Ellipse", level: level, name: json['name'], json: json);

      return wrapContainer(
          GWidget(
            SizedBox(),
            components: [],
            children: [],
            type: 'empty space sizedbox',
            widgetType: "SizedBox",
          ),
          json,
          _name,
          type: 'Circle',
          shape: BoxShape.circle);

    default:
      return null;
  }
}
