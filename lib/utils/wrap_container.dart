import 'package:flutter_visible/ext.dart';
import 'package:flutter_visible/imports.dart';

GWidget<Container> wrapContainer(GWidget<Widget> widget, Map<String, dynamic> json, String _name) {
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
    code: '''Container(
      decoration: BoxDecoration(
        color: Colors.white,
        ${wrapProp('border', getBorder(json))}
        ${wrapProp('borderRadius', getBorderRadiusString(json))}
        ${wrapProp('boxShadow', getBoxShadowString(json))}
      ),
      ${wrapProp('padding', getPaddingString(json))}
      child: ${widget.code},
    )''',
    components: [widget],
    name: _name,
    type: 'component',
  );
}
