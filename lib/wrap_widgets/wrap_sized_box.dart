import 'package:flutter_visible/ext.dart';
import 'package:flutter_visible/imports.dart';

GWidget wrapSizedBox(GWidget widget, {double? width, double? height}) {
  return GWidget(
    SizedBox(child: widget.widget, width: width, height: height),
    code: '''SizedBox(child: ${widget.code}, ${wrapProp('width', width)} ${wrapProp('height', height)})''',
    components: [widget],
    children: [widget],
    type: 'sizedbox-fill-width',
    widgetType: 'SizedBox',
    props: {
      'width': width?.toString() ?? '',
      'height': height?.toString() ?? '',
    }
  );
}
