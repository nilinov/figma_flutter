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

  final decorationString = '''
        decoration: BoxDecoration(
        ${wrapProp('color', color ?? getColorFromFillsString(json))}
        ${wrapProp('border', getBorder(json))}
        ${wrapProp('borderRadius', getBorderRadiusString(json))}
        ${wrapProp('boxShadow', getBoxShadowString(json))}
      )
''';

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
      decoration: $decorationString,
      ${wrapProp('padding', getPaddingString(json))}
      child: ${widget.code},
    )''',
      components: [widget],
      name: _name,
      type: type,
      widgetType: "Container",
      props: {
        if (width != null) 'width': width.toString(),
        if (height != null) 'height': height.toString(),
        if (getPaddingString(json) != null) 'padding': getPaddingString(json),
        'decoration': decorationString,
      });
}
