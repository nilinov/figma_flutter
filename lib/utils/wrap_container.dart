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
}) {
  return GWidget(
    Container(
      key: getValueKeyComponent(widget.widget, name: json['name']),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? getColorFromFills(json),
        border: getBorder(json).border,
        borderRadius: getBorderRadius(json),
        boxShadow: getBoxShadow(json),
      ),
      padding: getPadding(json),
      child: widget.widget,
    ),
    code: '''Container(
      ${wrapProp('width', width)}
      ${wrapProp('height', height)}
      decoration: BoxDecoration(
        ${wrapProp('color', color ?? getColorFromFillsString(json))}
        ${wrapProp('border', getBorder(json))}
        ${wrapProp('borderRadius', getBorderRadiusString(json))}
        ${wrapProp('boxShadow', getBoxShadowString(json))}
      ),
      ${wrapProp('padding', getPaddingString(json))}
      child: ${widget.code},
    )''',
    components: [widget],
    name: _name,
    type: type,
  );
}
