import 'package:flutter_visible/ext.dart';
import 'package:flutter_visible/imports.dart';

GWidget<Container> wrapContainer(
  GWidget<Widget> widget,
  Map<String, dynamic> json,
  String _name, {
  Color? color,
  String type = 'component',
  double? height,
  double? width,
  BoxShape shape = BoxShape.rectangle,
}) {
  String decorationString = getDecorationString(color, json);

  return GWidget(
      Container(
        key:
            getValueKeyComponent(widget.widget, name: json['name'], desc: type),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? getColorFromFills(json),
          border: getBorder(json).border,
          borderRadius: getBorderRadius(json),
          boxShadow: getBoxShadow(json),
          shape: shape,
        ),
        padding: getPadding(json),
        child: widget.widget,
      ),
      code: '''Container(
      ${wrapProp('width', toDouble(width))}
      ${wrapProp('height', toDouble(height))}
      ${wrapProp('decoration', decorationString)}
      ${wrapProp('padding', getPaddingString(json))}
      child: ${widget.code},
    )''',
      components: [widget],
      children: [widget],
      name: _name,
      type: type,
      widgetType: "Container",
      props: {
        if (width != null) 'width': width.toString(),
        if (height != null) 'height': height.toString(),
        if (getPaddingString(json) != '') 'padding': getPaddingString(json),
        'decoration': decorationString,
      });
}

String getDecorationString(Color? color, Map<String, dynamic> json) {
  var flag = false;

  final _color = color?.toString() ?? getColorFromFillsString(json);
  final border = getBorder(json);
  final borderRadiusString = getBorderRadiusString(json);
  final boxShadowString = getBoxShadowString(json);

  if (_color != 'Colors.transparent') flag = true;
  if (!border.isEmpty) flag = true;
  if (borderRadiusString != null) flag = true;
  if (boxShadowString != null) flag = true;

  if (!flag) return "";

  final decorationString = '''
        BoxDecoration(
        ${wrapProp('color', _color)}
        ${wrapProp('border', border)}
        ${wrapProp('borderRadius', borderRadiusString)}
        ${wrapProp('boxShadow', boxShadowString)}
      )
  ''';
  return decorationString;
}
